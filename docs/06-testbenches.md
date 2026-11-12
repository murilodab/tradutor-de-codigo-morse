# Testbenches

Este documento explica o **modelo/convenção** seguido pelos testbenches do projeto —
não repete o que já está em [`05-melhorias.md`](./05-melhorias.md) sobre cada bug
encontrado, só documenta como os testbenches são escritos e como rodá-los.

## Onde estão

```
testbench/
├── Reg_W/tb_RegW.vhd              -- entidade tb_RegistradorGenerico (modelo original)
├── Conversor/tb_Conversor.vhd
├── Assembler/tb_Assembler.vhd
├── BCD_7seg/tb_BCD_7seg.vhd
└── Controladora/tb_Controladora.vhd
```

Convenção de nomes: entidade `tb_<Componente>`, arquivo `tb_<Componente>.vhd`, na pasta
`testbench/<Componente>/` — espelhando a pasta do componente em `maquina/`.

## Estrutura padrão de um testbench

Todos seguem o mesmo esqueleto:

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
de onda manualmente.

- Funciona como um `if` invertido: se a condição for **verdadeira**, nada acontece; se for
  **falsa**, a mensagem do `report` é impressa com o nível indicado em `severity`.
- Níveis de `severity`, do mais leve ao mais grave: `note` → `warning` → `error` →
  `failure`. Aqui:
  - `note` é usado só para a mensagem final de sucesso (não indica problema).
  - `error` é usado em toda verificação de caso de teste — o simulador conta esses
    erros no resumo final ("Errors: N, Warnings: M"); `Errors: 0` = todos os `assert`
    passaram.
- Cada mensagem de falha identifica **qual caso específico quebrou** (ex.: "Falha no
  Caso C: Q nao reteve o valor com Load inativo"), para não precisar adivinhar olhando
  a forma de onda.

### Caso especial: `tb_BCD_7seg.vhd` (componente combinacional, tabela grande)

O `BCD_7seg` não tem clock nem estado — é só uma tabela de 36 combinações (dígitos e
letras) mais o caso `others`. Em vez de repetir manualmente `assert` 38 vezes, esse
testbench guarda a tabela inteira num array de registros e percorre com um `for`:

```vhdl
type test_vector is record
    entrada_val    : std_logic_vector(5 downto 0);
    saida_esperada : std_logic_vector(6 downto 0);
end record;
type test_array is array (natural range <>) of test_vector;

constant TESTS : test_array := (
    ("000000", "1111110"), -- 0
    ("000001", "0110000"), -- 1
    ...
);

process
begin
    for i in TESTS'range loop
        tb_entrada <= TESTS(i).entrada_val;
        wait for 1 ns; -- tempo para o sinal combinacional se propagar
        assert tb_saida = TESTS(i).saida_esperada
            report "Falha no indice " & integer'image(i) &
                   ": entrada=" & to_string(TESTS(i).entrada_val) &
                   " saida=" & to_string(tb_saida) &
                   " esperado=" & to_string(TESTS(i).saida_esperada)
            severity error;
    end loop;
    report "tb_Bcd_7seg: todos os casos passaram" severity note;
    wait;
end process;
```

Particularidades desse trecho:

- `TESTS'range` é um atributo do array que devolve o intervalo de índices válidos
  (aqui, `0` a `37`) — o `for i in TESTS'range loop` evita hardcodar o tamanho do array.
- `wait for 1 ns` é necessário porque, mesmo sendo combinacional, a saída não muda no
  mesmo instante de simulação em que a entrada muda — precisa de um tempo (mesmo que
  mínimo) para o sinal se propagar antes do `assert` ler o valor novo.
- `integer'image(i)` converte o índice (um `integer`) em `string`, para aparecer na
  mensagem de erro.
- `to_string(...)` (disponível em VHDL-2008 via `ieee.std_logic_1164`) converte um
  `std_logic_vector` em `string` legível (ex.: `"1111110"`), também só para a mensagem
  de erro.
- Essa combinação faz a mensagem de falha já dizer **qual linha da tabela quebrou**,
  qual era a entrada, o que saiu e o que era esperado — sem precisar rodar de novo com
  mais instrumentação.

## Como rodar (simulação com Questa FSE)

Os testbenches foram validados com o Questa Altera Starter FPGA Edition (incluído no
Quartus Prime Lite instalado nesta máquina). Para rodar qualquer um deles:

```bash
VBIN=/home/arkmeds/altera_lite/25.1std/questa_fse/bin
REPO=/home/arkmeds/Downloads/morse/tradutor-de-codigo-morse

mkdir -p /tmp/sim_algo && cd /tmp/sim_algo
$VBIN/vlib work
$VBIN/vcom -2008 "$REPO/maquina/.../Algo.vhd" "$REPO/testbench/Algo/tb_Algo.vhd"
$VBIN/vsim -c -do "run 150 ns; quit -f" work.tb_algo
```

O resumo final do `vsim` mostra `Errors: 0, Warnings: 0` quando tudo passa, e a
mensagem `report ... severity note` de sucesso aparece no log. Qualquer `assert`
que falhar aparece como `Error` com a mensagem do `report` correspondente.

> ⚠️ A flag `-2008` é necessária para o `to_string` usado em `tb_BCD_7seg.vhd` — sem
> ela, esse testbench específico não compila.

Os 5 componentes (`Conversor`, `Controladora`, `RegistradorGenerico`, `Assembler`,
`Bcd_7seg`) também foram verificados no **Quartus** (Análise & Síntese, `quartus_map`),
cada um como top-level isolado, contra o dispositivo declarado no README
(`10M50DAF484C7G`) — 0 erros em todos. Isso é uma verificação complementar à simulação:
confirma que o código sintetiza para o hardware alvo, mas não substitui o testbench
(que verifica o **comportamento**, não só a sintaxe).

## O que cada testbench cobre

| Testbench | Casos cobertos |
|---|---|
| `tb_RegW.vhd` | Reset, carga (`Load`), retenção, nova carga, reset interrompendo operação |
| `tb_Conversor.vhd` | Reset; pressionar sem soltar (sem `load`); soltar com `flag_timer='1'` (traço) e `'0'` (ponto, cenário do bug original); pulso de 1 ciclo; reset interrompendo |
| `tb_Assembler.vhd` | Reset; deslocamento bit a bit de uma sequência de 6 bits; retenção com `Load='0'`; reset no meio da sequência |
| `tb_BCD_7seg.vhd` | As 36 combinações da tabela (dígitos 0–9, letras A–Z) + 2 combinações fora da tabela (`when others`) |
| `tb_Controladora.vhd` | Reset; as 4 transições de estado (`s0→s1→s2→s3→s0`); permanência em `s0` com `b='0'`; reset interrompendo a FSM |
