# Fluxo Funcional

Passo a passo do sinal, do toque no botão até a letra aparecer no display — cruzando o
que os áudios descrevem com o que o código realmente faz hoje.

## 1. Botão pressionado (`a`)

O usuário pressiona o botão `a` por um tempo curto (ponto) ou longo (traço).

## 2. Timer 

**Planejado:** o `Timer` mede a duração do pressionamento e informa ao
`Conversor` se foi um traço ou um ponto, através de um sinal `flag_timer` (0 ou 1).

O `Timer` também deveria:
- Converter os ciclos de clock da placa em milissegundos/segundos.
- Ter uma entrada **externa e configurável** para o limiar ponto/traço, permitindo
  ajustar a velocidade exigida do usuário — por exemplo, um iniciante podendo usar
  ponto ≈ 1s / traço ≈ 3s, enquanto um usuário experiente usa tempos bem menores
  (< 0.5s). Essa configurabilidade não existe em nenhuma porta de nenhum componente
  atual — é só uma intenção de design registrada no áudio.
- Proposta em discussão: discretizar essa configurabilidade em **3 perfis fixos**
  (Iniciante / Avançado / Expert), selecionáveis externamente em vez de um limiar
  livre. Ver detalhamento e tabela de valores em
  [`04-decisoes-e-pendencias.md`](./04-decisoes-e-pendencias.md#perfis-de-velocidade-timer--proposta-em-discussão-2026-11-12).


## 3. Conversor

Arquivo: `maquina/datapath/Conversor/Conversor.vhd`. Testbench em
`testbench/Conversor/tb_Conversor.vhd`.

Detecta a **borda de descida** do botão (`prev_a = '1' and a = '0'`, ou seja, quando o botão deixa de ser pressionado:
- Ativa `load_assembler <= '1'` por um ciclo;
- Propaga `result <= flag_timer` (o bit ponto/traço medido pelo Timer) — corrigido; antes
  um `result <= '0';` incondicional no fim do processo sobrescrevia esse valor no mesmo
  ciclo (ver [`04-decisoes-e-pendencias.md`](./04-decisoes-e-pendencias.md)).


## 4. Assembler 

Arquivo: `maquina/datapath/Assembler/Assembler.vhd`. Testbench em
`testbench/Assembler/tb_Assembler.vhd`.

É um registrador de deslocamento: a cada pulso de `Load='1'`, desloca o bit `D` para
dentro de um vetor de 6 bits (`Q <= data_in(4 downto 0) & D`). Isso acumula até 6
símbolos Morse (pontos/traços) por caractere — o máximo usado no alfabeto Morse padrão.


## 5. O par `(valor, length)`

Um tipo de dado composto ("record") com dois atributos:
- `value`: o vetor de 6 bits;
- `length`: quantas vezes o botão foi pressionado (quantos símbolos realmente fazem
  parte do caractere, distinguindo zeros "reais" do Morse de zeros de preenchimento).


## 6. Tradutor — 

Pasta `maquina/datapath/Tradutor/` tem apenas um placeholder. Pelo design descrito, deveria:
- Receber `(value, length)`;
- Decidir, com base nesses dois atributos, qual letra o padrão representa;
- Enviar o código correspondente para o display.

## 7. Display — duas opções de hardware

### 7a. 7 segmentos (`BCD_7seg`) — ✅ implementado

Arquivo: `maquina/datapath/BCD_7seg/BCD_7seg.vhd`. Testbench em
`testbench/BCD_7seg/tb_BCD_7seg.vhd`, cobrindo as 36 combinações da tabela mais 2 fora
dela (caminho `when others`).

Recebe um vetor de 6 bits **ordinal** (não é o padrão Morse — é só uma contagem
binária: `"000000"` a `"001001"` para os dígitos 0–9, `"001010"` em diante para as
letras A–Z) e decodifica para o padrão de 7 segmentos correspondente.

Ou seja: este componente já resolve a etapa "letra → segmentos", mas depende do
`Tradutor` (inexistente ainda) para transformar o padrão Morse em um desses códigos
ordinais. Mostra só 1 caractere por vez, e algumas letras (M, W, X) não têm
representação exata em 7 segmentos — o próprio arquivo já assume aproximações.

### 7b. LCD 16x2 —  (alternativa proposta)

Um LCD 16x2 usa um controlador padrão HD44780, que exige:
- Sinais de controle `RS` (registrador de dados/comando), `RW` (leitura/escrita) e `E`
  (enable), além do barramento de dados (4 ou 8 bits);
- Uma **sequência de inicialização** específica antes de aceitar qualquer caractere;
- **Temporização entre escritas** (não é combinacional como o `BCD_7seg` — precisa de
  uma máquina de estados própria).

Essa opção mostra texto real (várias letras em sequência, 2 linhas x 16 colunas) em vez de um caractere aproximado por vez, mas exige escrever um driver novo e bem mais
complexo do que o `BCD_7seg` atual. Também muda o que o `Tradutor` precisa gerar: em vez do código ordinal de 6 bits usado pelo `BCD_7seg`, o `Tradutor` passaria a gerar o
**código ASCII** (8 bits) da letra para esse novo driver.

## 8. Controladora 

Arquivo: `maquina/Controladora/Controladora.vhd`. Testbench em
`testbench/Controladora/tb_Controladora.vhd`. Uma máquina de estados simples (`s0`..`s3`) pensada para orquestrar o datapath. O `case` de próximo estado já cobre os 4
estados (`s2 → s3 → s0` foi adicionado só para fechar a sintaxe) e compila, mas é
claramente um ponto de partida que ainda precisa ser retrabalhado antes de orquestrar
os componentes reais — o papel de cada estado e dos sinais `a`/`b` no fluxo completo do
datapath ainda não está definido.

## Componente auxiliar: `RegW` / `RegistradorGenerico`

Não faz parte dos 5 componentes citados, mas existe no repositório
(`maquina/Reg_W/RegW.vhd`) como um registrador genérico parametrizável (`generic W : integer`),
com reset assíncrono ativo em **alto** (`Reset = '1'`, padronizado com os demais módulos)
e `Load` síncrono. Tem testbench
(`testbench/Reg_W/tb_RegW.vhd`) cobrindo reset, carga e retenção. Ainda não é instanciado em nenhum
outro componente — é um bloco reutilizável disponível para quando for necessário..
