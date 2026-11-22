library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
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

    signal sim_done : boolean := false;

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
        while not sim_done loop
            clock <= '0';
            wait for CLK_PERIOD / 2;
            clock <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process clk_gen;

    -- Le duracao_ms/esperado_ms de timer_input.txt (tabulado), aplica cada
    -- duracao no btn_a, confere o milissegundos medido contra o esperado
    -- (assert) e grava duracao/medido/resultado em timer_output.txt.
    stim_proc : process
        file input_file     : text open read_mode  is "timer_input.txt";
        file output_file    : text open write_mode is "timer_output.txt";
        variable in_line     : line;
        variable out_line    : line;
        variable duracao_ms  : integer;
        variable esperado_ms : integer;
        variable ok1, ok2    : boolean;
    begin
        -- 1. Hold reset active for 5 clock cycles, then release
        reset <= '1';
        btn_a <= '0';
        wait for CLK_PERIOD * 5;
        reset <= '0';
        wait for 50 ms;

        -- 2. Le cada linha (duracao_ms esperado_ms), pressiona o botao por
        --    duracao_ms e confere o valor medido
        while not endfile(input_file) loop
            readline(input_file, in_line);

            if in_line'length = 0 then
                next;
            end if;

            read(in_line, duracao_ms, ok1);
            read(in_line, esperado_ms, ok2);

            if ok1 and ok2 then
                report "Pressing button for " & integer'image(duracao_ms) & " ms...";
                press_button(btn_a, duracao_ms * 1 ms, 50 ms);

                assert milissegundos = esperado_ms
                    report "Falha: duracao=" & integer'image(duracao_ms) &
                           "ms esperado=" & integer'image(esperado_ms) &
                           "ms medido=" & integer'image(milissegundos) & "ms"
                    severity error;

                write(out_line, duracao_ms);
                write(out_line, string'(" "));
                write(out_line, milissegundos);
                write(out_line, string'(" "));
                if milissegundos = esperado_ms then
                    write(out_line, string'("OK"));
                else
                    write(out_line, string'("FALHOU"));
                end if;
                writeline(output_file, out_line);
            end if;
        end loop;

        file_close(input_file);
        file_close(output_file);

        -- End simulation cleanly (VHDL-2008)
        report "Simulation complete. Results saved to timer_output.txt.";
        sim_done <= true;
        wait for 1 ns;
        std.env.stop(0);
        wait;
    end process stim_proc;

end architecture sim;
