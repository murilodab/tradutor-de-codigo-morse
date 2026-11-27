library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity tb_Sinalizador is
end entity tb_Sinalizador;

architecture sim of tb_Sinalizador is

	-- Traduz o padrao de 7 segmentos de volta para o caractere que ele
	-- representa (mesma tabela de Bcd_7seg.vhd, na direcao inversa), so
	-- para anotar morse_output.txt de forma legivel. Alguns padroes sao
	-- fisicamente identicos no display de 7 segmentos (2/Z, 5/S, H/X,
	-- M/n); nesses casos a funcao retorna a letra, nao o digito.
	function letra_do_display(seg : std_logic_vector(6 downto 0)) return character is
	begin
		case seg is
			when "1111110" => return '0';
			when "0110000" => return '1';
			when "1101101" => return 'Z'; -- mesmo padrao do digito 2
			when "1111001" => return '3';
			when "0110011" => return '4';
			when "1011011" => return 'S'; -- mesmo padrao do digito 5
			when "1011111" => return '6';
			when "1110000" => return '7';
			when "1111111" => return '8';
			when "1111011" => return '9';
			when "1110111" => return 'A';
			when "0011111" => return 'b';
			when "1001110" => return 'C';
			when "0111101" => return 'd';
			when "1001111" => return 'E';
			when "1000111" => return 'f';
			when "1011110" => return 'G';
			when "0110111" => return 'H'; -- mesmo padrao de X
			when "0000110" => return 'I';
			when "0111100" => return 'J';
			when "1010111" => return 'K';
			when "0001110" => return 'L';
			when "0010101" => return 'M'; -- mesmo padrao de n (minusculo)
			when "0011101" => return 'o';
			when "1100111" => return 'P';
			when "1110011" => return 'q';
			when "0000101" => return 'r';
			when "0001111" => return 't';
			when "0111110" => return 'U';
			when "0011100" => return 'v';
			when "0101010" => return 'W';
			when "0111011" => return 'y';
			when "0000001" => return '.'; -- sem caractere decodificado ainda
			when others    => return ' '; -- display apagado
		end case;
	end function;

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
				write(linha_out, string'(" "));
				write(linha_out, letra_do_display(disp_char));
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