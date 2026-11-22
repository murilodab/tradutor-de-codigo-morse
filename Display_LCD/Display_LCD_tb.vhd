-- Le codigos de 6 bits do display_lcd_input.txt, pulsa "enable" por 1 ciclo
-- pra cada um (no clock real da placa, 50 MHz / 9600 baud), reconstroi o byte 
-- ASCII transmitido amostrando "tx" e confere via assert contra o caractere
-- esperado. Grava "codigo caractere_recebido OK/FALHOU" em display_lcd_output.txt.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity Display_LCD_tb is
end entity Display_LCD_tb;

architecture sim of Display_LCD_tb is

	constant clock_frequency : integer := 50_000_000; -- clock real da placa
	constant baud_rate       : integer := 9600;
	constant clk_period      : time    := 1 sec / clock_frequency;
	constant ciclos_por_bit  : integer := clock_frequency / baud_rate;

	signal clock   : std_logic := '0';
	signal reset   : std_logic := '1';
	signal enable  : std_logic := '0';
	signal code_in : std_logic_vector(5 downto 0) := (others => '0');
	signal tx      : std_logic;

	signal sim_done : boolean := false;

begin

	UUT : entity work.Display_LCD
		generic map (
			clock_frequency => clock_frequency,
			baud_rate        => baud_rate
		)
		port map (
			clock   => clock,
			reset   => reset,
			enable  => enable,
			code_in => code_in,
			tx      => tx
		);

	clk_gen : process
	begin
		while not sim_done loop
			clock <= '0';
			wait for clk_period / 2;
			clock <= '1';
			wait for clk_period / 2;
		end loop;
		wait;
	end process clk_gen;

	stim_proc : process
		file input_file  : text open read_mode  is "display_lcd_input.txt";
		file output_file : text open write_mode is "display_lcd_output.txt";
		variable in_line     : line;
		variable out_line    : line;
		variable codigo_bits : std_logic_vector(5 downto 0);
		variable ok          : boolean;
		variable esperado    : integer;
		variable recebido    : std_logic_vector(7 downto 0);
	begin
		reset  <= '1';
		enable <= '0';
		wait for clk_period * 5;
		wait until rising_edge(clock);
		reset <= '0';
		wait for clk_period * 5;

		while not endfile(input_file) loop
			readline(input_file, in_line);
			if in_line'length = 0 then
				next;
			end if;

			read(in_line, codigo_bits, ok);
			read(in_line, esperado, ok);

			code_in <= codigo_bits;
			wait until rising_edge(clock); -- edge A: Display_LCD ve enable='1' nesta borda
			enable <= '1';
			wait until rising_edge(clock); -- edge B: Display_LCD dispara tx_start
			enable <= '0';
			wait until rising_edge(clock); -- edge C: Uart_tx entra em start_bit (tx so atualiza na proxima borda)
			wait until rising_edge(clock); -- edge D: tx ja reflete o start_bit ('0')
			wait for clk_period / 4;       -- margem pra deixar o sinal regularizar antes de amostrar

			assert tx = '0'
				report "Falha: start bit nao esta em '0'"
				severity error;

			wait for clk_period * (ciclos_por_bit + ciclos_por_bit / 2 - 1);
			for i in 0 to 7 loop
				recebido(i) := tx;
				wait for clk_period * ciclos_por_bit;
			end loop;

			assert tx = '1'
				report "Falha: stop bit nao esta em '1'"
				severity error;

			assert recebido = std_logic_vector(to_unsigned(esperado, 8))
				report "Falha: codigo=" & to_string(codigo_bits) &
				       " esperado=" & integer'image(esperado) &
				       " recebido=" & integer'image(to_integer(unsigned(recebido)))
				severity error;

			write(out_line, to_string(codigo_bits));
			write(out_line, string'(" "));
			write(out_line, character'val(to_integer(unsigned(recebido))));
			write(out_line, string'(" "));
			if recebido = std_logic_vector(to_unsigned(esperado, 8)) then
				write(out_line, string'("OK"));
			else
				write(out_line, string'("FALHOU"));
			end if;
			writeline(output_file, out_line);

			wait for clk_period * ciclos_por_bit * 3;
		end loop;

		file_close(input_file);
		file_close(output_file);

		report "Simulacao do Display_LCD concluida.";
		sim_done <= true;
		wait for 1 us;
		wait;
	end process stim_proc;

end architecture sim;
