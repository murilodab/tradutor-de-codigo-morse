library ieee;
use ieee.std_logic_1164.all;

entity Inversor is
    port (
        btn_a  : in  std_logic;
        btn_b  : in  std_logic;
        ibtn_a : out std_logic;
        ibtn_b : out std_logic
    );
end entity;

architecture rtl of Inversor is
begin
    -- Continuously inverts btn_a and btn_b
    ibtn_a <= not btn_a;
    ibtn_b <= not btn_b;
end architecture rtl;