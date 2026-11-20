library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Assembler_pkg.all;

-- Recebe sinais individuais de 1 bit e retorna um vetor de 6 bits composto pelos sinais inseridos

entity Assembler is
    port (
        clock : in  std_logic;
        reset : in  std_logic;
        load_a  : in  std_logic;
		  btn_b  : in std_logic;
        D     : in  std_logic; -- input do conversor
        Q     : out morse_data
    );
end Assembler;

architecture RTL of Assembler is

	signal data_in       : std_logic_vector(5 downto 0) := (others => '0');
	signal load_prev     : std_logic := '0';
   signal btn_prev      : std_logic := '0';
	
begin
    process(clock, reset)
	 variable counter : integer := 0;
    begin
        if (Reset = '1') then
            data_in <= (others => '0');
				counter := 0;
				load_prev <= '0';
				btn_prev <= '0';
        elsif rising_edge(clock) then
            if (load_prev = '0' and load_a = '1') then
               counter := counter + 1;
					 if counter = 6 then
						Q.value <= data_in(4 downto 0) & D;
						Q.length <= 6;
						data_in <= (others => '0');
						counter := 0;
					 else
						data_in <= data_in(4 downto 0) & D;
					 end if;
				elsif btn_prev = '0' and btn_b = '1' then
					if counter > 0 then
						Q.value <= data_in;
						Q.length <= counter;
						data_in <= (others => '0');
						counter := 0;
					end if;
				end if;
			load_prev <= load_a;
			btn_prev <= btn_b;
        end if;
    end process;
end RTL;