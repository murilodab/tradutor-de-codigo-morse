-- recebe os milissegundos do timer e output 0 ou 1 baseado na duracao,
-- de acordo com o perfil de velocidade selecionado em 'profile'


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Conversor is

	port
	(
		clock          : in std_logic;
		reset          : in std_logic;
		btn_a          : in std_logic;
		milissegundos  : in integer; -- milissegundos vindos do timer
		profile        : in std_logic_vector(1 downto 0); -- "00"=Iniciante "01"=Avancado outros=Expert
		load_assembler : out std_logic; -- sinal para indicar load do assembler
		output         : out std_logic -- 0 para ponto - 1 para traco
	);

end entity;

architecture rtl of Conversor is

signal load_a : std_logic := '0';
signal btn_prev : std_logic := '0';

begin
load_assembler <= load_a;
	process(clock, reset)
	variable tempo_ponto : integer;
	variable tempo_traco : integer;
	begin
		if rising_edge(clock)then
		load_a <= '0';
			if reset = '1'  then
				output <= '0';
				btn_prev <= '0';
			else
			case profile is
				when "00"   => tempo_ponto := 1000; -- Iniciante
				when "01"   => tempo_ponto := 500;  -- Avancado
				when others => tempo_ponto := 200;  -- Expert
			end case;
			tempo_traco := tempo_ponto * 3;

			if btn_prev = '1' and btn_a = '0' then -- botao foi solto
				if milissegundos <= tempo_traco then
					if milissegundos <= tempo_ponto then
						output <= '0';
					else
						-- ate o momento o sinal eh 1 para qualquer valor maior ou igual traco_ponto. Sera alterado futuramente.
						output <= '1';
					end if;
					load_a <= '1';
				end if;
			end if;
			btn_prev <= btn_a;
			end if;
		end if;
	end process;
end rtl;
