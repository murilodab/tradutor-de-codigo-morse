# Testbenches

> Atualizado em 2026-11-16. A reorganização de diretórios do Murilo trouxe
> testbenches novos, com um estilo e uma convenção de nomes diferentes dos
> testbenches antigos descritos originalmente neste documento. As duas convenções
> coexistem hoje no repositório — ver seção "Duas convenções" abaixo.

## Onde estão

```
Timer/Timer_tb.vhd             -- entidade Timer_tb
Conversor/Conversor_tb.vhd     -- entidade Conversor_tb
Assembler/Assembler_tb.vhd     -- entidade Assembler_tb
Tradutor/Tradutor_tb.vhd       -- entidade Tradutor_tb
Sinalizador/tb_Sinalizador.vhd -- entidade tb_Sinalizador (convenção antiga)
```

Cada testbench fica na mesma pasta do componente que testa (diferente da convenção
antiga, em que `testbench/` era uma árvore paralela a `maquina/`). Essa árvore antiga
(`testbench/`, `maquina/`) não existe mais no repositório.

Dois componentes **não têm testbench hoje**: `BCD_7seg/BCD_7seg.vhd` e
`Controladora/Projeto_v10.vhd`.

## Duas convenções

### Convenção antiga (ainda em uso só por `tb_Sinalizador.vhd`)

- Nome: `tb_<Componente>.vhd`, entidade `tb_<Componente>`.
- Processo de estímulo com **autoverificação**: `assert <condição> report "<mensagem>"
  severity error;` para cada caso de teste, mais uma mensagem final de sucesso com
  `severity note`. O resumo do simulador (`Errors: N`) diz sozinho se passou.
- `tb_Sinalizador.vhd` segue essa convenção de **nome**, mas não a de
  **autoverificação** — ele lê um arquivo de estímulos e grava a saída observada em
  outro arquivo, para comparação manual, sem `assert`.

### Convenção nova (`Timer_tb`, `Conversor_tb`, `Assembler_tb`, `Tradutor_tb`)

- Nome: `<Componente>_tb.vhd`, entidade `<Componente>_tb` (sufixo em vez de
  prefixo).
- Em vez de `assert`, usam `report "<valor observado>"` para imprimir os resultados
  no log do simulador (ou gravá-los em arquivo), deixando a verificação **para quem
  roda o teste** comparar manualmente contra o esperado.
- `Timer_tb.vhd` usa `std.env.stop(0);` (VHDL-2008) para encerrar a simulação
  explicitamente, em vez do padrão antigo de só suspender o processo com `wait;` e
  deixar o tempo de simulação do `vsim -do` controlar o fim.
- Vários desses testbenches leem/escrevem arquivos de texto auxiliares na própria
  pasta do componente (`Assembler/input_bits.txt` + `output_bits.txt`,
  `Tradutor/morse_records.txt`, `Sinalizador/morse_input.txt` +
  `morse_output.txt`), em vez de gerar todos os estímulos no próprio VHDL.

**Limitação:** os testbenches da convenção nova não fazem verificação automática —
a checagem depende de quem roda o teste comparar manualmente o `report`/arquivo de
saída contra o valor esperado.

## Estrutura padrão (convenção antiga, ainda vale como referência)

```vhdl
entity tb_Algo is
end tb_Algo;                      -- 1. entidade vazia: um testbench não tem portas,
                                   --    ele só injeta sinais internos no DUT

architecture sim of tb_Algo is
    component Algo is ... end component;   -- 2. declaração do componente a testar

    signal meu_clock : std_logic := '0';   -- clock (só nos componentes síncronos)
    signal tb_x : ...;                     -- sinais internos que estimulam o DUT
begin
    inst_Algo: Algo port map (...);        -- 3. instancia o DUT, ligando aos sinais tb_*

    meu_clock <= not meu_clock after 5 ns; -- 4. gera um clock de período 10 ns

    process                                -- 5. processo sequencial de estímulos
    begin
        -- Caso A: ...
        tb_x <= '1';
        wait for 10 ns;
        assert <condição esperada> report "Falha no Caso A: ..." severity error;
        ...
        report "tb_Algo: todos os casos passaram" severity note;
        wait; -- suspende o processo para sempre, encerrando os estímulos
    end process;
end sim;
```

### `assert` / `report` / `severity`

`assert <condição> report "<mensagem>" severity <nível>;` é a forma de **autoverificação**
dos testbenches — sem ele, só dá pra saber se um componente está certo olhando a forma
de onda (ou, nos testbenches novos, lendo o `report`/arquivo de saída manualmente).

- Funciona como um `if` invertido: se a condição for **verdadeira**, nada acontece; se for
  **falsa**, a mensagem do `report` é impressa com o nível indicado em `severity`.
