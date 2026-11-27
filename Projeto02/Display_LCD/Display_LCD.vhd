-- Driver do display LCD 16x2 (controlador HD44780, sem adaptador),
-- em modo paralelo de 8 bits (D0-D7 + RS + E; RW preso direto no GND
-- fora da FPGA, so escrita, sem checar a flag de ocupado - por isso os
-- atrasos entre comandos sao fixos, com folga sobre o datasheet).
--
-- Converte o codigo de 6 bits que o Tradutor produz (mesma enumeracao
-- do Bcd_7seg: 0-9, depois A-Z) pro ASCII correspondente e escreve no
-- LCD a cada novo caractere decodificado, avancando a coluna; depois de
-- 16 colunas pula pra 2a linha, depois de 32 limpa a tela e recomeca.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Display_LCD is

	generic (
		clock_frequency : integer := 50_000_000
	);

	port (
		clock    : in  std_logic;
		reset    : in  std_logic;
		enable   : in  std_logic;                     -- pulso do tradutor_enable: novo caractere pronto
		code_in  : in  std_logic_vector(5 downto 0);  -- codigo de 6 bits do Tradutor
		lcd_rs   : out std_logic;                     -- 0 = comando, 1 = dado
		lcd_e    : out std_logic;                     -- pulso de enable do HD44780
		lcd_data : out std_logic_vector(7 downto 0)   -- D0-D7 (modo 8 bits)
	);

end entity;

