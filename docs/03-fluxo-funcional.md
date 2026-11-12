# Fluxo Funcional

Passo a passo do sinal, do toque no botão até a letra aparecer no display — cruzando o
que os áudios descrevem com o que o código realmente faz hoje.

## 1. Botão pressionado (`a`)

O usuário pressiona o botão `a` por um tempo curto (ponto) ou longo (traço).

## 2. Timer — ❌ não implementado

**Planejado (áudio 1 e 2):** o `Timer` mede a duração do pressionamento e informa ao
`Conversor` se foi um traço ou um ponto, através de um sinal `flag_timer` (0 ou 1).

O `Timer` também deveria:
- Converter os ciclos de clock da placa em milissegundos/segundos (áudio 2: *"esse
  timer... tem que converter o clock da placa em segundos, ou milissegundos"*).
- Ter uma entrada **externa e configurável** para o limiar ponto/traço, permitindo
  ajustar a velocidade exigida do usuário — por exemplo, um iniciante podendo usar
  ponto ≈ 1s / traço ≈ 3s, enquanto um usuário experiente usa tempos bem menores
  (< 0.5s). Essa configurabilidade não existe em nenhuma porta de nenhum componente
  atual — é só uma intenção de design registrada no áudio.

Nenhum arquivo `.vhd` existe em `maquina/datapath/Timer/` — apenas um placeholder (`gitkeep.txt`).

## 3. Conversor — ✅ implementado (com bug conhecido)

Arquivo: `maquina/datapath/Conversor/Conversor.vhd`.

Detecta a **borda de descida** do botão (`prev_a = '1' and a = '0'`, ou seja, "acabei de
soltar o botão") e, nesse instante:
- Ativa `load_assembler <= '1'` por um ciclo;
- Deveria propagar `result <= flag_timer` (o bit ponto/traço medido pelo Timer).

Esse comportamento é intencional segundo o áudio 3: o `Conversor` só manda `load` depois
que detecta que o toque **terminou**, evitando carregar um valor falso enquanto o botão
ainda está pressionado.

> ⚠️ **Bug encontrado:** dentro do mesmo processo, logo depois da linha
> `result <= flag_timer;`, existe uma linha incondicional `result <= '0';` no fim do
> `elsif rising_edge(clock)`. Em VHDL, a última atribuição a um sinal dentro do mesmo
> processo/ciclo é a que "vence" — então `result` provavelmente está sendo zerado todo
> ciclo, inclusive no ciclo em que deveria valer `flag_timer`. Ver
> [`04-decisoes-e-pendencias.md`](./04-decisoes-e-pendencias.md#bugs-conhecidos).

## 4. Assembler — 🟡 parcialmente implementado

Arquivo: `maquina/datapath/Assembler/Assembler.vhd`.

É um registrador de deslocamento: a cada pulso de `Load='1'`, desloca o bit `D` para
dentro de um vetor de 6 bits (`Q <= data_in(4 downto 0) & D`). Isso acumula até 6
símbolos Morse (pontos/traços) por caractere — o máximo usado no alfabeto Morse padrão.

**Faltando (descrito no áudio 1, ainda não implementado):**
- Lógica de **completar com zeros** o restante do vetor quando o caractere termina antes
  de 6 símbolos (a maioria das letras usa menos de 6 símbolos — ex.: E = `.`, T = `-`).
  O gatilho para esse "fechamento" seria um timeout ou um botão explícito de
  "troca de estado" — qual dos dois (ou se ambos) ainda é uma decisão em aberto.
- Um **contador de quantos símbolos foram inseridos** ("length"). Hoje o `Assembler` só
  expõe o vetor bruto de 6 bits (`Q`), sem nenhum sinal de contagem.

## 5. O par `(valor, length)` — ❌ não implementado

O áudio 1 descreve um tipo de dado composto ("record") com dois atributos:
- `value`: o vetor de 6 bits;
- `length`: quantas vezes o botão foi pressionado (quantos símbolos realmente fazem
  parte do caractere, distinguindo zeros "reais" do Morse de zeros de preenchimento).

Ainda não está decidido se esse record pertence ao `Assembler` ou ao `Tradutor` — e ele
não existe em nenhum dos dois hoje.

## 6. Tradutor — ❌ não implementado

Pasta `maquina/datapath/Tradutor/` tem apenas um placeholder. Pelo design descrito, deveria:
- Receber `(value, length)`;
- Decidir, com base nesses dois atributos, qual letra o padrão representa;
- Enviar o código correspondente para o display.

## 7. Display (`BCD_7seg`) — ✅ implementado

Arquivo: `maquina/datapath/BCD_7seg/BCD_7seg.vhd`.

Recebe um vetor de 6 bits **ordinal** (não é o padrão Morse — é só uma contagem
binária: `"000000"` a `"001001"` para os dígitos 0–9, `"001010"` em diante para as
letras A–Z) e decodifica para o padrão de 7 segmentos correspondente.

Ou seja: este componente já resolve a etapa "letra → segmentos", mas depende do
`Tradutor` (inexistente ainda) para transformar o padrão Morse em um desses códigos
ordinais.

## 8. Controladora — 🟡 rascunho, não compila

Arquivo: `maquina/Controladora/Projeto_v10.vhd`. Uma máquina de estados simples (`s0`..`s3`)
pensada para orquestrar o datapath, mas:
- O `case` de próximo estado não tem ramo para `s3` (estado nunca alcançado por
  nenhuma transição, e a ausência do `when s3 =>` deixa o `case` incompleto);
- Dentro do ramo `when s2 =>` há um `end if;` sem `if` correspondente.

Esse arquivo não compila no estado atual — é claramente um ponto de partida que ainda
precisa ser retrabalhado antes de orquestrar os componentes reais.

## Componente auxiliar: `RegW` / `RegistradorGenerico`

Não faz parte dos 5 componentes citados no áudio, mas existe no repositório
(`maquina/Reg_W/RegW.vhd`) como um registrador genérico parametrizável (`generic W : integer`),
com reset assíncrono ativo em **baixo** (`Reset = '0'`) e `Load` síncrono. Tem testbench
(`testbench/Reg_W/tb_RegW.vhd`) cobrindo reset, carga e retenção. Ainda não é instanciado em nenhum
outro componente — é um bloco reutilizável disponível para quando for necessário (por
exemplo, para guardar o valor final do `Assembler`, ou em lógica de debounce futura).
