library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Conversor_tb is
end entity Conversor_tb;

architecture sim of Conversor_tb is

    constant CLK_PERIOD : time := 20 ns; -- 50 MHz clock

    -- Array containing your exact test sequence
    type int_array is array (natural range <>) of integer;
    constant TEST_VALUES : int_array := (
        100, 150, 120, 125, 260, 300, 302, 301, 299, 500, 600, 900, 1000
    );

    -- Signals connected to the Unit Under Test (UUT)
    signal clock          : std_logic := '0';
    signal reset          : std_logic := '1';
    signal btn_a          : std_logic := '0'; -- Added btn_a signal
    signal milissegundos  : integer   := 0;
    signal load_assembler : std_logic;
    signal output         : std_logic;

    signal sim_done       : boolean   := false;

begin

    -- Instantiate Conversor (tempo_ponto = 300 -> tempo_traco = 900)
    uut : entity work.Conversor
        generic map (
            tempo_ponto => 300
        )
        port map (
            clock          => clock,
            reset          => reset,
            btn_a          => btn_a, -- Mapped to UUT
            milissegundos  => milissegundos,
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
    begin
        -- 1. Apply synchronous reset
        reset         <= '1';
        btn_a         <= '0';
        milissegundos <= 0;
        wait for CLK_PERIOD * 3;
        wait until rising_edge(clock);
        reset <= '0';
        wait until rising_edge(clock);

        -- 2. Loop through all test values, simulating press + release of btn_a
        for i in TEST_VALUES'range loop
            -- Simulate button being pressed and reaching TEST_VALUES(i) ms
            btn_a         <= '1';
            milissegundos <= TEST_VALUES(i);
            wait for CLK_PERIOD * 2;

            -- Simulate button release (triggers falling edge inside Conversor)
            btn_a <= '0';
            wait until rising_edge(clock); -- Edge is sampled on this clock
            wait for 1 ns;                 -- Small delta so signals settle for report

            report "ms = " & integer'image(milissegundos) &
                   " | output = " & std_logic'image(output) &
                   " | load_assembler (pulse) = " & std_logic'image(load_assembler);

            -- Wait 2 more clock cycles so you can verify load_assembler drops back to '0'
            wait for CLK_PERIOD * 2;
        end loop;

        report "Simulation complete.";
        sim_done <= true;
        wait;
    end process stim_proc;

end architecture sim;