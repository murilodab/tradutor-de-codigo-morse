library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Conversor is
end tb_Conversor;

architecture sim of tb_Conversor is

    component Conversor is
        port (
            clock          : in  std_logic;
            reset          : in  std_logic;
            a              : in  std_logic;
            flag_timer     : in  std_logic;
            load_assembler : out std_logic;
            result         : out std_logic
        );
    end component;

    signal meu_clock : std_logic := '0';

    signal tb_reset          : std_logic := '0';
    signal tb_a              : std_logic := '0';
    signal tb_flag_timer     : std_logic := '0';
    signal tb_load_assembler : std_logic;
    signal tb_result         : std_logic;

begin

    inst_Conversor: Conversor
        port map (
            clock          => meu_clock,
            reset          => tb_reset,
            a              => tb_a,
            flag_timer     => tb_flag_timer,
            load_assembler => tb_load_assembler,
            result         => tb_result
        );

    -- Geração do clock: período de 10 ns (alterna a cada 5 ns)
    meu_clock <= not meu_clock after 5 ns;

    process
    begin
        -- Caso A: Pulso de Reset Assíncrono inicial
        tb_reset <= '1';
        wait for 12 ns;
        tb_reset <= '0'; -- Libera o componente para funcionar
        wait for 10 ns;
        assert tb_load_assembler = '0' and tb_result = '0'
            report "Falha no Caso A: reset nao zerou as saidas" severity error;

        -- Caso B: Botao pressionado (sem soltar ainda) nao deve gerar load
        tb_a <= '1';
        tb_flag_timer <= '1'; -- vai simular um traço quando soltar
        wait for 10 ns;
        assert tb_load_assembler = '0' and tb_result = '0'
            report "Falha no Caso B: pressionar sozinho nao deveria gerar load" severity error;

        -- Caso C: Solta o botao (borda de descida) com flag_timer = '1' (traço)
        tb_a <= '0';
        wait for 10 ns;
        assert tb_load_assembler = '1' and tb_result = '1'
            report "Falha no Caso C: borda de descida nao propagou flag_timer = 1 (traco)" severity error;

        -- Caso D: load_assembler/result devem voltar a '0' um ciclo depois
        wait for 10 ns;
        assert tb_load_assembler = '0' and tb_result = '0'
            report "Falha no Caso D: load_assembler/result nao voltaram a 0 apos o pulso" severity error;

        -- Caso E: Novo toque, agora soltando com flag_timer = '0' (ponto) -- cobre o bug original
        -- (result sempre '0' mesmo quando deveria refletir flag_timer)
        tb_a <= '1';
        tb_flag_timer <= '0';
        wait for 10 ns;
        tb_a <= '0';
        wait for 10 ns;
        assert tb_load_assembler = '1' and tb_result = '0'
            report "Falha no Caso E: borda de descida nao propagou flag_timer = 0 (ponto)" severity error;

        -- Caso F: Reset interrompendo uma operação em andamento
        tb_reset <= '1';
        wait for 10 ns;
        assert tb_load_assembler = '0' and tb_result = '0'
            report "Falha no Caso F: reset nao interrompeu a operacao" severity error;
        tb_reset <= '0';

        report "tb_Conversor: todos os casos passaram" severity note;

        wait;
    end process;

end sim;
