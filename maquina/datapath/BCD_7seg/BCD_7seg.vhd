LIBRARY IEEE;
use ieee.std_logic_1164.all;


-- Testado e fornecido com pinagem para Kit Terasic Altera DE2:
Entity Bcd_7seg is
   port (
		entrada: in std_logic_vector (5 downto 0);
		saida:	out std_logic_vector (6 downto 0)
	);
end Bcd_7seg;

architecture with_select_bcd7seg of Bcd_7seg is
begin
  with entrada select
  saida <=  "1111110" when "000000", --0
	    "0110000" when "000001", --1
	    "1101101" when "000010", --2
	    "1111001" when "000011", --3
	    "0110011" when "000100", --4
	    "1011011" when "000101", --5
	    "1011111" when "000110", --6
	    "1110000" when "000111", --7
	    "1111111" when "001000", --8
	    "1111011" when "001001", --9
	    "1110111" when "001010", --A
	    "0011111" when "001011", --b
	    "1001110" when "001100", --C
	    "0111101" when "001101", --d
	    "1001111" when "001110", --E
	    "1000111" when "001111", --f
		 -- Letras G a Z (Mapeadas a partir de 16 em decimal = "010000")
       "1011110" when "010000", -- G (maiúsculo)
       "0110111" when "010001", -- H (maiúsculo)
       "0000110" when "010010", -- I (usando segmentos e, f à esquerda)
       "0111100" when "010011", -- J (maiúsculo)
       "1010111" when "010100", -- K (aproximação, similar ao H com barra no topo)
       "0001110" when "010101", -- L (maiúsculo)
       "0010101" when "010110", -- M (impossível num 7-seg, aproxima-se usando 'n' minúsculo)
       "0010101" when "010111", -- n (minúsculo, c, e, g)
       "0011101" when "011000", -- o (minúsculo, c, d, e, g - para diferenciar do zero)
       "1100111" when "011001", -- P (maiúsculo)
       "1110011" when "011010", -- q (minúsculo, similar ao 9)
       "0000101" when "011011", -- r (minúsculo, e, g)
       "1011011" when "011100", -- S (igual ao 5)
       "0001111" when "011101", -- t (minúsculo, d, e, f, g)
       "0111110" when "011110", -- U (maiúsculo)
       "0011100" when "011111", -- v (minúsculo, formato em 'u' pequeno)
       "0101010" when "100000", -- W (impossível, aproximação com segmentos desconexos)
       "0110111" when "100001", -- X (impossível, costuma-se repetir o 'H')
       "0111011" when "100010", -- y (minúsculo)
       "1101101" when "100011", -- Z (igual ao 2)
       "0000000" when others;   -- Apaga tudo para qualquer outra combinação
				
end with_select_bcd7seg;
				
				
		