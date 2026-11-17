library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Assembler_pkg is
    type morse_data is record
        value  : std_logic_vector(5 downto 0); -- The 6-bit assembled vector
        length : integer range 0 to 6;         -- How many bits were entered (1 to 6)
    end record morse_data;
end package Assembler_pkg;