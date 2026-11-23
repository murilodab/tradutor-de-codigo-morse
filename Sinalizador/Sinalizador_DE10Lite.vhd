-- Wrapper de topo pro DE10-Lite: inverte os sinais ativo-baixo dos botoes
-- onboard (KEY0/KEY1, pull-up + Schmitt trigger, pressionado = '0') antes de
-- entrar no Sinalizador, que assume tudo ativo-alto. Ver docs/07-integracao-hardware.md.
--
-- Uso sugerido com so 2 botoes onboard disponiveis:
--   KEY0  -> reset geral
--   KEY1  -> btn_b (fim de simbolo)
--   btn_a_n -> btn_a (toque Morse), botao externo via GPIO ligado do mesmo
--              jeito que o KEY (pull-up pra 3.3V, botao fecha pra GND)
--
-- Se btn_a/btn_b forem ligados a um slide switch (SW) em vez de botao, NAO
-- inverter esse sinal aqui - o switch ja fornece nivel direto pela posicao
-- (ver Table 3.3 do manual do DE10-Lite); nesse caso, ligue o switch direto
-- numa porta do Sinalizador sem passar por este wrapper.

library ieee;
use ieee.std_logic_1164.all;

entity Sinalizador_DE10Lite is

	generic (
		clock_frequency : integer := 50_000_000
	);

	port (
		clock    : in  std_logic;
		KEY0     : in  std_logic; -- reset geral, ativo-baixo (onboard)
		KEY1     : in  std_logic; -- btn_b (fim de simbolo), ativo-baixo (onboard)
		btn_a_n  : in  std_logic; -- btn_a (toque Morse), ativo-baixo (botao externo com pull-up)

		disp_char : out std_logic_vector(6 downto 0);
		lcd_rs    : out std_logic;
		lcd_e     : out std_logic;
		lcd_data  : out std_logic_vector(7 downto 4)
	);

end entity;

architecture rtl of Sinalizador_DE10Lite is
begin

	I_Sinalizador : entity work.Sinalizador

		generic map (
			clock_frequency => clock_frequency
		)

		port map (
			clock     => clock,
			reset     => not KEY0,
			btn_a     => not btn_a_n,
			btn_b     => not KEY1,

			disp_char => disp_char,
			lcd_rs    => lcd_rs,
			lcd_e     => lcd_e,
			lcd_data  => lcd_data
		);

end rtl;
