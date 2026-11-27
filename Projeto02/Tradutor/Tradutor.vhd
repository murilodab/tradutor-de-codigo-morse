-- traduz um record vindo do assembler em codigo para o display de 7 segmentos

library ieee;
use ieee.std_logic_1164.all;
use work.Assembler_pkg.all;

entity Tradutor is

	port 
	(
		clock         : in std_logic;
		morse_data_in : in morse_data;
		enable        : in std_logic;
		seven_seg_out : out std_logic_vector (5 downto 0) := "111111"
	);

end entity;

architecture rtl of Tradutor is

begin
	process (clock)
	begin
	if rising_edge(clock) then
	    if enable = '1' then
		case morse_data_in.length is
			when 1 =>
				case morse_data_in.value is
					when "000000" => seven_seg_out <= "001110"; -- E
					when "000001" => seven_seg_out <= "011101"; -- t
					when others => seven_seg_out <= "111111"; -- .
				end case;
			when 2 =>
				case morse_data_in.value is
					when "000001" => seven_seg_out <= "001010"; -- A
					when "000000" => seven_seg_out <= "010010"; -- I
					when "000010" => seven_seg_out <= "010111"; -- n
					when "000011" => seven_seg_out <= "010110"; -- M
					when others => seven_seg_out <= "111111"; -- .
				end case;
			when 3 =>
				case morse_data_in.value is
					when "000100" => seven_seg_out <= "001101"; -- d
					when "000110" => seven_seg_out <= "010000"; -- G
					when "000101" => seven_seg_out <= "010100"; -- K
					when "000111" => seven_seg_out <= "011000"; -- O
					when "000010" => seven_seg_out <= "011011"; -- r
					when "000000" => seven_seg_out <= "011100"; -- S
					when "000001" => seven_seg_out <= "011110"; -- U
					when "000011" => seven_seg_out <= "100000"; -- W
					when others => seven_seg_out <= "111111"; -- .
				end case;
			when 4 =>
				case morse_data_in.value is
					when "001000" => seven_seg_out <= "001011"; -- b
					when "001010" => seven_seg_out <= "001100"; -- C
					when "000010" => seven_seg_out <= "001111"; -- F
					when "000000" => seven_seg_out <= "010001"; -- H
					when "000111" => seven_seg_out <= "010011"; -- J
					when "000100" => seven_seg_out <= "010101"; -- L
					when "000110" => seven_seg_out <= "011001"; -- P
					when "001101" => seven_seg_out <= "011010"; -- q
					when "000001" => seven_seg_out <= "011111"; -- v
					when "001001" => seven_seg_out <= "100001"; -- X
					when "001011" => seven_seg_out <= "100010"; -- y
					when "001100" => seven_seg_out <= "100011"; -- Z
					when others => seven_seg_out <= "111111"; -- .
				end case;	
			when 5 =>
				case morse_data_in.value is
					when "111111" => seven_seg_out <= "000000"; -- 0
					when "001111" => seven_seg_out <= "000001"; -- 1
					when "000111" => seven_seg_out <= "000010"; -- 2
					when "000011" => seven_seg_out <= "000011"; -- 3
					when "000001" => seven_seg_out <= "000100"; -- 4
					when "000000" => seven_seg_out <= "000101"; -- 5
					when "010000" => seven_seg_out <= "000110"; -- 6
					when "011000" => seven_seg_out <= "000111"; -- 7
					when "011100" => seven_seg_out <= "001000"; -- 8
					when "011110" => seven_seg_out <= "001001"; -- 9
					when others => seven_seg_out <= "111111"; -- .
				end case;
			when 6 =>
				case morse_data_in.value is
					when others => seven_seg_out <= "111111"; -- .
				end case;
			when others => seven_seg_out <= "111111"; -- .
		end case;
	    end if; -- quando enable = '0', mantem o ultimo caractere decodificado
	end if;
end process;

end rtl;
