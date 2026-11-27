# Fluxo Funcional

> Atualizado em 2026-11-16. O fluxo abaixo é descrito a partir do `Datapath.vhd` e
> `Sinalizador.vhd` atuais — todo o datapath está implementado e conectado, não é
> mais um fluxo "planejado".

Passo a passo do sinal, do toque no botão até a letra aparecer no display.

## 0. Topo: `Sinalizador` + `Controladora`

Arquivos: `Sinalizador/Sinalizador.vhd`, `Controladora/Projeto_v10.vhd`.

O `Sinalizador` é o topo do projeto: instancia `Datapath` e `Controladora`
(`Projeto_v10`) e fecha o laço de controle entre os dois. A `Controladora` é uma FSM
de 3 estados que controla quando o datapath pode acumular símbolos (`s1`) e quando
deve ser limpo/liberar o `Tradutor` (`s0` e `s2`, respectivamente — ver
[`02-arquitetura.md`](./02-arquitetura.md) para o detalhe de cada estado). Ela não
processa os bits do Morse em si — só gera os resets e o `tradutor_enable` que
orquestram os outros 5 componentes.

## 1. Botão pressionado (`btn_a`)

O usuário pressiona o botão `btn_a` por um tempo curto (ponto) ou longo (traço).

## 2. Timer — ✅ implementado (sem perfis de velocidade)

Arquivo: `Timer/Timer.vhd`. Testbench: `Timer/Timer_tb.vhd`.

O `Timer` mede, em milissegundos, por quanto tempo o botão `btn_a` fica pressionado
e expõe esse valor continuamente em `milissegundos` (um `integer`, não um sinal de 1
bit). Ele **não decide** ponto/traço — isso ficou a cargo do `Conversor` (ver
próxima seção). A conversão de ciclos de clock para milissegundos é feita pelo
generic `clock_frequency` (`periodos_por_ms := clock_frequency / 1000`).

**Limitação:** o `Timer` atual não tem perfis de velocidade configuráveis — o
limiar ponto/traço é decidido pelo `Conversor` (ver próxima seção), com um único
par de limiares fixo.

Enquanto `btn_a = '1'`, um contador de períodos de clock incrementa; a cada
`periodos_por_ms` ciclos, `ms_count` é incrementado em 1. Quando o botão é
pressionado de novo (borda de subida detectada via `btn_prev`), a contagem reinicia
do zero — ou seja, `milissegundos` reflete a duração do toque **em andamento**,
zerando a cada novo toque.

## 3. Conversor — ✅ implementado (decide ponto/traço)

Arquivo: `Conversor/Conversor.vhd`. Testbench: `Conversor/Conversor_tb.vhd`.

Detecta a **borda de descida** do botão (`btn_prev = '1' and btn_a = '0'`, ou seja, o
momento em que o botão é solto) e, nesse instante, decide ponto/traço comparando
`milissegundos` (vindo do `Timer`) contra dois limiares:

- `milissegundos <= tempo_ponto` (generic, padrão 300) → `output <= '0'` (ponto);
- `tempo_ponto < milissegundos <= tempo_traco` (constante interna, `tempo_ponto * 3`
  = 900 por padrão) → `output <= '1'` (traço);
- **Limitação:** `milissegundos > tempo_traco` → nenhuma ação — nem `output` nem
  `load_assembler` são emitidos; o toque é descartado sem indicação de erro.

Quando decide ponto ou traço, ativa `load_assembler <= '1'` por um ciclo, sinal que
o `Assembler` usa para deslocar o novo bit para dentro do acumulador.

## 4. Assembler — ✅ implementado (inclui `length` e zero-padding)

Arquivo: `Assembler/Assembler.vhd`. Pacote: `Assembler/Assembler_pkg.vhd`. Testbench:
`Assembler/Assembler_tb.vhd`.

É um registrador de deslocamento de 6 bits (`data_in <= data_in(4 downto 0) & D`),
mas agora também resolve o que a documentação anterior apontava como pendência: o
par `(value, length)`.

- A cada pulso de `load_a = '1'` (vindo do `Conversor`), desloca o bit `D` para
  dentro de `data_in` e incrementa um contador interno (`counter`).
