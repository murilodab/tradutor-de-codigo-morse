library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.Assembler_pkg.all;

entity Assembler_tb is
end entity Assembler_tb;

architecture sim of Assembler_tb is

    constant CLK_PERIOD : time := 20 ns; -- 50 MHz clock

    -- UUT signals
    signal clock    : std_logic := '0';
    signal reset    : std_logic := '1';
    signal load_a   : std_logic := '0';
    signal btn_b    : std_logic := '0';
    signal D        : std_logic := '0';
    signal Q        : morse_data;

    signal sim_done : boolean := false;

    -- Helper function to convert std_logic_vector to a plain string ("000100")
    function slv_to_string(slv : std_logic_vector) return string is
        variable res : string(1 to slv'length);
        variable idx : integer := 1;
    begin
        for i in slv'range loop
            if slv(i) = '1' then
                res(idx) := '1';
            elsif slv(i) = '0' then
                res(idx) := '0';
            else
                res(idx) := 'X';
            end if;
            idx := idx + 1;
        end loop;
        return res;
    end function;

begin

    -- Instantiate Assembler
    uut : entity work.Assembler
        port map (
            clock  => clock,
            reset  => reset,
            load_a => load_a,
            btn_b  => btn_b,
            D      => D,
            Q      => Q
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

    -- File-reading & file-writing stimulus process
    stim_proc : process
        file input_file     : text open read_mode  is "input_bits.txt";
        file output_file    : text open write_mode is "output_bits.txt";
        variable in_line    : line;
        variable out_line   : line;
        variable ch         : character;
        variable good_read  : boolean;
        variable bit_count  : integer := 0;
    begin
        -- 1. Reset the Assembler
        reset  <= '1';
        load_a <= '0';
        btn_b  <= '0';
        D      <= '0';
        wait for CLK_PERIOD * 3;
        wait until rising_edge(clock);
        reset <= '0';
        wait until rising_edge(clock);

        -- 2. Read one line (one button press) at a time
        while not endfile(input_file) loop
            readline(input_file, in_line);

            -- Handle blank lines as a btn_b press
            if in_line'length = 0 then
                ch := 'b';
                good_read := true;
            else
                read(in_line, ch, good_read);
            end if;

            if good_read then
                -- Case A: Button A press ('0' = dot, '1' = dash)
                if ch = '0' or ch = '1' then
                    if ch = '1' then
                        D <= '1';
                    else
                        D <= '0';
                    end if;

                    -- Simulate load_a pulse from Conversor
                    load_a <= '1';
                    wait until rising_edge(clock);
                    load_a <= '0';
                    wait until rising_edge(clock);

                    bit_count := bit_count + 1;

                    -- If 6 bits were fed, Assembler auto-completes without btn_b
                    if bit_count = 6 then
                        wait for 1 ns;
                        write(out_line, slv_to_string(Q.value));
                        writeline(output_file, out_line);

                        report "6 bits reached | Wrote: " & slv_to_string(Q.value) &
                               " (length = " & integer'image(Q.length) & ")";
                        bit_count := 0;
                    end if;

                    wait for CLK_PERIOD * 3;

                -- Case B: Button B press ('b' or 'B') to finish character early
                elsif ch = 'b' or ch = 'B' then
                    if bit_count > 0 then
                        btn_b <= '1';
                        wait until rising_edge(clock);
                        btn_b <= '0';
                        wait until rising_edge(clock);

                        wait for 1 ns;
                        write(out_line, slv_to_string(Q.value));
                        writeline(output_file, out_line);

                        report "btn_b pressed  | Wrote: " & slv_to_string(Q.value) &
                               " (length = " & integer'image(Q.length) & ")";
                        bit_count := 0;
                    end if;

                    wait for CLK_PERIOD * 3;
                end if;
            end if;
        end loop;

        -- Close both files so output_bits.txt is flushed to disk
        file_close(input_file);
        file_close(output_file);

        report "Simulation complete. Results saved to output_bits.txt.";
        sim_done <= true;
        wait;
    end process stim_proc;

end architecture sim;