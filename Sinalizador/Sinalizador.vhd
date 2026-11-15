library ieee;
use ieee.std_logic_1164.all;

entity Sinalizador is

	port(
	-- inputs
		clock		: in std_logic;
		reset    : in std_logic;
		btn_a    : in std_logic;
		btn_b    : in std_logic;
	-- outputs
		disp_char     : out std_logic_vector (6 downto 0)
		
	);

end entity;

architecture structural of Sinalizador is

   signal sig_res_timer : std_logic;
	signal sig_res_conv: std_logic;
   signal sig_res_assemb : std_logic;
	signal sig_e_trad : std_logic;
	signal sig_btn_b : std_logic;
	
	
	begin
	
	

	I_Datapath : entity work.Datapath

		port map (
		btn_a => btn_a,
		btn_b => btn_b,
		clock => clock,
		
		timer_reset => sig_res_timer,
		conversor_reset => sig_res_conv,
		assembler_reset => sig_res_assemb,
		tradutor_enable => sig_e_trad,
		
		btn_b_flag => sig_btn_b,
		disp_char => disp_char
		
		
		);
		
	I_Controladora : entity work.Projeto_v10

	 port map (
	
	 clock => clock,
	 reset => reset,
	 btn_b_flag => sig_btn_b,
	 
	 timer_reset => sig_res_timer,
	 conversor_reset => sig_res_conv,
	 assembler_reset => sig_res_assemb,
	 tradutor_enable => sig_e_trad
	);

end structural;