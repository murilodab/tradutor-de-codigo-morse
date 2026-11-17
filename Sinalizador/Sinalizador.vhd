library ieee;
use ieee.std_logic_1164.all;

entity Sinalizador is

generic (
        clock_frequency : integer := 50000000
    );
	

	port(
	-- inputs
		clock		  : in std_logic;
		reset      : in std_logic;
		btn_a      : in std_logic;
		btn_b      : in std_logic;
		sw_profile : in std_logic_vector(2 downto 0); -- bit0=Iniciante bit1=Avancado bit2=Expert
	-- outputs
		disp_char   : out std_logic_vector (6 downto 0);
		led_profile : out std_logic_vector(2 downto 0) -- aceso = perfil ativo (mesma ordem de bits de sw_profile)

	);

end entity;

architecture structural of Sinalizador is

   signal sig_res_timer : std_logic;
	signal sig_res_conv: std_logic;
   signal sig_res_assemb : std_logic;
	signal sig_e_trad : std_logic;
	signal sig_btn_b : std_logic;

	signal profile : std_logic_vector(1 downto 0); -- codigo interno usado pelo Datapath/Conversor

	begin

	-- Converte os 3 switches (um por perfil) no codigo de 2 bits usado internamente.
	-- Prioridade se mais de um switch estiver ligado ao mesmo tempo: Expert > Avancado > Iniciante.
	-- Nenhum switch ligado tambem cai em Iniciante (perfil mais tolerante).
	process(sw_profile)
	begin
		if sw_profile(2) = '1' then
			profile <= "10"; -- Expert
		elsif sw_profile(1) = '1' then
			profile <= "01"; -- Avancado
		else
			profile <= "00"; -- Iniciante
		end if;
	end process;

	led_profile <= "100" when profile = "10" else -- Expert
	               "010" when profile = "01" else -- Avancado
	               "001";                         -- Iniciante

	
	

	I_Datapath : entity work.Datapath
	
	generic map (
            clock_frequency => clock_frequency
        )	

		port map (
		btn_a => btn_a,
		btn_b => btn_b,
		profile => profile,
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