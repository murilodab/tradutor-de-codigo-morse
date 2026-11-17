library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity Timer_tb is
    -- Testbench entities have no ports
end entity Timer_tb;

architecture sim of Timer_tb is

    -- Use a lower clock frequency in simulation (e.g., 10 kHz instead of 50 MHz)
    -- so 1 second of simulated time takes 10,000 clock cycles instead of 50,000,000.
    -- 1 ms is still exact because Timer divides clock_frequency by 1000.
    constant SIM_CLK_FREQ : integer := 10_000;
    constant CLK_PERIOD   : time    := 1 sec / SIM_CLK_FREQ; -- 100 us

    -- Signals connected to the Unit Under Test (UUT)
    signal clock         : std_logic := '0';
    signal btn_a         : std_logic := '0';
    signal reset         : std_logic := '1';
    signal milissegundos : integer;

    -- Helper procedure to simulate a button press for a given duration
    procedure press_button (
        signal btn          : out std_logic;
        constant hold_time  : in  time;
        constant pause_time : in  time
    ) is
    begin
        btn <= '1';
        wait for hold_time;
        btn <= '0';
        wait for pause_time;
    end procedure press_button;

begin

    -- Instantiate the Timer
    uut : entity work.Timer
        generic map (
            clock_frequency => SIM_CLK_FREQ
        )
        port map (
            clock         => clock,
            btn_a         => btn_a,
            reset         => reset,
            milissegundos => milissegundos
        );

    -- Clock generator process
    clk_gen : process
    begin
        while true loop
            clock <= '0';
            wait for CLK_PERIOD / 2;
            clock <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process clk_gen;

    -- Stimulus process
    stim_proc : process
    begin
        -- 1. Hold reset active for 5 clock cycles, then release
        reset <= '1';
        btn_a <= '0';
        wait for CLK_PERIOD * 5;
        reset <= '0';
        wait for 50 ms;

        -- 2. Press for 100 ms, then wait 50 ms
        report "Pressing button for 100 ms...";
        press_button(btn_a, 100 ms, 50 ms);
        report "Measured value after 100 ms press: " & integer'image(milissegundos) & " ms";

        -- 3. Press for 200 ms, then wait 50 ms
        report "Pressing button for 200 ms...";
        press_button(btn_a, 200 ms, 50 ms);
        report "Measured value after 200 ms press: " & integer'image(milissegundos) & " ms";

        -- 4. Press for 300 ms, then wait 50 ms
        report "Pressing button for 300 ms...";
        press_button(btn_a, 300 ms, 50 ms);
        report "Measured value after 300 ms press: " & integer'image(milissegundos) & " ms";

        -- 5. Press for 400 ms, then wait 50 ms
        report "Pressing button for 400 ms...";
        press_button(btn_a, 400 ms, 50 ms);
        report "Measured value after 400 ms press: " & integer'image(milissegundos) & " ms";

        -- End simulation cleanly (VHDL-2008)
        report "Simulation complete.";
        std.env.stop(0);
        wait;
    end process stim_proc;

end architecture sim;