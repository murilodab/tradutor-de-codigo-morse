# Integração com hardware

## 1. Compilação completa

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


| Porta do `Sinalizador`) | Função | FPGA |
|---|---|---|
| `clock` | Clock de 50MHz | `CLOCK_50` |
| `reset` | Reset geral | Um dos `KEY[1:0]` (push-button onboard) |
| `btn_a` | Botão de toque Morse | Switch ou botão externo |
| `btn_b` | Botão de fim de símbolo | Switch ou botão externo |
| `lcd_rs` | RS do LCD | 1 pino livre do header `GPIO_0` ou `GPIO_1` |
| `lcd_e` | E do LCD | 1 pino livre do header `GPIO_0` ou `GPIO_1` |
| `lcd_data(7)` | D7 do LCD | 1 pino livre do **mesmo** header escolhido acima |
| `lcd_data(6)` | D6 do LCD | 1 pino livre do **mesmo** header escolhido acima |
| `lcd_data(5)` | D5 do LCD | 1 pino livre do **mesmo** header escolhido acima |
| `lcd_data(4)` | D4 do LCD | 1 pino livre do **mesmo** header escolhido acima |
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

- Backlight azul: VO direto no GND (contraste máximo).
- Se precisar ajustar: resistor de 1kΩ entre VO e GND.

## 4. Resistor de proteção em `lcd_e` (pull-down)

Se aparecerem caracteres estranhos no display logo ao ligar a placa: pull-down de 10kΩ entre `lcd_e` e GND.