- Se `counter` chega a 6 (máximo de símbolos Morse por caractere), fecha o
  caractere automaticamente: copia `data_in` (já deslocado) para `Q.value`,
  grava `Q.length <= 6`, e zera `data_in`/`counter` para o próximo caractere.
- Se o botão `btn_b` for pressionado antes de completar 6 símbolos (borda de
  subida, `btn_prev = '0' and btn_b = '1'`), fecha o caractere "cedo": copia
  `data_in` para `Q.value`, grava `Q.length <= counter` (o número real de símbolos
  digitados), e zera `data_in`/`counter`.
- `Reset = '1'` zera `data_in`/`counter`, mas **não zera `Q`** — o último caractere
  montado fica disponível em `Q` para o `Tradutor` ler, mesmo enquanto o
  `Assembler` já está sendo resetado para o próximo caractere (ver nota sobre o
  estado `s2` da Controladora em [`02-arquitetura.md`](./02-arquitetura.md)).

O tipo `morse_data` (`Assembler/Assembler_pkg.vhd`) é exatamente o record
`(value, length)` que a documentação anterior descrevia como planejado:
`value : std_logic_vector(5 downto 0)`, `length : integer range 0 to 6`.

## 5. Tradutor — ✅ implementado

Arquivo: `Tradutor/Tradutor.vhd`. Testbench: `Tradutor/Tradutor_tb.vhd`.

Recebe `Q` (o record `morse_data`) do `Assembler` e, quando `enable = '1'`
(controlado pela Controladora), decodifica `(value, length)` para um código ordinal
de 6 bits (`seven_seg_out`), usando `length` para escolher a tabela de combinações
(letras com 1 a 4 símbolos, dígitos com 5 símbolos) e `value` para escolher a entrada
dentro dessa tabela. Combinações não mapeadas (incluindo todo `length = 6`, que não é
usado por nenhuma letra/dígito do alfabeto Morse padrão) caem em `"111111"`, que o
`BCD_7seg` interpreta como `.` (ponto no display).

Isso substitui o que a documentação anterior chamava de "pasta com apenas um
placeholder" — o `Tradutor` está implementado e integrado.

## 6. Display — `BCD_7seg` — ✅ implementado e integrado

Arquivo: `BCD_7seg/BCD_7seg.vhd` (entidade `Bcd_7seg`). Testbench: não há um
testbench próprio versionado atualmente para este componente (o antigo
`testbench/BCD_7seg/tb_BCD_7seg.vhd`, que cobria as 36 combinações da tabela, foi
removido junto com a árvore antiga — ver [`06-testbenches.md`](./06-testbenches.md)).

Recebe o vetor ordinal de 6 bits do `Tradutor` e decodifica para o padrão de 7
segmentos: `"000000"`–`"001001"` para dígitos 0–9, `"001010"` em diante para letras
A–Z. **Limitações:** várias letras (M, W, X) não têm representação exata em 7
segmentos, então o componente usa aproximações; e o comentário no topo do arquivo
cita pinagem testada para "Kit Terasic Altera DE2", diferente da placa alvo
(MAX10M50F484C7G) declarada no README.

### Alternativa: LCD 16x2 — ainda não implementada

Sem mudanças em relação à versão anterior desta seção: um LCD 16x2 (controlador
HD44780) mostraria texto real em vez de 1 caractere por vez, mas exige um driver
novo — inicialização, temporização entre escritas, sinais `RS`/`RW`/`E` — que ainda
não existe no repositório. Mudaria também o que o `Tradutor` precisa gerar (código
ASCII de 8 bits em vez do ordinal de 6 bits usado pelo `BCD_7seg`).

## Testbench de integração: `tb_Sinalizador`

Arquivo: `Sinalizador/tb_Sinalizador.vhd`. Diferente dos testbenches dos componentes
individuais, este instancia o `Sinalizador` completo (topo do sistema) e simula uma
sequência de toques lida de `Sinalizador/morse_input.txt` (formato: um caractere
`a`/`b` + duração em ms por linha — `a` simula o botão A por aquela duração, `b`
simula o botão B e grava o `disp_char` resultante em
`Sinalizador/morse_output.txt`). É o mais próximo de um teste de ponta a ponta que o
projeto tem hoje — mas, como os demais testbenches novos, não faz verificação
automática (`assert`): grava a saída para comparação manual. Ver
[`06-testbenches.md`](./06-testbenches.md).
