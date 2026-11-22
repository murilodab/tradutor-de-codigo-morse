# Integração com hardware real — DE10-Lite + LCD 16x2 (HD44780)

Este documento cobre o que falta além do código pra rodar o projeto numa placa
DE10-Lite de verdade, com o display LCD 16x2 (HD44780 cru, sem adaptador
serial/I2C) ligado via GPIO.

## 1. Compilação completa

Até a sessão em que este documento foi escrito, só tinha sido validado
**Analysis & Synthesis** (front-end). Rodamos o fluxo completo
(`quartus_sh --flow compile`, que inclui Fitter + Timing Analyzer + Assembler)
pro dispositivo real do DE10-Lite:

- **Família**: MAX 10
- **Dispositivo**: `10M50DAF484C7G`

Sem nenhum arquivo `.sdc` de restrição de clock, o Timing Analyzer acusava
"Critical Warning: Timing requirements not met" com vários slacks negativos —
isso **não é um problema de design**, é só a ausência de uma restrição de
clock (sem ela, o Quartus não sabe que frequência o projeto deveria atingir,
então os números de slack não significam nada). Adicionando um `.sdc` mínimo:

```tcl
create_clock -name clock -period 20.000 [get_ports {clock}]
derive_clock_uncertainty
set_false_path -from [get_ports {reset btn_a btn_b}] -to [all_registers]
```

(20.000 ns = período de 50MHz; o `set_false_path` nos botões é porque eles já
passam por sincronizador/debounce antes de qualquer lógica, então não faz
sentido cobrar timing síncrono deles vindo de fora)

Resultado: **0 erros, 7 warnings** — o único warning relevante que sobrou é
sobre pinos sem atribuição de local exato (esperado, ver seção 2). Com esse
`.sdc`, a compilação completa gera o bitstream (`.sof`/`.pof`) sem erro nem
problema de timing real.

**Ação recomendada**: adicionar esse `.sdc` (ou equivalente) ao projeto real
antes de compilar pra gravar na placa.

## 2. Atribuição de pinos (Pin Planner)

Você não vai usar o display de 7 segmentos do DE10-Lite, só o LCD externo via
GPIO. Pinos necessários:

| Sinal (porta de `Sinalizador`) | Função | Onde no DE10-Lite |
|---|---|---|
| `clock` | Clock de 50MHz | `CLOCK_50` |
| `reset` | Reset geral | Um dos `KEY[1:0]` (push-button onboard) |
| `btn_a` | Botão de toque Morse | Switch ou botão externo |
| `btn_b` | Botão de fim de símbolo | Switch ou botão externo |
| `lcd_rs` | RS do LCD | 1 pino livre do header `GPIO_0` ou `GPIO_1` |
| `lcd_e` | E do LCD | 1 pino livre do header `GPIO_0` ou `GPIO_1` |
| `lcd_data(7:4)` | D4-D7 do LCD | 4 pinos livres do mesmo header |
| `disp_char` | Não usado (sem 7 segmentos) | Deixar sem atribuir — porta fica sem pino, sem problema |

**Atenção com os `KEY`/botões do DE10-Lite**: eles são **ativo-baixo**
(pressionado = nível `0`, solto = `1`, por pull-up já embutido na placa). Todo
o código deste projeto assume sinais **ativo-alto** (`reset='1'` = reset
ativo, `btn_a='1'` = botão pressionado). Então, ao ligar `KEY0` em `reset` (ou
um switch em `btn_a`/`btn_b`), é preciso **inverter o sinal** no topo:

```vhdl
reset <= not KEY0;
```

Esquecer essa inversão deixa o sistema permanentemente em reset (ou os
botões funcionando ao contrário).

**Não listei números de pino exatos** (tipo `PIN_xxx`) pros headers
`GPIO_0`/`GPIO_1` porque não tenho certeza suficiente de cor pra garantir que
não erro na fiação física — use a tabela oficial de pinos do DE10-Lite
(`DE10_LITE_Pin_Assignments.csv`, vem no CD-ROM/pacote de exemplos da
Terasic) pra escolher 6 pinos livres de um dos headers GPIO e atribuir no Pin
Planner do Quartus.

