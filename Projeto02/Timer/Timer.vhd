-- Timer para contar a duracao do sinal, output 0 se ponto e 1 se traco

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Timer is

	generic
	(
		clock_frequency : integer	:= 50000000
		);

	port 
	(
		clock		: in std_logic;
		btn_a    : in std_logic;
		reset    : in std_logic;
		milissegundos : out integer
	);

end entity;

architecture rtl of Timer is
	-- 50.000 periodos sao 1 ms em uma frq de 50MHz
	constant periodos_por_ms : integer := clock_frequency / 1000;

	-- fio para contar os periodos
	signal clock_period : integer := 0;
	signal ms_count     : integer := 0;
	-- para checar se o botao foi pressionado
	signal btn_prev     : std_logic := '0';

begin

	milissegundos <= ms_count;

	process (clock)
	begin
		if (rising_edge(clock)) then
		
			if (reset = '1') then
				clock_period <= 0;
				ms_count <= 0;
				btn_prev <= '0';
			else
				-- botao acaba de ser acionado
				if btn_prev = '0' and btn_a = '1' then
					clock_period <= 0;
					ms_count     <= 0;
				-- botao continua acionado	
				elsif btn_a = '1' then
					if clock_period = periodos_por_ms - 1 then
						clock_period <= 0;
						ms_count <= ms_count + 1;
					else
						clock_period <= clock_period + 1;
					end if;
				end if;
				btn_prev <= btn_a;
			end if;
		end if;
	end process;
	
end rtl;