- Níveis de `severity`, do mais leve ao mais grave: `note` → `warning` → `error` →
  `failure`. Aqui:
  - `note` é usado só para a mensagem final de sucesso (não indica problema).
  - `error` é usado em toda verificação de caso de teste — o simulador conta esses
    erros no resumo final ("Errors: N, Warnings: M"); `Errors: 0` = todos os `assert`
    passaram.
  - `failure` não é usado em nenhum testbench do projeto hoje.

## Como rodar (simulação com Questa FSE)

Os testbenches antigos foram validados com o Questa Altera Starter FPGA Edition
(incluído no Quartus Prime Lite). Para rodar qualquer um deles (ajustando os paths
para a nova estrutura, sem `maquina/`/`testbench/`):

```bash
VBIN=/home/arkmeds/altera_lite/25.1std/questa_fse/bin
REPO=/home/arkmeds/Downloads/morse/tradutor-de-codigo-morse

mkdir -p /tmp/sim_algo && cd /tmp/sim_algo
$VBIN/vlib work
$VBIN/vcom -2008 "$REPO/Algo/Algo.vhd" "$REPO/Algo/Algo_tb.vhd"
$VBIN/vsim -c -do "run 150 ns; quit -f" work.algo_tb
```

> ⚠️ A flag `-2008` continua necessária — não só pelo `to_string` (usado no antigo
> `tb_BCD_7seg.vhd`, hoje removido), como também pelo `std.env.stop` usado em
> `Timer_tb.vhd`.

> ⚠️ Testbenches que leem/escrevem arquivo (`Assembler_tb`, `Tradutor_tb`,
> `tb_Sinalizador`) esperam o arquivo de entrada **no diretório de trabalho da
> simulação** (ex. `input_bits.txt`, `morse_records.txt`, `morse_input.txt`) — copie
> o `.txt` correspondente da pasta do componente para `/tmp/sim_algo` (ou rode o
> `vsim` a partir da própria pasta do componente) antes de simular.

### Verificação de compilação (2026-11-16) — Quartus + Questa

Sem `.qpf`/`.qsf` versionado, essa verificação foi feita montando um projeto Quartus
mínimo fora do repositório (apontando para os arquivos atuais, device
`10M50DAF484C7G`, `TOP_LEVEL_ENTITY Sinalizador`) e rodando
`quartus_map --analysis_and_elaboration`, além de `vcom -2008` por testbench.
Hoje tudo compila limpo: `Sinalizador` → `Datapath` →
`Timer`/`Conversor`/`Assembler`/`Tradutor`/`Bcd_7seg` → `Projeto_v10` elabora sem
erros no Quartus (`0 errors, 1 warning`, o warning só sobre paralelismo) e no Questa
(`Errors: 0`), e os 5 testbenches (`Timer_tb`, `Conversor_tb`, `Assembler_tb`,
`Tradutor_tb`, `tb_Sinalizador`) compilam cada um com `Errors: 0`.

Os componentes antigos (`Conversor`, `Controladora` 4-estados, `RegistradorGenerico`,
`Assembler`, `Bcd_7seg`, `Timer` com perfis, já removidos do repositório) tinham sido
verificados da mesma forma antes da reorganização — 0 erros em todos, cada um como
top-level isolado.

## O que cada testbench cobre

| Testbench | Casos cobertos | Autoverificado? | Compila hoje? |
|---|---|---|---|
| `Timer/Timer_tb.vhd` | Reset; toque de 100/200/300/400 ms, imprime `milissegundos` medido após cada um | ❌ Não — só `report` | ✅ Sim (`vcom`, 0 erros) |
| `Conversor/Conversor_tb.vhd` | Reset; sequência de durações (100 a 1000 ms) cobrindo ponto, traço e o caso acima de `tempo_traco`, imprime `output`/`load_assembler` | ❌ Não — só `report` | ✅ Sim (`vcom`, 0 erros) |
| `Assembler/Assembler_tb.vhd` | Reset; lê sequência de bits de `input_bits.txt` (0/1 por linha, `b` para fechar com `btn_b`), grava `Q.value`/`Q.length` em `output_bits.txt` | ❌ Não — só grava arquivo | ✅ Sim (`vcom`, 0 erros) |
| `Tradutor/Tradutor_tb.vhd` | Lê pares `(value, length)` de `morse_records.txt`, imprime `seven_seg_out` resultante para cada um | ❌ Não — só `report` | ✅ Sim (`vcom`, 0 erros) |
| `Sinalizador/tb_Sinalizador.vhd` | Reset; lê sequência de toques A/B com duração de `morse_input.txt`, grava `disp_char` em `morse_output.txt` a cada fechamento de caractere (teste de integração de ponta a ponta) | ❌ Não — só grava arquivo | ✅ Sim (`vcom`, 0 erros) |

Os testbenches antigos (removidos, descritos aqui só como referência histórica —
cobriam `RegW`, `Conversor` e `Assembler` na versão anterior, `BCD_7seg` e
`Controladora` na versão de 4 estados, e o `Timer` com perfis de velocidade) eram
todos autoverificados com `assert`/`severity error`, conforme a convenção antiga
descrita acima.
