library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity Conversor_tb is
end entity Conversor_tb;

architecture sim of Conversor_tb is

    constant CLK_PERIOD : time := 20 ns; -- 50 MHz clock

    -- Signals connected to the Unit Under Test (UUT)
    signal clock          : std_logic := '0';
    signal reset          : std_logic := '1';
    signal btn_a          : std_logic := '0';
    signal milissegundos  : integer   := 0;
    signal load_assembler : std_logic;
    signal output         : std_logic;

    signal sim_done       : boolean   := false;

    function sl_to_char(v : std_logic) return character is
    begin
        if v = '1' then
            return '1';
        else
            return '0';
        end if;
    end function;

begin

    -- Instantiate Conversor (tempo_ponto = 300 -> tempo_traco = 900)
    uut : entity work.Conversor
        generic map (
            tempo_ponto => 300
        )
        port map (
            clock          => clock,
            reset          => reset,
            btn_a          => btn_a,
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

    -- Le ms/esperado_output/esperado_load de conversor_input.txt (tabulado),
    -- simula o toque com aquela duracao, confere output/load_assembler
    -- contra o esperado (assert) e grava o resultado em conversor_output.txt.
    stim_proc : process
        file input_file      : text open read_mode  is "conversor_input.txt";
        file output_file     : text open write_mode is "conversor_output.txt";
        variable in_line      : line;
        variable out_line     : line;
        variable ms           : integer;
        variable esp_output   : integer;
        variable esp_load     : integer;
        variable ok1, ok2, ok3 : boolean;
    begin
        -- 1. Apply synchronous reset
        reset         <= '1';
        btn_a         <= '0';
        milissegundos <= 0;
        wait for CLK_PERIOD * 3;
        wait until rising_edge(clock);
        reset <= '0';
        wait until rising_edge(clock);

        -- 2. Le cada linha (ms esperado_output esperado_load), simula
        --    pressionar+soltar o botao com aquela duracao e confere o resultado
        while not endfile(input_file) loop
            readline(input_file, in_line);

            if in_line'length = 0 then
                next;
            end if;

            read(in_line, ms, ok1);
            read(in_line, esp_output, ok2);
            read(in_line, esp_load, ok3);

            if ok1 and ok2 and ok3 then
                -- Simulate button being pressed and reaching ms
                btn_a         <= '1';
                milissegundos <= ms;
                wait for CLK_PERIOD * 2;

                -- Simulate button release (triggers falling edge inside Conversor)
                btn_a <= '0';
                wait until rising_edge(clock); -- Edge is sampled on this clock
                wait for 1 ns;                 -- Small delta so signals settle

                assert (load_assembler = '1') = (esp_load = 1)
                    report "Falha (load_assembler): ms=" & integer'image(ms) &
                           " esperado=" & integer'image(esp_load) &
                           " observado=" & std_logic'image(load_assembler)
                    severity error;

                if esp_load = 1 then
                    assert (output = '1') = (esp_output = 1)
                        report "Falha (output): ms=" & integer'image(ms) &
                               " esperado=" & integer'image(esp_output) &
                               " observado=" & std_logic'image(output)
                        severity error;
                end if;

                write(out_line, ms);
                write(out_line, string'(" "));
                write(out_line, sl_to_char(output));
                write(out_line, string'(" "));
                write(out_line, sl_to_char(load_assembler));
                write(out_line, string'(" "));
                if (load_assembler = '1') = (esp_load = 1) and
                   (esp_load = 0 or (output = '1') = (esp_output = 1)) then
                    write(out_line, string'("OK"));
                else
                    write(out_line, string'("FALHOU"));
                end if;
                writeline(output_file, out_line);

                -- Wait 2 more clock cycles so load_assembler drops back to '0'
                wait for CLK_PERIOD * 2;
            end if;
        end loop;

        file_close(input_file);
        file_close(output_file);

        report "Simulation complete. Results saved to conversor_output.txt.";
        sim_done <= true;
        wait;
    end process stim_proc;

end architecture sim;
