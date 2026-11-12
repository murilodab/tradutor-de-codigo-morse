-- Esse componente recebe um bit de entrada que e convertido em um
-- record baseado na duracao do input e entao o converte para 0 ou 1

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Conversor is

	port 
	(
		clock          : in std_logic;
		reset          : in std_logic;
		a	            : in std_logic; -- botao
		flag_timer     : in std_logic; -- sinal vindo do timer
		load_assembler : out std_logic; -- sinal para indicar load do assembler
		result         : out std_logic
	);

end entity;

architecture rtl of Conversor is

	signal prev_a : std_logic := '0';
	
begin

	process(clock, reset)
	begin
		if reset = '1' then
			prev_a <= '0';
			load_assembler <= '0';
			result <= '0';
		elsif rising_edge(clock) then
		
			load_assembler <= '0';
			
			if prev_a = '1' and a = '0' then-- foi pressionado no ultimo clock	
					load_assembler <= '1';
					result <= flag_timer;
			end if;
			prev_a <= a;
			result <= '0';
		end if;
	end process;
end rtl;
