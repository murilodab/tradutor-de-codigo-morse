-- Quartus Prime VHDL Template
-- Four-State Moore State Machine

library ieee;
use ieee.std_logic_1164.all;
use work.Assembler_pkg.all;

entity Datapath is

	generic(
		clock_frequency : integer := 50000000
	);

	port(
	-- inputs
		clock		        : in std_logic;
		reset            : in std_logic; -- reset geral do sistema (usado so pelo Display_LCD/Uart_tx)
		timer_reset      : in std_logic;
		conversor_reset  : in std_logic;
		assembler_reset  : in std_logic;
		tradutor_enable  : in std_logic;
		btn_a 			  : in std_logic;
		btn_b 			  : in std_logic;
	-- outputs
		disp_char        : out std_logic_vector (6 downto 0);
		btn_b_flag       : out std_logic;
		lcd_tx           : out std_logic

	);

end entity;

architecture structural of Datapath is

	
	signal sig_res_timer : std_logic;
	signal sig_res_conv : std_logic;
	signal sig_res_assemb : std_logic;
	signal sig_e_trad : std_logic;
	signal sig_btn_b : std_logic;

	-- Debounce de btn_a/btn_b: so aceita uma transicao depois que o sinal
	-- ficar estavel por DEBOUNCE_CYCLES ciclos de clock seguidos (10 ms),
	-- filtrando as bordas espurias de um toque fisico real no botao.
	constant DEBOUNCE_CYCLES : integer := clock_frequency / 100; -- 10 ms
	signal btn_a_deb : std_logic := '0';
	signal btn_b_deb : std_logic := '0';
	signal cnt_a : integer range 0 to DEBOUNCE_CYCLES := 0;
	signal cnt_b : integer range 0 to DEBOUNCE_CYCLES := 0;

	signal sig_ms_timer : integer;
	signal sig_load_assembler : std_logic;
	signal sig_output_conversor : std_logic;
	signal sig_output_assembler : morse_data;
	signal sig_trad_out : std_logic_vector (5 downto 0);

	begin

	-- Debounce por contador: zera o contador sempre que o sinal bruto muda
	-- de novo antes de completar DEBOUNCE_CYCLES, e so propaga a transicao
	-- para btn_*_deb quando o sinal passa esse tempo todo estavel.
	process(clock)
	begin
		if rising_edge(clock) then
			if btn_a /= btn_a_deb then
				if cnt_a = DEBOUNCE_CYCLES then
					btn_a_deb <= btn_a;
					cnt_a <= 0;
				else
					cnt_a <= cnt_a + 1;
				end if;
			else
				cnt_a <= 0;
			end if;

			if btn_b /= btn_b_deb then
				if cnt_b = DEBOUNCE_CYCLES then
					btn_b_deb <= btn_b;
					cnt_b <= 0;
				else
					cnt_b <= cnt_b + 1;
				end if;
			else
				cnt_b <= 0;
			end if;
		end if;
	end process;

	sig_res_timer <= timer_reset;

	Timer : entity work.Timer

		generic map (
		clock_frequency => clock_frequency
		)

		port map (
		btn_a => btn_a_deb,
		reset => sig_res_timer,
		milissegundos => sig_ms_timer,
		clock => clock
		);

		sig_res_conv <= conversor_reset; -- TODO

	Conversor : entity work.Conversor

	 port map (

	 milissegundos => sig_ms_timer,
	 btn_a => btn_a_deb,
	 reset => sig_res_conv,
	 load_assembler => sig_load_assembler,
	 output => sig_output_conversor,
	 clock => clock
	);

	sig_res_assemb <= assembler_reset;

	Assembler : entity work.Assembler

	port map (

	D => sig_output_conversor,
	load_a => sig_load_assembler,
	btn_b => btn_b_deb,
	Q => sig_output_assembler,
	reset => sig_res_assemb,
	clock => clock
	);
	
	sig_e_trad <= tradutor_enable;
	
	Tradutor : entity work.Tradutor
	
	port map(
	
	enable => sig_e_trad,
	morse_data_in => sig_output_assembler,
	seven_seg_out => sig_trad_out,
	clock => clock
	);
	
	I_BCD_7seg : entity work.BCD_7seg
	port map(

	entrada => sig_trad_out,
	saida => disp_char
	);

	I_Display_LCD : entity work.Display_LCD
	generic map (
		clock_frequency => clock_frequency
	)
	port map (
		clock   => clock,
		reset   => reset,
		enable  => sig_e_trad,
		code_in => sig_trad_out,
		tx      => lcd_tx
	);

	sig_btn_b <= btn_b_deb;
	btn_b_flag <= sig_btn_b;

end structural;