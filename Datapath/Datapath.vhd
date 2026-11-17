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
		timer_reset      : in std_logic;
		conversor_reset  : in std_logic;
		assembler_reset  : in std_logic;
		tradutor_enable  : in std_logic;
		btn_a 			  : in std_logic;
		btn_b 			  : in std_logic;
	-- outputs
		disp_char        : out std_logic_vector (6 downto 0);
		btn_b_flag       : out std_logic
		
	);

end entity;

architecture structural of Datapath is

	
	signal sig_res_timer : std_logic;
	signal sig_res_conv : std_logic;
	signal sig_res_assemb : std_logic;
	signal sig_e_trad : std_logic;
	signal sig_btn_b : std_logic;
	
	signal sig_ms_timer : integer;
	signal sig_load_assembler : std_logic;
	signal sig_output_conversor : std_logic;
	signal sig_output_assembler : morse_data;
	signal sig_trad_out : std_logic_vector (5 downto 0);

	begin	
		
	sig_res_timer <= timer_reset;	

	Timer : entity work.Timer

		generic map (
		clock_frequency => clock_frequency
		)

		port map (
		btn_a => btn_a,
		reset => sig_res_timer,
		milissegundos => sig_ms_timer,
		clock => clock
		);
		
		sig_res_conv <= conversor_reset; -- TODO
		
	Conversor : entity work.Conversor
	 
	 port map (
	
	 milissegundos => sig_ms_timer,
	 btn_a => btn_a,
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
	btn_b => btn_b,
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
	
	sig_btn_b <= btn_b;
	btn_b_flag <= sig_btn_b;

end structural;