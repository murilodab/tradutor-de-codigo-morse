library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Assembler is
end tb_Assembler;

architecture sim of tb_Assembler is

    component Assembler is
        port (
            clock : in  std_logic;
            Reset : in  std_logic;
            Load  : in  std_logic;
            D     : in  std_logic;
            Q     : out std_logic_vector(5 downto 0)
        );
    end component;

    signal meu_clock : std_logic := '0';

    signal tb_Reset : std_logic := '0';
    signal tb_Load  : std_logic := '0';
    signal tb_D     : std_logic := '0';
    signal tb_Q     : std_logic_vector(5 downto 0);

begin

    inst_Assembler: Assembler
        port map (
            clock => meu_clock,
            Reset => tb_Reset,
            Load  => tb_Load,
            D     => tb_D,
            Q     => tb_Q
        );

    -- Geração do clock: período de 10 ns (alterna a cada 5 ns)
    meu_clock <= not meu_clock after 5 ns;

    process
    begin
        -- Caso A: Pulso de Reset Assíncrono inicial
        tb_Reset <= '1';
        wait for 12 ns;
        tb_Reset <= '0';
        wait for 10 ns;
        assert tb_Q = "000000" report "Falha no Caso A: reset nao zerou Q" severity error;

        -- Casos B a G: desloca a sequencia de bits 1,0,1,1,0,1 (um por ciclo de Load)
        -- Apos exatamente 6 cargas, Q deve ser igual a sequencia inserida, na mesma ordem
        tb_Load <= '1';

        tb_D <= '1';
        wait for 10 ns;
        assert tb_Q = "000001" report "Falha no Caso B: 1o deslocamento incorreto" severity error;

        tb_D <= '0';
        wait for 10 ns;
        assert tb_Q = "000010" report "Falha no Caso C: 2o deslocamento incorreto" severity error;

        tb_D <= '1';
        wait for 10 ns;
        assert tb_Q = "000101" report "Falha no Caso D: 3o deslocamento incorreto" severity error;

        tb_D <= '1';
        wait for 10 ns;
        assert tb_Q = "001011" report "Falha no Caso E: 4o deslocamento incorreto" severity error;

        tb_D <= '0';
        wait for 10 ns;
        assert tb_Q = "010110" report "Falha no Caso F: 5o deslocamento incorreto" severity error;

        tb_D <= '1';
        wait for 10 ns;
        assert tb_Q = "101101" report "Falha no Caso G: 6o deslocamento incorreto (vetor final)" severity error;

        -- Caso H: Testar retenção (Load inativo) -- Q deve manter o valor acumulado
        tb_Load <= '0';
        tb_D <= '0';
        wait for 10 ns;
        assert tb_Q = "101101" report "Falha no Caso H: Q nao reteve o valor com Load inativo" severity error;

        -- Caso I: Reset interrompendo uma sequência em andamento
        tb_Reset <= '1';
        wait for 10 ns;
        assert tb_Q = "000000" report "Falha no Caso I: reset nao zerou Q em operacao" severity error;
        tb_Reset <= '0';

        report "tb_Assembler: todos os casos passaram" severity note;

        wait;
    end process;

end sim;