architecture rtl of Display_LCD is
	subtype byte_t is std_logic_vector(7 downto 0);

	-- Converte um atraso em microssegundos pra ciclos de clock, multiplicando
	-- antes de dividir e garantindo pelo menos 1 ciclo, pra nunca gerar
	-- um atraso de 0 ciclos. Divide clock_frequency por 1000 antes de
	-- multiplicar pra nao estourar o range de 32 bits
	function ciclos_do_atraso(us : integer) return integer is
		constant bruto : integer := ((clock_frequency / 1000) * us) / 1000;
	begin
		if bruto < 1 then
			return 1;
		else
			return bruto;
		end if;
	end function;

	-- Atrasos (com folga generosa sobre o datasheet do HD44780), em
	-- ciclos de clock:
	constant CICLOS_POWER_ON   : integer := ciclos_do_atraso(40_000); -- >15ms min
	constant CICLOS_INIT_1     : integer := ciclos_do_atraso(5_000);  -- >4.1ms min
	constant CICLOS_INIT_2     : integer := ciclos_do_atraso(150);    -- >100us min
	constant CICLOS_CMD        : integer := ciclos_do_atraso(50);     -- >37-43us tipico
	constant CICLOS_CLEAR      : integer := ciclos_do_atraso(2_000);  -- >1.52ms min
	constant CICLOS_E_PULSO    : integer := ciclos_do_atraso(2);      -- >450ns min

	-- Function Set com DL=1 (interface de 8 bits): manda-lo repetido 3x na
	-- inicializacao (idempotente - reenviar o mesmo comando nao tem efeito
	-- colateral) resincroniza o controlador num estado conhecido,
	-- independente de como ele ligou, sem precisar da sequencia especial de
	-- nibbles que o modo 4 bits exige.
	constant BYTE_FUNCTION_SET  : std_logic_vector(7 downto 0) := x"38"; -- 8 bits, 2 linhas, 5x8
	constant BYTE_DISPLAY_CTRL  : std_logic_vector(7 downto 0) := x"0C"; -- display on, cursor/blink off
	constant BYTE_ENTRY_MODE    : std_logic_vector(7 downto 0) := x"06"; -- incrementa, sem deslocar
	constant BYTE_CLEAR         : std_logic_vector(7 downto 0) := x"01"; -- limpa e volta pro inicio
	constant BYTE_SET_LINHA2    : std_logic_vector(7 downto 0) := x"C0"; -- DDRAM = 0x40 (inicio da linha 2)

	type estado_type is (
		reset_wait,
		init_a, init_b,
		func_set,
		disp_ctrl,
		entry_mode,
		clear,
		pronto,
		caractere,
		envia_byte_setup, envia_byte_e_alto, envia_byte_e_baixo,
		espera
	);

	signal estado         : estado_type := reset_wait;
	signal estado_retorno : estado_type := reset_wait;

	signal contador        : integer range 0 to CICLOS_POWER_ON := 0;
	signal ciclos_a_esperar : integer range 0 to CICLOS_POWER_ON := 0;

	signal byte_envio : std_logic_vector(7 downto 0) := (others => '0');
	signal rs_envio    : std_logic := '0';

	signal coluna : integer range 0 to 32 := 0;

	signal enable_prev : std_logic := '0';

	-- tradutor_enable oscila s1<->s2 a cada ciclo enquanto btn_b_flag fica
	-- em '1' (a Controladora so sai desse laco quando o botao e solto de
	-- verdade), ficando em '0' por apenas 1 ciclo entre os pulsos. "armado"
	-- so volta a '1' quando enable fica em '0' por 2 ciclos seguidos - o
	-- que so acontece quando o aperto de botao de verdade termina - pra
	-- disparar 1 unico caractere por aperto, em vez de um por ciclo de
	-- oscilacao.
	signal armado : std_logic := '1';

	signal lcd_rs_reg   : std_logic := '0';
	signal lcd_e_reg    : std_logic := '0';
	signal lcd_data_reg : std_logic_vector(7 downto 0) := (others => '0');

	-- Mesma enumeracao de Bcd_7seg.vhd (0-9, depois A-Z), convertida pra
	-- ASCII em vez de segmentos.
	function ascii_do_codigo(codigo : std_logic_vector(5 downto 0)) return byte_t is
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

	lcd_rs   <= lcd_rs_reg;
	lcd_e    <= lcd_e_reg;
	lcd_data <= lcd_data_reg;

	process(clock, reset)
	begin
		if reset = '1' then
			estado          <= reset_wait;
			contador        <= 0;
			armado          <= '1';
			enable_prev     <= '0';
			coluna          <= 0;
			lcd_rs_reg      <= '0';
			lcd_e_reg       <= '0';
			lcd_data_reg    <= (others => '0');
		elsif rising_edge(clock) then

			case estado is

				-- Espera inicial de energizacao (>15ms) antes de mandar
				-- qualquer comando.
				when reset_wait =>
					if contador = CICLOS_POWER_ON - 1 then
						contador <= 0;
						byte_envio       <= BYTE_FUNCTION_SET;
						rs_envio         <= '0';
						ciclos_a_esperar <= CICLOS_INIT_1;
						estado_retorno   <= init_a;
						estado           <= envia_byte_setup;
					else
						contador <= contador + 1;
					end if;

				-- Reenvia o Function Set mais 2 vezes (resincronizacao
				-- padrao do HD44780, idempotente em modo 8 bits) antes de
				-- seguir pro resto da sequencia de inicializacao.
				when init_a =>
					byte_envio       <= BYTE_FUNCTION_SET;
					rs_envio         <= '0';
					ciclos_a_esperar <= CICLOS_INIT_2;
					estado_retorno   <= init_b;
					estado           <= envia_byte_setup;

				-- 2o reenvio do Function Set (ainda so resincronizacao).
				when init_b =>
					byte_envio       <= BYTE_FUNCTION_SET;
					rs_envio         <= '0';
					ciclos_a_esperar <= CICLOS_CMD;
					estado_retorno   <= func_set;
					estado           <= envia_byte_setup;

				-- 3o e definitivo Function Set: fixa 8 bits, 2 linhas, fonte 5x8.
				when func_set =>
					byte_envio       <= BYTE_FUNCTION_SET;
					rs_envio         <= '0';
					ciclos_a_esperar <= CICLOS_CMD;
					estado_retorno   <= disp_ctrl;
					estado           <= envia_byte_setup;

				-- Liga o display e desliga cursor/blink (0x0C).
				when disp_ctrl =>
					byte_envio       <= BYTE_DISPLAY_CTRL;
					rs_envio         <= '0';
					ciclos_a_esperar <= CICLOS_CMD;
					estado_retorno   <= entry_mode;
					estado           <= envia_byte_setup;

				-- Modo de escrita: cursor incrementa, tela nao desloca (0x06).
				when entry_mode =>
					byte_envio       <= BYTE_ENTRY_MODE;
					rs_envio         <= '0';
					ciclos_a_esperar <= CICLOS_CMD;
					estado_retorno   <= clear;
					estado           <= envia_byte_setup;

				-- Limpa o display e volta o cursor pro inicio (0x01).
				when clear =>
					byte_envio       <= BYTE_CLEAR;
					rs_envio         <= '0';
					ciclos_a_esperar <= CICLOS_CLEAR;
					estado_retorno   <= pronto;
					estado           <= envia_byte_setup;

				-- Espera 1 caractere novo. So dispara em borda de subida de
				-- enable, e so se "armado" (ver comentario acima).
				when pronto =>
					if enable = '1' and enable_prev = '0' and armado = '1' then
						armado <= '0';
						if coluna = 32 then
							-- tela cheia: limpa, recomeca da linha 1 e so
							-- depois escreve o caractere pendente
							coluna           <= 0;
							byte_envio       <= BYTE_CLEAR;
							rs_envio         <= '0';
							ciclos_a_esperar <= CICLOS_CLEAR;
							estado_retorno   <= caractere;
							estado           <= envia_byte_setup;
						elsif coluna = 16 then
							-- fim da linha 1: pula pro inicio da linha 2 e so
							-- depois escreve o caractere pendente
							byte_envio       <= BYTE_SET_LINHA2;
							rs_envio         <= '0';
							ciclos_a_esperar <= CICLOS_CMD;
							estado_retorno   <= caractere;
							estado           <= envia_byte_setup;
						else
							byte_envio       <= ascii_do_codigo(code_in);
							rs_envio         <= '1';
							ciclos_a_esperar <= CICLOS_CMD;
							estado_retorno   <= pronto;
							estado           <= envia_byte_setup;
							coluna           <= coluna + 1;
						end if;
					elsif enable = '0' and enable_prev = '0' then
						armado <= '1';
					end if;
					enable_prev <= enable;

				-- Escreve o caractere pendente depois de um clear/set-linha-2
				when caractere =>
					byte_envio       <= ascii_do_codigo(code_in);
					rs_envio         <= '1';
					ciclos_a_esperar <= CICLOS_CMD;
					estado_retorno   <= pronto;
					estado           <= envia_byte_setup;
					coluna           <= coluna + 1;

				-- Mecanismo generico de envio de 1 byte: RS/dados ficam
				-- estaveis por 1 ciclo antes de levantar E (setup time),
				-- segura E em '1' por CICLOS_E_PULSO, derruba E e espera
				-- mais CICLOS_E_PULSO (hold time) antes de seguir pro
				-- atraso pos-comando/dado (ciclos_a_esperar) e so entao
				-- pular pra estado_retorno.
				when envia_byte_setup =>
					lcd_rs_reg   <= rs_envio;
					lcd_data_reg <= byte_envio;
					contador     <= 0;
					estado       <= envia_byte_e_alto;

				-- Mantem E em '1' por CICLOS_E_PULSO (o HD44780 le o
				-- barramento na borda de descida, nao enquanto E esta alto).
				when envia_byte_e_alto =>
					lcd_e_reg <= '1';
					if contador = CICLOS_E_PULSO - 1 then
						contador <= 0;
						estado   <= envia_byte_e_baixo;
					else
						contador <= contador + 1;
					end if;

				-- Derruba E e segura o hold time antes de seguir pro
				-- atraso pos-comando (ou direto pro estado_retorno, se
				-- ciclos_a_esperar = 0).
				when envia_byte_e_baixo =>
					lcd_e_reg <= '0';
					if contador = CICLOS_E_PULSO - 1 then
						contador <= 0;
						if ciclos_a_esperar = 0 then
							estado <= estado_retorno;
						else
							estado <= espera;
						end if;
					else
						contador <= contador + 1;
					end if;

				-- Conta ciclos_a_esperar (o atraso pos-comando/dado) antes
				-- de voltar pro estado_retorno.
				when espera =>
					if contador = ciclos_a_esperar - 1 then
						contador <= 0;
						estado   <= estado_retorno;
					else
						contador <= contador + 1;
					end if;

			end case;
		end if;
	end process;

end rtl;