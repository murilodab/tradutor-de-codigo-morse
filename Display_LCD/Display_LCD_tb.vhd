-- Testa o driver paralelo HD44780 (8 bits) capturando cada byte que
-- ele manda pro barramento (lcd_rs + lcd_data, amostrados na borda de
-- descida de lcd_e, que e quando o HD44780 de verdade latcheia o
-- valor) e conferindo contra a sequencia esperada em
-- display_lcd_input.txt (formato "rs byte_binario", 1 por linha): os
-- 6 bytes da sequencia de inicializacao (function set x3, display
-- control, entry mode, clear), seguidos de 1 byte por caractere
-- decodificado (2 caracteres testados: 'U' e 'F'). Grava
-- "rs byte_binario OK/FALHOU" em display_lcd_output.txt.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
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
	signal lcd_data : std_logic_vector(7 downto 0);

	signal sim_done : boolean := false;

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

	-- Captura (rs, byte) toda vez que lcd_e desce - e nesse instante
	-- que um HD44780 de verdade latcheia o valor do barramento.
	captura_proc : process
		file input_file  : text open read_mode  is "display_lcd_input.txt";
		file output_file : text open write_mode is "display_lcd_output.txt";
		variable in_line      : line;
		variable out_line     : line;
		variable rs_esperado  : integer;
		variable byte_esperado : std_logic_vector(7 downto 0);
		variable ok1, ok2      : boolean;
		variable rs_capturado  : std_logic;
		variable byte_capturado : std_logic_vector(7 downto 0);
		variable rs_ok, byte_ok : boolean;
	begin
		while not endfile(input_file) loop
			readline(input_file, in_line);
			if in_line'length = 0 then
				next;
			end if;

			read(in_line, rs_esperado, ok1);
			read(in_line, byte_esperado, ok2);
			if not (ok1 and ok2) then
				next;
			end if;

			wait until falling_edge(lcd_e);
			rs_capturado   := lcd_rs;
			byte_capturado := lcd_data;

			rs_ok   := (rs_esperado = 1 and rs_capturado = '1') or
			           (rs_esperado = 0 and rs_capturado = '0');
			byte_ok := (byte_capturado = byte_esperado);

			assert rs_ok
				report "Falha (RS): esperado=" & integer'image(rs_esperado) &
				       " capturado=" & std_logic'image(rs_capturado)
				severity error;

			assert byte_ok
				report "Falha (byte): esperado=" & slv_to_string(byte_esperado) &
				       " capturado=" & slv_to_string(byte_capturado)
				severity error;

			write(out_line, rs_esperado);
			write(out_line, string'(" "));
			write(out_line, slv_to_string(byte_capturado));
			write(out_line, string'(" "));
			if rs_ok and byte_ok then
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

	-- Depois da sequencia de inicializacao (6 bytes), dispara 2
	-- caracteres decodificados: 'U' (codigo 011110) e 'F' (codigo
	-- 001111), cada um esperando o anterior terminar antes de disparar.
	stim_proc : process
	begin
		reset <= '1';
		wait for clk_period * 5;
		wait until rising_edge(clock);
		reset <= '0';

		wait until indice = 6;
		wait for 2500 us; -- folga sobre CICLOS_CLEAR (2 ms) antes de aceitar enable

		code_in <= "011110"; -- 'U'
		wait until rising_edge(clock);
		enable <= '1';
		wait until rising_edge(clock);
		enable <= '0';

		wait until indice = 7;
		wait for 100 us; -- folga sobre CICLOS_CMD (50 us) antes de aceitar enable

		code_in <= "001111"; -- 'F'
		wait until rising_edge(clock);
		enable <= '1';
		wait until rising_edge(clock);
		enable <= '0';

		wait until indice = 8;
		wait for 100 us;

		sim_done <= true;
		wait for 1 us;
		wait;
	end process stim_proc;

end architecture sim;
