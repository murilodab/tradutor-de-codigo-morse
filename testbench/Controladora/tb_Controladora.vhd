library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- A entidade de um testbench é sempre vazia, pois ela apenas injeta sinais internos
entity tb_Controladora is
end tb_Controladora;

architecture sim of tb_Controladora is

    -- 1. Declaração do componente a ser testado (DUT - Device Under Test)
    component Controladora is
        port (
            clk    : in  std_logic;
            a      : in  std_logic;
            b      : in  std_logic;
            reset  : in  std_logic;
            output : out std_logic_vector(1 downto 0)
        );
    end component;

    signal meu_clock : std_logic := '0';

    -- Sinais internos para estimular o componente
    -- 'a' existe na interface mas nao e lido por nenhuma logica da FSM (ver 05-melhorias.md)
    signal tb_a      : std_logic := '0';
    signal tb_b      : std_logic := '0';
    signal tb_reset  : std_logic := '0';
    signal tb_output : std_logic_vector(1 downto 0);

begin

    -- 2. Instanciação do componente a ser testado
    inst_Controladora: Controladora
        port map (
            clk    => meu_clock,
            a      => tb_a,
            b      => tb_b,
            reset  => tb_reset,
            output => tb_output
        );

    -- Geração do clock: período de 10 ns (alterna a cada 5 ns)
    meu_clock <= not meu_clock after 5 ns;

    -- 3. Processo sequencial para injetar os casos de teste
    process
    begin
        -- Caso A: Pulso de Reset Assíncrono inicial -- estado deve ir para s0
        tb_reset <= '1';
        wait for 12 ns;
        tb_reset <= '0';
        wait for 10 ns;
        assert tb_output = "00" report "Falha no Caso A: reset nao foi para s0" severity error;

        -- Caso B: em s0, com b = '0', deve permanecer em s0
        wait for 10 ns;
        assert tb_output = "00" report "Falha no Caso B: s0 nao deveria mudar com b=0" severity error;

        -- Caso C: com b = '1', avanca de s0 para s1
        tb_b <= '1';
        wait for 10 ns;
        assert tb_output = "01" report "Falha no Caso C: nao avancou de s0 para s1" severity error;

        -- Caso D: ainda com b = '1', avanca de s1 para s2
        wait for 10 ns;
        assert tb_output = "10" report "Falha no Caso D: nao avancou de s1 para s2" severity error;

        -- Caso E: em s2, a transicao para s3 e incondicional (nao depende de b)
        wait for 10 ns;
        assert tb_output = "11" report "Falha no Caso E: nao avancou de s2 para s3" severity error;

        -- Caso F: em s3, a transicao para s0 tambem e incondicional
        wait for 10 ns;
        assert tb_output = "00" report "Falha no Caso F: nao retornou de s3 para s0" severity error;

        -- Caso G: de volta em s0 com b = '0', permanece parado
        tb_b <= '0';
        wait for 10 ns;
        assert tb_output = "00" report "Falha no Caso G: s0 nao deveria mudar com b=0" severity error;

        -- Caso H: Reset interrompendo a FSM no meio de uma sequência (em s1)
        tb_b <= '1';
        wait for 10 ns; -- avanca para s1
        assert tb_output = "01" report "Falha no Caso H (pre-condicao): deveria estar em s1" severity error;
        tb_reset <= '1';
        wait for 10 ns;
        assert tb_output = "00" report "Falha no Caso H: reset nao interrompeu a FSM" severity error;
        tb_reset <= '0';

        report "tb_Controladora: todos os casos passaram" severity note;

        -- Interrompe a execução dos estímulos
        wait;
    end process;

end sim;
