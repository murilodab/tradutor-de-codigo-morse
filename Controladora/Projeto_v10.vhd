-- Projeto Final LSD V1.0
-- Tradutor de Codigo Morse

library ieee;
use ieee.std_logic_1164.all;

entity Projeto_v10 is

	port(
		clock		  : in	std_logic;
		reset 	  : in	std_logic;
		btn_b_flag : in   std_logic;
		
		timer_reset 	 : out std_logic;
		conversor_reset : out std_logic;
		assembler_reset : out std_logic;
		tradutor_enable : out std_logic
		
	);

end entity;

architecture rtl of Projeto_v10 is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2);

	-- Register to hold the current state
	signal state   : state_type;

begin

	-- Logic to advance to the next state
	process (clock, reset)
	begin
		if reset = '1' then
			state <= s0;
		elsif (rising_edge(clock)) then
			case state is
				when s0=>
						state <= s1;
				when s1=>
					if btn_b_flag = '1' then
						state <= s2;
					else
						state <= s1;
					end if;
				when s2=>
						state <= s1;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when s0 =>
				timer_reset <= '1';
				conversor_reset <= '1';
				assembler_reset <= '1';
				tradutor_enable <= '0';
			when s1=>
				timer_reset <= '0';
				conversor_reset <= '0';
				assembler_reset <= '0';
				tradutor_enable <= '0';
			when s2=>
				timer_reset <= '1';
				conversor_reset <= '1';
				assembler_reset <= '1';
				tradutor_enable <= '1';
		end case;
	end process;
end rtl;
