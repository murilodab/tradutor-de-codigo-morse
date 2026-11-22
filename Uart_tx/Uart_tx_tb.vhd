-- Le bytes (0-255) de uart_tx_input.txt, manda cada um pelo Uart_tx e
-- reconstroi o byte recebido amostrando a linha "tx" no meio de cada
-- periodo de bit (como um receptor UART faria), conferindo via assert
-- contra o valor esperado. Grava "enviado reconstruido OK/FALHOU" em
-- uart_tx_output.txt.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity Uart_tx_tb is
end entity Uart_tx_tb;

architecture sim of Uart_tx_tb is

	constant sim_clock_freq  : integer := 10_000; -- 10 kHz
	constant sim_baud_rate   : integer := 1_000;  -- 10 ciclos de clock por bit
	constant clk_period      : time    := 1 sec / sim_clock_freq;
	constant ciclos_por_bit  : integer := sim_clock_freq / sim_baud_rate;

	signal clock    : std_logic := '0';
	signal reset    : std_logic := '1';
	signal tx_start : std_logic := '0';
	signal data_in  : std_logic_vector(7 downto 0) := (others => '0');
	signal tx       : std_logic;
	signal busy     : std_logic;

	signal sim_done : boolean := false;

begin

	UUT : entity work.Uart_tx
		generic map (
			clock_frequency => sim_clock_freq,
			baud_rate        => sim_baud_rate
		)
		port map (
			clock    => clock,
			reset    => reset,
			tx_start => tx_start,
			data_in  => data_in,
			tx       => tx,
			busy     => busy
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
		file input_file  : text open read_mode  is "uart_tx_input.txt";
		file output_file : text open write_mode is "uart_tx_output.txt";
		variable in_line  : line;
		variable out_line : line;
		variable byte_val : integer;
		variable ok       : boolean;
		variable recebido : std_logic_vector(7 downto 0);
	begin
		reset    <= '1';
		tx_start <= '0';
		wait for clk_period * 5;
		wait until rising_edge(clock);
		reset <= '0';
		wait for clk_period * 5;

		while not endfile(input_file) loop
			readline(input_file, in_line);
			if in_line'length = 0 then
				next;
			end if;

			read(in_line, byte_val, ok);
			if not ok then
				next;
			end if;

			data_in  <= std_logic_vector(to_unsigned(byte_val, 8));
			wait until rising_edge(clock); -- edge A: FSM ve tx_start='1' nesta borda
			tx_start <= '1';
			wait until rising_edge(clock); -- edge B: FSM entra em start_bit (tx so atualiza na proxima borda)
			tx_start <= '0';
			wait until rising_edge(clock); -- edge C: tx_reg agora reflete o start_bit ('0')
			wait for clk_period / 4;       -- margem pra deixar o sinal assentar

			assert tx = '0'
				report "Falha: start bit nao esta em '0'"
				severity error;

			-- a partir daqui (logo apos edge C), cada bit de dado ocupa uma
			-- janela de ciclos_por_bit ciclos; amostra no meio de cada um
			-- (metade da 1a janela de dado, que comeca ciclos_por_bit
			-- ciclos depois de edge C).
			wait for clk_period * (ciclos_por_bit + ciclos_por_bit / 2 - 1);
			for i in 0 to 7 loop
				recebido(i) := tx;
				wait for clk_period * ciclos_por_bit;
			end loop;

			-- nesse ponto a amostra caiu no meio do stop bit
			assert tx = '1'
				report "Falha: stop bit nao esta em '1'"
				severity error;

			assert recebido = std_logic_vector(to_unsigned(byte_val, 8))
				report "Falha: enviado=" & integer'image(byte_val) &
				       " reconstruido=" & integer'image(to_integer(unsigned(recebido)))
				severity error;

			write(out_line, byte_val);
			write(out_line, string'(" "));
			write(out_line, to_integer(unsigned(recebido)));
			write(out_line, string'(" "));
			if recebido = std_logic_vector(to_unsigned(byte_val, 8)) then
				write(out_line, string'("OK"));
			else
				write(out_line, string'("FALHOU"));
			end if;
			writeline(output_file, out_line);

			wait until busy = '0';
			wait for clk_period * ciclos_por_bit;
		end loop;

		file_close(input_file);
		file_close(output_file);

		report "Simulacao do Uart_tx concluida.";
		sim_done <= true;
		wait for 1 sec;
		wait;
	end process stim_proc;

end architecture sim;
