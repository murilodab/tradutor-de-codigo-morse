-- recebe os milissegundos do timer e output 0 ou 1 baseado na duracao


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Conversor is

generic (
					
					tempo_ponto : integer := 300 -- tempo maximo para o output ser um ponto (0)
	
);

	port 
	(
		clock          : in std_logic;
		reset          : in std_logic;
		btn_a          : in std_logic;
		milissegundos  : in integer; -- milissegundos vindos do timer
		load_assembler : out std_logic; -- sinal para indicar load do assembler
		output         : out std_logic -- 0 para ponto - 1 para traco
	);

end entity;

architecture rtl of Conversor is
	
signal load_a : std_logic := '0';
signal btn_prev : std_logic := '0';

constant tempo_traco : integer := tempo_ponto * 3;

begin
load_assembler <= load_a;
	process(clock, reset)
	begin
		if rising_edge(clock)then
		load_a <= '0';
			if reset = '1'  then
				output <= '0';
				btn_prev <= '0';
			else
			if btn_prev = '1' and btn_a = '0' then -- botao foi solto
				if milissegundos <= tempo_ponto then
					output <= '0';
				else
					-- qualquer toque mais longo que tempo_ponto (incluindo acima de
					-- tempo_traco) vira traco, em vez de ser ignorado
					output <= '1';
				end if;
				load_a <= '1';
			end if;
			btn_prev <= btn_a;
			end if;
		end if;
	end process;
end rtl;
