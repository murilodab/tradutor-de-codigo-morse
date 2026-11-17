library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Conversor_tb is
end entity Conversor_tb;

architecture sim of Conversor_tb is

    constant CLK_PERIOD : time := 20 ns; -- 50 MHz clock

    type profile_array is array (natural range <>) of std_logic_vector(1 downto 0);
    constant PROFILES : profile_array := ("00", "01", "10"); -- Iniciante, Avancado, Expert

    type int_array is array (natural range <>) of integer;

    -- Signals connected to the Unit Under Test (UUT)
    signal clock          : std_logic := '0';
    signal reset          : std_logic := '1';
    signal btn_a          : std_logic := '0';
    signal milissegundos  : integer   := 0;
    signal profile        : std_logic_vector(1 downto 0) := "00";
    signal load_assembler : std_logic;
    signal output         : std_logic;

    signal sim_done       : boolean   := false;

    -- Repete o mapeamento perfil -> tempo_ponto feito dentro do Conversor,
    -- so para gerar os valores de teste e a mensagem do report.
    function tempo_ponto_do_perfil(p : std_logic_vector(1 downto 0)) return integer is
    begin
        case p is
            when "00"   => return 1000; -- Iniciante
            when "01"   => return 500;  -- Avancado
            when others => return 200;  -- Expert
        end case;
    end function;

begin

    -- Instantiate Conversor
    uut : entity work.Conversor
        port map (
            clock          => clock,
            reset          => reset,
            btn_a          => btn_a,
            milissegundos  => milissegundos,
            profile        => profile,
            load_assembler => load_assembler,
            output         => output
        );

    -- Clock generator
    clk_gen : process
    begin
        while not sim_done loop
            clock <= '0';
            wait for CLK_PERIOD / 2;
            clock <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process clk_gen;

    -- Stimulus process
    stim_proc : process
        variable tp          : integer;
        variable tt          : integer;
        variable test_values : int_array(0 to 4);
    begin
        -- 1. Apply synchronous reset
        reset         <= '1';
        btn_a         <= '0';
        milissegundos <= 0;
        wait for CLK_PERIOD * 3;
        wait until rising_edge(clock);
        reset <= '0';
        wait until rising_edge(clock);

        -- 2. Para cada perfil, testa: bem abaixo do ponto, no limiar do ponto,
        --    logo acima (traco), no limiar do traco, e logo acima (ignorado)
        for p in PROFILES'range loop
            profile <= PROFILES(p);
            tp := tempo_ponto_do_perfil(PROFILES(p));
            tt := tp * 3;
            test_values := (1, tp, tp + 1, tt, tt + 1);

            for i in test_values'range loop
                btn_a         <= '1';
                milissegundos <= test_values(i);
                wait for CLK_PERIOD * 2;

                -- Simulate button release (triggers falling edge inside Conversor)
                btn_a <= '0';
                wait until rising_edge(clock); -- Edge is sampled on this clock
                wait for 1 ns;                 -- Small delta so signals settle for report

                report "perfil=" & integer'image(p) &
                       " tempo_ponto=" & integer'image(tp) &
                       " tempo_traco=" & integer'image(tt) &
                       " | ms=" & integer'image(milissegundos) &
                       " | output=" & std_logic'image(output) &
                       " | load_assembler(pulse)=" & std_logic'image(load_assembler);

                -- Wait 2 more clock cycles so you can verify load_assembler drops back to '0'
                wait for CLK_PERIOD * 2;
            end loop;
        end loop;

        report "Simulation complete.";
        sim_done <= true;
        wait;
    end process stim_proc;

end architecture sim;
