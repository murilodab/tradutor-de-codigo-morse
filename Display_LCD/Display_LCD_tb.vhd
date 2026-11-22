-- Testa o driver paralelo HD44780 (4 bits) capturando cada nibble que
-- ele manda pro barramento (lcd_rs + lcd_data, amostrados na borda de
-- descida de lcd_e, que e quando o HD44780 de verdade latcheia o
-- valor) e conferindo contra a sequencia esperada em
-- display_lcd_input.txt (formato "rs nibble_binario", 1 por linha): os
-- 12 nibbles da sequencia de inicializacao (resync 0x3 x3, 0x2,
-- function set, display control, entry mode, clear), seguidos de 2
-- nibbles por caractere decodificado (2 caracteres testados: 'U' e
-- 'F'). Grava "rs nibble_binario OK/FALHOU" em display_lcd_output.txt.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity Display_LCD_tb is
end entity Display_LCD_tb;

architecture sim of Display_LCD_tb is

	constant clock_frequency : integer := 50_000_000; -- clock real da placa
	constant clk_period      : time    := 1 sec / clock_frequency;

	signal clock    : std_logic := '0';
	signal reset    : std_logic := '1';
	signal enable   : std_logic := '0';
	signal code_in  : std_logic_vector(5 downto 0) := (others => '0');
	signal lcd_rs   : std_logic;
	signal lcd_e    : std_logic;
	signal lcd_data : std_logic_vector(7 downto 4);

	signal sim_done : boolean := false;
	signal indice   : integer := 0;

begin

	UUT : entity work.Display_LCD
		generic map (
			clock_frequency => clock_frequency
		)
		port map (
			clock    => clock,
			reset    => reset,
			enable   => enable,
			code_in  => code_in,
			lcd_rs   => lcd_rs,
			lcd_e    => lcd_e,
			lcd_data => lcd_data
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

	-- Captura (rs, nibble) toda vez que lcd_e desce - e nesse instante
	-- que um HD44780 de verdade latcheia o valor do barramento.
	captura_proc : process
		file input_file  : text open read_mode  is "display_lcd_input.txt";
		file output_file : text open write_mode is "display_lcd_output.txt";
		variable in_line     : line;
		variable out_line    : line;
		variable rs_esperado : integer;
		variable nib_esperado : std_logic_vector(3 downto 0);
		variable ok1, ok2     : boolean;
		variable rs_capturado : std_logic;
		variable nib_capturado : std_logic_vector(3 downto 0);
		variable rs_ok, nib_ok : boolean;
	begin
		while not endfile(input_file) loop
			readline(input_file, in_line);
			if in_line'length = 0 then
				next;
			end if;

			read(in_line, rs_esperado, ok1);
			read(in_line, nib_esperado, ok2);
			if not (ok1 and ok2) then
				next;
			end if;

			wait until falling_edge(lcd_e);
			rs_capturado  := lcd_rs;
			nib_capturado := lcd_data;

			rs_ok  := (rs_esperado = 1 and rs_capturado = '1') or
			          (rs_esperado = 0 and rs_capturado = '0');
			nib_ok := (nib_capturado = nib_esperado);

			assert rs_ok
				report "Falha (RS): esperado=" & integer'image(rs_esperado) &
				       " capturado=" & std_logic'image(rs_capturado)
				severity error;

			assert nib_ok
				report "Falha (nibble): esperado=" & to_string(nib_esperado) &
				       " capturado=" & to_string(nib_capturado)
				severity error;

			write(out_line, rs_esperado);
			write(out_line, string'(" "));
			write(out_line, to_string(nib_capturado));
			write(out_line, string'(" "));
			if rs_ok and nib_ok then
				write(out_line, string'("OK"));
			else
				write(out_line, string'("FALHOU"));
			end if;
			writeline(output_file, out_line);

			indice <= indice + 1;
		end loop;

		file_close(input_file);
		file_close(output_file);
		report "Simulacao do Display_LCD (HD44780) concluida.";
		wait;
	end process captura_proc;

	-- Depois da sequencia de inicializacao (12 nibbles), dispara 2
	-- caracteres decodificados: 'U' (codigo 011110) e 'F' (codigo
	-- 001111), cada um esperando o anterior terminar antes de disparar.
	stim_proc : process
	begin
		reset <= '1';
		wait for clk_period * 5;
		wait until rising_edge(clock);
		reset <= '0';

		wait until indice = 12;
		wait for 2500 us; -- folga sobre CICLOS_CLEAR (2 ms) antes de aceitar enable

		code_in <= "011110"; -- 'U'
		wait until rising_edge(clock);
		enable <= '1';
		wait until rising_edge(clock);
		enable <= '0';

		wait until indice = 14;
		wait for 100 us; -- folga sobre CICLOS_CMD (50 us) antes de aceitar enable

		code_in <= "001111"; -- 'F'
		wait until rising_edge(clock);
		enable <= '1';
		wait until rising_edge(clock);
		enable <= '0';

		wait until indice = 16;
		wait for 100 us;

		sim_done <= true;
		wait for 1 us;
		wait;
	end process stim_proc;

end architecture sim;
