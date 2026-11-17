library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity tb_Sinalizador is
end entity tb_Sinalizador;

architecture sim of tb_Sinalizador is

	constant sim_clock_freq    : integer := 10000;
	constant clk_period        : time    := 1 sec / sim_clock_freq;
	constant intervalo_aperto  : time    := 50 ms;

	signal clock : std_logic := '0';
	signal reset : std_logic := '0';
	signal btn_a : std_logic := '0';
	signal btn_b : std_logic := '0';
	
	signal disp_char     : std_logic_vector (6 downto 0);
	
	signal fim : boolean := false;


begin

	UUT: entity work.Sinalizador
		generic map(
		clock_frequency => 10000
		)
		port map(
			clock => clock,
			reset => reset,
			btn_a => btn_a,
			btn_b => btn_b,
			disp_char => disp_char
			);
			

clk_gen : process
    begin
        while not fim loop
            clock <= '0';
            wait for clk_period / 2;
            clock <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process clk_gen;


process
	file morse_input  : text open read_mode  is  "morse_input.txt";
	file morse_output : text open write_mode is  "morse_output.txt";
	 
	variable linha_in                 : line;
	variable linha_out                : line;
	variable btn                      : character;
	variable btn_press_duration       : integer;
	variable btn_press_duration_in_ms : time;
	
	begin
		reset <= '1';
		btn_a <= '0';
		btn_b <= '0';
		wait for clk_period * 5;
		wait until rising_edge(clock);
		reset <= '0';
		wait for intervalo_aperto;
		
		while not endfile(morse_input) loop
			readline(morse_input, linha_in);
			
			if linha_in'length = 0 then
				next;
			end if;
			
			read(linha_in, btn);
			read(linha_in, btn_press_duration);
				
			btn_press_duration_in_ms := btn_press_duration * 1 ms;
				
			if btn = 'a' then
				-- simula aperto do botao
				btn_a <= '1';
				wait for btn_press_duration_in_ms;
				btn_a <= '0';
				wait for intervalo_aperto;
				
			elsif btn = 'b' then
				btn_b <= '1';
				wait for btn_press_duration_in_ms;
				btn_b <= '0';
				wait for intervalo_aperto;
					
				write(linha_out, disp_char);
				writeline(morse_output, linha_out);
					
			end if;
		end loop;
		
			file_close(morse_input);
			file_close(morse_output);
			
			fim <= true;
		
			wait for 1 sec;
			wait;
		end process;

end sim;