-- Transmissor UART (8N1): envia 1 byte em serie (start bit, 8 bits de
-- dado LSB primeiro, stop bit), a tx_start = '1' por 1 ciclo de clock.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Uart_tx is

	generic (
		clock_frequency : integer := 50_000_000;
		baud_rate        : integer := 9600
	);

	port (
		clock    : in  std_logic;
		reset    : in  std_logic;
		tx_start : in  std_logic;                    -- pulso de 1 ciclo: inicia o envio
		data_in  : in  std_logic_vector(7 downto 0); -- byte a transmitir
		tx       : out std_logic;                    -- linha serial (idle = '1')
		busy     : out std_logic                     -- '1' enquanto esta transmitindo
	);

end entity;

architecture rtl of Uart_tx is

	constant ciclos_por_bit : integer := clock_frequency / baud_rate;

	type estado_type is (idle, start_bit, data_bits, stop_bit);
	signal estado     : estado_type := idle;
	signal contador   : integer range 0 to ciclos_por_bit - 1 := 0;
	signal indice_bit : integer range 0 to 7 := 0;
	signal shift_reg  : std_logic_vector(7 downto 0) := (others => '0');
	signal tx_reg     : std_logic := '1';

begin

	tx   <= tx_reg;
	busy <= '0' when estado = idle else '1';

	process(clock, reset)
	begin
		if reset = '1' then
			estado     <= idle;
			tx_reg     <= '1';
			contador   <= 0;
			indice_bit <= 0;
		elsif rising_edge(clock) then
			case estado is
				when idle =>
					tx_reg <= '1';
					if tx_start = '1' then
						shift_reg <= data_in;
						contador  <= 0;
						estado    <= start_bit;
					end if;

				when start_bit =>
					tx_reg <= '0';
					if contador = ciclos_por_bit - 1 then
						contador   <= 0;
						indice_bit <= 0;
						estado     <= data_bits;
					else
						contador <= contador + 1;
					end if;

				when data_bits =>
					tx_reg <= shift_reg(indice_bit);
					if contador = ciclos_por_bit - 1 then
						contador <= 0;
						if indice_bit = 7 then
							estado <= stop_bit;
						else
							indice_bit <= indice_bit + 1;
						end if;
					else
						contador <= contador + 1;
					end if;

				when stop_bit =>
					tx_reg <= '1';
					if contador = ciclos_por_bit - 1 then
						contador <= 0;
						estado   <= idle;
					else
						contador <= contador + 1;
					end if;
			end case;
		end if;
	end process;

end rtl;
