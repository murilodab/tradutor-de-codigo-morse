library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Timer is
end tb_Timer;

architecture sim of tb_Timer is

    -- CLOCK_FREQ_HZ pequeno so para os limiares virarem poucos ciclos de clock
    -- e a simulacao ficar rapida: Expert=6 ciclos, Avancado=15 ciclos, Iniciante=30 ciclos.
    component Timer is
        generic (
            CLOCK_FREQ_HZ : integer := 10
        );
        port (
            clock      : in  std_logic;
            reset      : in  std_logic;
            a          : in  std_logic;
            profile    : in  std_logic_vector(1 downto 0);
            flag_timer : out std_logic
        );
    end component;

    signal meu_clock : std_logic := '0';

    signal tb_reset      : std_logic := '0';
    signal tb_a          : std_logic := '0';
    signal tb_profile    : std_logic_vector(1 downto 0) := "10"; -- Expert
    signal tb_flag_timer : std_logic;

begin

    inst_Timer: Timer
        generic map (
            CLOCK_FREQ_HZ => 10
        )
        port map (
            clock      => meu_clock,
            reset      => tb_reset,
            a          => tb_a,
            profile    => tb_profile,
            flag_timer => tb_flag_timer
        );

    -- Geracao do clock: periodo de 10 ns (alterna a cada 5 ns)
    meu_clock <= not meu_clock after 5 ns;

    process
    begin
        -- Caso A: Pulso de Reset Assincrono inicial
        tb_reset <= '1';
        wait for 12 ns;
        tb_reset <= '0';
        wait for 10 ns;
        assert tb_flag_timer = '0'
            report "Falha no Caso A: reset nao zerou flag_timer" severity error;

        -- Caso B: perfil Expert (limiar = 6 ciclos), toque curto (3 ciclos) = ponto
        tb_a <= '1';
        wait for 30 ns; -- 3 ciclos de clock
        tb_a <= '0';
        wait for 10 ns;
        assert tb_flag_timer = '0'
            report "Falha no Caso B: toque curto no perfil Expert deveria ser ponto" severity error;

        -- Caso C: perfil Expert, toque longo (10 ciclos, acima do limiar de 6) = traco
        wait for 10 ns;
        tb_a <= '1';
        wait for 100 ns; -- 10 ciclos de clock
        tb_a <= '0';
        wait for 10 ns;
        assert tb_flag_timer = '1'
            report "Falha no Caso C: toque longo no perfil Expert deveria ser traco" severity error;

        -- Caso D: mesma duracao do Caso C (10 ciclos), mas perfil Iniciante (limiar = 30
        -- ciclos) -- o mesmo toque que era traco no Expert deve virar ponto aqui
        wait for 10 ns;
        tb_profile <= "00"; -- Iniciante
        tb_a <= '1';
        wait for 100 ns; -- 10 ciclos de clock
        tb_a <= '0';
        wait for 10 ns;
        assert tb_flag_timer = '0'
            report "Falha no Caso D: perfil Iniciante deveria exigir toque mais longo para traco" severity error;

        -- Caso E: reset interrompendo um toque em andamento
        wait for 10 ns;
        tb_a <= '1';
        wait for 100 ns; -- 10 ciclos, suficiente para virar traco se nao fosse o reset
        tb_reset <= '1';
        wait for 10 ns;
        assert tb_flag_timer = '0'
            report "Falha no Caso E: reset nao interrompeu a medicao" severity error;
        tb_reset <= '0';
        tb_a <= '0';

        report "tb_Timer: todos os casos passaram" severity note;

        wait;
    end process;

end sim;