## 3. Fiação do LCD 16x2 (HD44780 cru)

| Pino do LCD | Liga em |
|---|---|
| VSS | GND |
| VDD | +5V |
| **VO (contraste)** | ver abaixo — **sem potenciômetro** |
| RS | `lcd_rs` |
| RW | **GND direto** (só escrita, sem checar flag de ocupado) |
| E | `lcd_e` |
| D4-D7 | `lcd_data(7 downto 4)` |
| D0-D3 | não conecta (modo 4 bits) |
| LED+ | +5V (confira se o módulo já tem resistor limitador embutido antes de ligar direto) |
| LED- | GND |

### VO sem potenciômetro

O potenciômetro existe pra ajustar o contraste manualmente, mas dá pra
substituir por um valor fixo:

- **Displays de backlight azul (o seu caso) costumam funcionar bem com VO
  ligado direto no GND** (contraste máximo) — é a solução mais simples e o
  "hack" mais comum pra esse tipo específico de display. Se o texto aparecer
  bom demais escuro/borrado, é só trocar por um resistor pequeno em série (ver
  abaixo).
- Se precisar ajustar: um resistor fixo de **1kΩ entre VO e GND** é um ponto
  de partida comum (gera um pouco de divisor de tensão com a impedância
  interna do LCD). Se o texto não aparecer, teste valores menores (até
  encostar em 0Ω/GND direto); se aparecer "sujo"/com segmentos fantasma, teste
  valores maiores.

Como é um ajuste que depende do lote específico do painel, não dá pra
calcular um valor exato sem testar na placa — comece com GND direto.

## 4. Nota sobre resistor de proteção em `lcd_e` (pull-down)

Levantamos a dúvida sobre usar um **resistor de pull-up** nas linhas de dados
pra resolver incompatibilidade de nível lógico (FPGA em 3.3V, HD44780
tipicamente especificado pra 5V). Esclarecendo: **um pull-up não resolve
isso** — `lcd_rs`/`lcd_e`/`lcd_data` são sinais **ativamente dirigidos** pela
FPGA (push-pull, não open-drain), então um resistor de pull-up pra 5V só
geraria disputa de corrente contra o driver da FPGA, sem elevar a tensão de
saída real. Na prática, a maioria dos módulos HD44780 aceita 3.3V como nível
alto válido mesmo com VDD em 5V (é a combinação mais comum em projetos com
FPGA/Arduino 3.3V), mas isso não foi testado fisicamente aqui — se o display
não responder, as alternativas reais são: alimentar o LCD em 3.3V em vez de
5V (mais simples, funciona na maioria dos módulos, só com brilho/contraste
reduzido), ou um level shifter de verdade (ex. `74LVC245`).

**O resistor que de fato é útil aqui é um pull-down em `lcd_e`, não um
pull-up** — e é uma proteção diferente, contra outro problema: durante a
configuração da FPGA (power-on, antes do bitstream carregar), os pinos de
I/O ficam em alta impedância (tri-state), flutuando. Se `lcd_e` flutuar
nesse período, o HD44780 pode enxergar pulsos de `E` espúrios e latchear lixo
aleatório do barramento de dados antes da FPGA sequer começar a rodar.

- **Valor calculado**: um pull-down de **10kΩ entre `lcd_e` e GND** é o
  padrão de mercado pra esse tipo de proteção (impedância alta o bastante pra
  não atrapalhar quando a FPGA assume o controle ativamente do pino — a
  corrente nesse ponto é desprezível, ~0.33mA com VDD=3.3V — mas baixa o
  bastante pra manter o pino em nível baixo de forma confiável enquanto
  estiver flutuando).
- **Implementar só se precisar**: se você notar caracteres estranhos
  aparecendo no display logo depois de ligar a placa (antes mesmo de apertar
  qualquer botão), esse pull-down em `lcd_e` é o primeiro lugar pra olhar.
