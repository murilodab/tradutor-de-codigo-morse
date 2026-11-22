-- Ponte entre o codigo de 6 bits que o Tradutor produz e um display LCD 16x2 
-- controlado por UART: converte esse codigo para o byte ASCII correspondente
-- e manda pela serial (9600 8N1) toda vez que o Tradutor sinaliza um novo 
-- caractere decodificado.

library ieee;
use ieee.std_logic_1164.all;

entity Display_LCD is

	generic (
		clock_frequency : integer := 50_000_000;
		baud_rate        : integer := 9600
	);

	port (
		clock   : in  std_logic;
		reset   : in  std_logic;
		enable  : in  std_logic;                     -- pulso do tradutor_enable: novo caractere pronto
		code_in : in  std_logic_vector(5 downto 0);  -- codigo de 6 bits do Tradutor
		tx      : out std_logic                      -- saida serial para o display LCD 16x2
	);

end entity;

architecture rtl of Display_LCD is

	signal ascii_char  : std_logic_vector(7 downto 0) := (others => '0');
	signal tx_start    : std_logic := '0';
	signal busy        : std_logic;
	signal enable_prev : std_logic := '0';

	-- tradutor_enable oscila s1<->s2 a cada ciclo enquanto btn_b_flag fica
	-- em '1' (a Controladora so sai desse laco quando o botao e solto de
	-- verdade), ficando em '0' por apenas 1 ciclo entre os pulsos. "armado"
	-- so volta a '1' quando enable fica em '0' por 2 ciclos seguidos - o
	-- que so acontece quando o aperto de botao de verdade termina - pra
	-- disparar 1 unico envio por aperto, em vez de um por ciclo de oscilacao.
	signal armado : std_logic := '1';

	-- Enumeração convertida para ASCII
	function ascii_do_codigo(codigo : std_logic_vector(5 downto 0)) return std_logic_vector is
	begin
		case codigo is
			when "000000" => return x"30"; -- '0'
			when "000001" => return x"31"; -- '1'
			when "000010" => return x"32"; -- '2'
			when "000011" => return x"33"; -- '3'
			when "000100" => return x"34"; -- '4'
			when "000101" => return x"35"; -- '5'
			when "000110" => return x"36"; -- '6'
			when "000111" => return x"37"; -- '7'
			when "001000" => return x"38"; -- '8'
			when "001001" => return x"39"; -- '9'
			when "001010" => return x"41"; -- 'A'
			when "001011" => return x"42"; -- 'B'
			when "001100" => return x"43"; -- 'C'
			when "001101" => return x"44"; -- 'D'
			when "001110" => return x"45"; -- 'E'
			when "001111" => return x"46"; -- 'F'
			when "010000" => return x"47"; -- 'G'
			when "010001" => return x"48"; -- 'H'
			when "010010" => return x"49"; -- 'I'
			when "010011" => return x"4A"; -- 'J'
			when "010100" => return x"4B"; -- 'K'
			when "010101" => return x"4C"; -- 'L'
			when "010110" => return x"4D"; -- 'M'
			when "010111" => return x"4E"; -- 'N'
			when "011000" => return x"4F"; -- 'O'
			when "011001" => return x"50"; -- 'P'
			when "011010" => return x"51"; -- 'Q'
			when "011011" => return x"52"; -- 'R'
			when "011100" => return x"53"; -- 'S'
			when "011101" => return x"54"; -- 'T'
			when "011110" => return x"55"; -- 'U'
			when "011111" => return x"56"; -- 'V'
			when "100000" => return x"57"; -- 'W'
			when "100001" => return x"58"; -- 'X'
			when "100010" => return x"59"; -- 'Y'
			when "100011" => return x"5A"; -- 'Z'
			when "111111" => return x"2E"; -- '.'
			when others   => return x"20"; -- espaco
		end case;
	end function;

begin

	I_Uart_tx : entity work.Uart_tx
		generic map (
			clock_frequency => clock_frequency,
			baud_rate        => baud_rate
		)
		port map (
			clock    => clock,
			reset    => reset,
			tx_start => tx_start,
			data_in  => ascii_char,
			tx       => tx,
			busy     => busy
		);

	-- Dispara 1 envio por borda de subida de enable, so se "armado" (ver
	-- comentario acima) e o transmissor nao estiver ocupado.
	process(clock, reset)
	begin
		if reset = '1' then
			enable_prev <= '0';
			tx_start    <= '0';
			ascii_char  <= (others => '0');
			armado      <= '1';
		elsif rising_edge(clock) then
			tx_start <= '0';
			if enable = '1' and enable_prev = '0' and armado = '1' and busy = '0' then
				ascii_char <= ascii_do_codigo(code_in);
				tx_start   <= '1';
				armado     <= '0';
			elsif enable = '0' and enable_prev = '0' then
				armado <= '1';
			end if;
			enable_prev <= enable;
		end if;
	end process;

end rtl;
