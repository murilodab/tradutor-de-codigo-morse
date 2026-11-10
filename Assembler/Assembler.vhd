library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Recebe sinais individuais de 1 bit e retorna um vetor de 6 bits composto pelos sinais inseridos

entity Assembler is
    port (
        clock : in  std_logic;
        Reset : in  std_logic;
        Load  : in  std_logic;
        D     : in  std_logic;
        Q     : out std_logic_vector(5 downto 0)
    );
end Assembler;

architecture RTL of Assembler is
	signal data_in       : std_logic_vector(5 downto 0) := (others => '0');
begin
    process(clock, Reset)
    begin
        if (Reset = '1') then
            data_in <= (others => '0');
        elsif rising_edge(clock) then
            if (Load = '1') then
                data_in <= data_in(4 downto 0) & D;
            end if;
        end if;
    end process;
	 
	 Q <= data_in;
	 
end RTL;