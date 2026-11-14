-- Copyright (C) 2025  Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Altera and sold by Altera or its authorized distributors.  Please
-- refer to the Altera Software License Subscription Agreements 
-- on the Quartus Prime software download page.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 25.1std.0 Build 1129 10/21/2025 SC Lite Edition"

-- DATE "11/14/2026 13:22:47"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Altera FPGA (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Assembler IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	load_a : IN std_logic;
	btn_b : IN std_logic;
	D : IN std_logic;
	\Q.length\ : BUFFER std_logic_vector(2 DOWNTO 0);
	\Q.value\ : BUFFER std_logic_vector(5 DOWNTO 0)
	);
END Assembler;

-- Design Ports Information
-- Q.length[0]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q.length[1]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q.length[2]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q.value[0]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q.value[1]	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q.value[2]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q.value[3]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q.value[4]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q.value[5]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- load_a	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- btn_b	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Assembler IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_load_a : std_logic;
SIGNAL ww_btn_b : std_logic;
SIGNAL ww_D : std_logic;
SIGNAL \ww_Q.length\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \ww_Q.value\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \Q.length[0]~output_o\ : std_logic;
SIGNAL \Q.length[1]~output_o\ : std_logic;
SIGNAL \Q.length[2]~output_o\ : std_logic;
SIGNAL \Q.value[0]~output_o\ : std_logic;
SIGNAL \Q.value[1]~output_o\ : std_logic;
SIGNAL \Q.value[2]~output_o\ : std_logic;
SIGNAL \Q.value[3]~output_o\ : std_logic;
SIGNAL \Q.value[4]~output_o\ : std_logic;
SIGNAL \Q.value[5]~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \load_a~input_o\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \load_prev~feeder_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \load_prev~q\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \counter~17_combout\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \btn_b~input_o\ : std_logic;
SIGNAL \btn_prev~q\ : std_logic;
SIGNAL \counter[5]~1_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \counter~4_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \counter~3_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \counter~2_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \counter~6_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \counter~7_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \counter~8_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \counter~9_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \counter~10_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \counter~11_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \counter~12_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \counter~13_combout\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \counter~14_combout\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \counter~15_combout\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \counter~16_combout\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \counter~30_combout\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \counter~29_combout\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \counter~28_combout\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~38_combout\ : std_logic;
SIGNAL \counter~27_combout\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~40_combout\ : std_logic;
SIGNAL \counter~26_combout\ : std_logic;
SIGNAL \Add0~41\ : std_logic;
SIGNAL \Add0~42_combout\ : std_logic;
SIGNAL \counter~25_combout\ : std_logic;
SIGNAL \Add0~43\ : std_logic;
SIGNAL \Add0~44_combout\ : std_logic;
SIGNAL \counter~24_combout\ : std_logic;
SIGNAL \Add0~45\ : std_logic;
SIGNAL \Add0~46_combout\ : std_logic;
SIGNAL \counter~23_combout\ : std_logic;
SIGNAL \Add0~47\ : std_logic;
SIGNAL \Add0~48_combout\ : std_logic;
SIGNAL \counter~22_combout\ : std_logic;
SIGNAL \Add0~49\ : std_logic;
SIGNAL \Add0~50_combout\ : std_logic;
SIGNAL \counter~21_combout\ : std_logic;
SIGNAL \Add0~51\ : std_logic;
SIGNAL \Add0~52_combout\ : std_logic;
SIGNAL \counter~20_combout\ : std_logic;
SIGNAL \Add0~53\ : std_logic;
SIGNAL \Add0~54_combout\ : std_logic;
SIGNAL \counter~19_combout\ : std_logic;
SIGNAL \Add0~55\ : std_logic;
SIGNAL \Add0~56_combout\ : std_logic;
SIGNAL \counter~18_combout\ : std_logic;
SIGNAL \Add0~57\ : std_logic;
SIGNAL \Add0~58_combout\ : std_logic;
SIGNAL \counter~31_combout\ : std_logic;
SIGNAL \Add0~59\ : std_logic;
SIGNAL \Add0~60_combout\ : std_logic;
SIGNAL \counter~32_combout\ : std_logic;
SIGNAL \Add0~61\ : std_logic;
SIGNAL \Add0~62_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \Equal0~8_combout\ : std_logic;
SIGNAL \Equal0~9_combout\ : std_logic;
SIGNAL \counter~5_combout\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \counter~0_combout\ : std_logic;
SIGNAL \Q~0_combout\ : std_logic;
SIGNAL \Q.length[0]~0_combout\ : std_logic;
SIGNAL \Q.length[0]~1_combout\ : std_logic;
SIGNAL \Q.length[0]~reg0_q\ : std_logic;
SIGNAL \Q~1_combout\ : std_logic;
SIGNAL \Q.length[1]~reg0_q\ : std_logic;
SIGNAL \Q~2_combout\ : std_logic;
SIGNAL \Q.length[2]~reg0_q\ : std_logic;
SIGNAL \D~input_o\ : std_logic;
SIGNAL \data_in~0_combout\ : std_logic;
SIGNAL \Q~3_combout\ : std_logic;
SIGNAL \Q.value[0]~reg0_q\ : std_logic;
SIGNAL \data_in~1_combout\ : std_logic;
SIGNAL \Q~4_combout\ : std_logic;
SIGNAL \Q.value[1]~reg0_q\ : std_logic;
SIGNAL \data_in~2_combout\ : std_logic;
SIGNAL \Q~5_combout\ : std_logic;
SIGNAL \Q.value[2]~reg0_q\ : std_logic;
SIGNAL \data_in~3_combout\ : std_logic;
SIGNAL \Q~6_combout\ : std_logic;
SIGNAL \Q.value[3]~reg0_q\ : std_logic;
SIGNAL \data_in~4_combout\ : std_logic;
SIGNAL \Q~7_combout\ : std_logic;
SIGNAL \Q.value[4]~reg0_q\ : std_logic;
SIGNAL \data_in~5_combout\ : std_logic;
SIGNAL \Q~8_combout\ : std_logic;
SIGNAL \Q.value[5]~reg0_q\ : std_logic;
SIGNAL data_in : std_logic_vector(5 DOWNTO 0);
SIGNAL counter : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_load_a <= load_a;
ww_btn_b <= btn_b;
ww_D <= D;
\Q.length\ <= \ww_Q.length\;
\Q.value\ <= \ww_Q.value\;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y41_N24
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X60_Y54_N30
\Q.length[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q.length[0]~reg0_q\,
	devoe => ww_devoe,
	o => \Q.length[0]~output_o\);

-- Location: IOOBUF_X58_Y54_N2
\Q.length[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q.length[1]~reg0_q\,
	devoe => ww_devoe,
	o => \Q.length[1]~output_o\);

-- Location: IOOBUF_X58_Y54_N23
\Q.length[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q.length[2]~reg0_q\,
	devoe => ww_devoe,
	o => \Q.length[2]~output_o\);

-- Location: IOOBUF_X60_Y54_N23
\Q.value[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q.value[0]~reg0_q\,
	devoe => ww_devoe,
	o => \Q.value[0]~output_o\);

-- Location: IOOBUF_X58_Y54_N9
\Q.value[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q.value[1]~reg0_q\,
	devoe => ww_devoe,
	o => \Q.value[1]~output_o\);

-- Location: IOOBUF_X58_Y54_N30
\Q.value[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q.value[2]~reg0_q\,
	devoe => ww_devoe,
	o => \Q.value[2]~output_o\);

-- Location: IOOBUF_X62_Y54_N30
\Q.value[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q.value[3]~reg0_q\,
	devoe => ww_devoe,
	o => \Q.value[3]~output_o\);

-- Location: IOOBUF_X78_Y41_N9
\Q.value[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q.value[4]~reg0_q\,
	devoe => ww_devoe,
	o => \Q.value[4]~output_o\);

-- Location: IOOBUF_X58_Y54_N16
\Q.value[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q.value[5]~reg0_q\,
	devoe => ww_devoe,
	o => \Q.value[5]~output_o\);

-- Location: IOIBUF_X0_Y18_N15
\clock~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G3
\clock~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X60_Y54_N1
\load_a~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_load_a,
	o => \load_a~input_o\);

-- Location: LCCOMB_X58_Y42_N0
\Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = counter(0) $ (VCC)
-- \Add0~1\ = CARRY(counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X59_Y42_N22
\load_prev~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \load_prev~feeder_combout\ = \load_a~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \load_a~input_o\,
	combout => \load_prev~feeder_combout\);

-- Location: IOIBUF_X0_Y18_N22
\reset~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X59_Y42_N23
load_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \load_prev~feeder_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \load_prev~q\);

-- Location: LCCOMB_X59_Y42_N18
\process_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (!\load_prev~q\ & \load_a~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \load_prev~q\,
	datad => \load_a~input_o\,
	combout => \process_0~0_combout\);

-- Location: LCCOMB_X58_Y43_N26
\counter~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~17_combout\ = (\process_0~0_combout\ & (\Add0~58_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \Add0~58_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~17_combout\);

-- Location: CLKCTRL_G4
\reset~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: IOIBUF_X60_Y54_N15
\btn_b~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_btn_b,
	o => \btn_b~input_o\);

-- Location: FF_X59_Y42_N1
btn_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \btn_b~input_o\,
	sload => VCC,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \btn_prev~q\);

-- Location: LCCOMB_X59_Y42_N26
\counter[5]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[5]~1_combout\ = (\load_prev~q\ & (!\btn_prev~q\ & (\btn_b~input_o\))) # (!\load_prev~q\ & ((\load_a~input_o\) # ((!\btn_prev~q\ & \btn_b~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \load_prev~q\,
	datab => \btn_prev~q\,
	datac => \btn_b~input_o\,
	datad => \load_a~input_o\,
	combout => \counter[5]~1_combout\);

-- Location: FF_X58_Y43_N27
\counter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~17_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(29));

-- Location: LCCOMB_X58_Y42_N2
\Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (counter(1) & (!\Add0~1\)) # (!counter(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X59_Y42_N24
\counter~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~4_combout\ = (\Add0~2_combout\ & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~2_combout\,
	datab => \Equal0~4_combout\,
	datac => \process_0~0_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~4_combout\);

-- Location: FF_X59_Y42_N25
\counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~4_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(1));

-- Location: LCCOMB_X58_Y42_N4
\Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (counter(2) & (\Add0~3\ $ (GND))) # (!counter(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((counter(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X59_Y42_N30
\counter~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~3_combout\ = (\process_0~0_combout\ & (\Add0~4_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \Add0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~3_combout\);

-- Location: FF_X59_Y42_N31
\counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(2));

-- Location: LCCOMB_X58_Y42_N6
\Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (counter(3) & (!\Add0~5\)) # (!counter(3) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X59_Y42_N4
\counter~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~2_combout\ = (\process_0~0_combout\ & (\Add0~6_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \Add0~6_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~2_combout\);

-- Location: FF_X59_Y42_N5
\counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(3));

-- Location: LCCOMB_X58_Y42_N8
\Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (counter(4) & (\Add0~7\ $ (GND))) # (!counter(4) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((counter(4) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X58_Y42_N10
\Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (counter(5) & (!\Add0~9\)) # (!counter(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X58_Y43_N30
\counter~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~6_combout\ = (\Add0~10_combout\ & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~10_combout\,
	datab => \Equal0~4_combout\,
	datac => \process_0~0_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~6_combout\);

-- Location: FF_X58_Y43_N31
\counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~6_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(5));

-- Location: LCCOMB_X58_Y42_N12
\Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (counter(6) & (\Add0~11\ $ (GND))) # (!counter(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((counter(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X58_Y43_N20
\counter~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~7_combout\ = (\process_0~0_combout\ & (\Add0~12_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \Add0~12_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~7_combout\);

-- Location: FF_X58_Y43_N21
\counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~7_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(6));

-- Location: LCCOMB_X58_Y42_N14
\Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (counter(7) & (!\Add0~13\)) # (!counter(7) & ((\Add0~13\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~13\) # (!counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCCOMB_X58_Y43_N6
\counter~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~8_combout\ = (\process_0~0_combout\ & (\Add0~14_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \Add0~14_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~8_combout\);

-- Location: FF_X58_Y43_N7
\counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~8_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(7));

-- Location: LCCOMB_X58_Y42_N16
\Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (counter(8) & (\Add0~15\ $ (GND))) # (!counter(8) & (!\Add0~15\ & VCC))
-- \Add0~17\ = CARRY((counter(8) & !\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(8),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCCOMB_X58_Y43_N10
\counter~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~9_combout\ = (\process_0~0_combout\ & (\Add0~16_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Add0~16_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~9_combout\);

-- Location: FF_X58_Y43_N11
\counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~9_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(8));

-- Location: LCCOMB_X58_Y42_N18
\Add0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (counter(9) & (!\Add0~17\)) # (!counter(9) & ((\Add0~17\) # (GND)))
-- \Add0~19\ = CARRY((!\Add0~17\) # (!counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(9),
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X59_Y42_N8
\counter~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~10_combout\ = (\process_0~0_combout\ & (\Add0~18_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \Add0~18_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~10_combout\);

-- Location: FF_X59_Y42_N9
\counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~10_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(9));

-- Location: LCCOMB_X58_Y42_N20
\Add0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (counter(10) & (\Add0~19\ $ (GND))) # (!counter(10) & (!\Add0~19\ & VCC))
-- \Add0~21\ = CARRY((counter(10) & !\Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(10),
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: LCCOMB_X59_Y42_N14
\counter~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~11_combout\ = (\Add0~20_combout\ & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~20_combout\,
	datab => \Equal0~4_combout\,
	datac => \process_0~0_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~11_combout\);

-- Location: FF_X59_Y42_N15
\counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~11_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(10));

-- Location: LCCOMB_X58_Y42_N22
\Add0~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (counter(11) & (!\Add0~21\)) # (!counter(11) & ((\Add0~21\) # (GND)))
-- \Add0~23\ = CARRY((!\Add0~21\) # (!counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(11),
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: LCCOMB_X59_Y42_N16
\counter~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~12_combout\ = (\process_0~0_combout\ & (\Add0~22_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \Add0~22_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~12_combout\);

-- Location: FF_X59_Y42_N17
\counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~12_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(11));

-- Location: LCCOMB_X58_Y42_N24
\Add0~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = (counter(12) & (\Add0~23\ $ (GND))) # (!counter(12) & (!\Add0~23\ & VCC))
-- \Add0~25\ = CARRY((counter(12) & !\Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(12),
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: LCCOMB_X59_Y42_N2
\counter~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~13_combout\ = (\process_0~0_combout\ & (\Add0~24_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \Add0~24_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~13_combout\);

-- Location: FF_X59_Y42_N3
\counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~13_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(12));

-- Location: LCCOMB_X58_Y42_N26
\Add0~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (counter(13) & (!\Add0~25\)) # (!counter(13) & ((\Add0~25\) # (GND)))
-- \Add0~27\ = CARRY((!\Add0~25\) # (!counter(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(13),
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

-- Location: LCCOMB_X59_Y42_N12
\counter~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~14_combout\ = (\Add0~26_combout\ & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~26_combout\,
	datab => \Equal0~4_combout\,
	datac => \process_0~0_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~14_combout\);

-- Location: FF_X59_Y42_N13
\counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~14_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(13));

-- Location: LCCOMB_X58_Y42_N28
\Add0~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = (counter(14) & (\Add0~27\ $ (GND))) # (!counter(14) & (!\Add0~27\ & VCC))
-- \Add0~29\ = CARRY((counter(14) & !\Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(14),
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

-- Location: LCCOMB_X59_Y42_N10
\counter~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~15_combout\ = (\Add0~28_combout\ & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~28_combout\,
	datab => \Equal0~4_combout\,
	datac => \process_0~0_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~15_combout\);

-- Location: FF_X59_Y42_N11
\counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~15_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(14));

-- Location: LCCOMB_X58_Y42_N30
\Add0~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = (counter(15) & (!\Add0~29\)) # (!counter(15) & ((\Add0~29\) # (GND)))
-- \Add0~31\ = CARRY((!\Add0~29\) # (!counter(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(15),
	datad => VCC,
	cin => \Add0~29\,
	combout => \Add0~30_combout\,
	cout => \Add0~31\);

-- Location: LCCOMB_X59_Y42_N28
\counter~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~16_combout\ = (\process_0~0_combout\ & (\Add0~30_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \Add0~30_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~16_combout\);

-- Location: FF_X59_Y42_N29
\counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~16_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(15));

-- Location: LCCOMB_X58_Y41_N0
\Add0~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = (counter(16) & (\Add0~31\ $ (GND))) # (!counter(16) & (!\Add0~31\ & VCC))
-- \Add0~33\ = CARRY((counter(16) & !\Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(16),
	datad => VCC,
	cin => \Add0~31\,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

-- Location: LCCOMB_X58_Y43_N14
\counter~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~30_combout\ = (\process_0~0_combout\ & (\Add0~32_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \Add0~32_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~30_combout\);

-- Location: FF_X58_Y43_N15
\counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~30_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(16));

-- Location: LCCOMB_X58_Y41_N2
\Add0~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = (counter(17) & (!\Add0~33\)) # (!counter(17) & ((\Add0~33\) # (GND)))
-- \Add0~35\ = CARRY((!\Add0~33\) # (!counter(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(17),
	datad => VCC,
	cin => \Add0~33\,
	combout => \Add0~34_combout\,
	cout => \Add0~35\);

-- Location: LCCOMB_X57_Y41_N12
\counter~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~29_combout\ = (\Add0~34_combout\ & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~34_combout\,
	datab => \process_0~0_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~29_combout\);

-- Location: FF_X57_Y41_N13
\counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~29_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(17));

-- Location: LCCOMB_X58_Y41_N4
\Add0~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~36_combout\ = (counter(18) & (\Add0~35\ $ (GND))) # (!counter(18) & (!\Add0~35\ & VCC))
-- \Add0~37\ = CARRY((counter(18) & !\Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(18),
	datad => VCC,
	cin => \Add0~35\,
	combout => \Add0~36_combout\,
	cout => \Add0~37\);

-- Location: LCCOMB_X57_Y41_N10
\counter~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~28_combout\ = (\Add0~36_combout\ & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~36_combout\,
	datab => \process_0~0_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~28_combout\);

-- Location: FF_X57_Y41_N11
\counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~28_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(18));

-- Location: LCCOMB_X58_Y41_N6
\Add0~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~38_combout\ = (counter(19) & (!\Add0~37\)) # (!counter(19) & ((\Add0~37\) # (GND)))
-- \Add0~39\ = CARRY((!\Add0~37\) # (!counter(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(19),
	datad => VCC,
	cin => \Add0~37\,
	combout => \Add0~38_combout\,
	cout => \Add0~39\);

-- Location: LCCOMB_X57_Y41_N8
\counter~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~27_combout\ = (\Add0~38_combout\ & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~38_combout\,
	datab => \process_0~0_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~27_combout\);

-- Location: FF_X57_Y41_N9
\counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~27_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(19));

-- Location: LCCOMB_X58_Y41_N8
\Add0~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~40_combout\ = (counter(20) & (\Add0~39\ $ (GND))) # (!counter(20) & (!\Add0~39\ & VCC))
-- \Add0~41\ = CARRY((counter(20) & !\Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(20),
	datad => VCC,
	cin => \Add0~39\,
	combout => \Add0~40_combout\,
	cout => \Add0~41\);

-- Location: LCCOMB_X57_Y41_N18
\counter~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~26_combout\ = (\process_0~0_combout\ & (\Add0~40_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~4_combout\,
	datab => \process_0~0_combout\,
	datac => \Add0~40_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~26_combout\);

-- Location: FF_X57_Y41_N19
\counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~26_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(20));

-- Location: LCCOMB_X58_Y41_N10
\Add0~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~42_combout\ = (counter(21) & (!\Add0~41\)) # (!counter(21) & ((\Add0~41\) # (GND)))
-- \Add0~43\ = CARRY((!\Add0~41\) # (!counter(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(21),
	datad => VCC,
	cin => \Add0~41\,
	combout => \Add0~42_combout\,
	cout => \Add0~43\);

-- Location: LCCOMB_X58_Y43_N24
\counter~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~25_combout\ = (\process_0~0_combout\ & (\Add0~42_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \Add0~42_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~25_combout\);

-- Location: FF_X58_Y43_N25
\counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~25_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(21));

-- Location: LCCOMB_X58_Y41_N12
\Add0~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~44_combout\ = (counter(22) & (\Add0~43\ $ (GND))) # (!counter(22) & (!\Add0~43\ & VCC))
-- \Add0~45\ = CARRY((counter(22) & !\Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(22),
	datad => VCC,
	cin => \Add0~43\,
	combout => \Add0~44_combout\,
	cout => \Add0~45\);

-- Location: LCCOMB_X58_Y43_N18
\counter~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~24_combout\ = (\process_0~0_combout\ & (\Add0~44_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \Add0~44_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~24_combout\);

-- Location: FF_X58_Y43_N19
\counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~24_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(22));

-- Location: LCCOMB_X58_Y41_N14
\Add0~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~46_combout\ = (counter(23) & (!\Add0~45\)) # (!counter(23) & ((\Add0~45\) # (GND)))
-- \Add0~47\ = CARRY((!\Add0~45\) # (!counter(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(23),
	datad => VCC,
	cin => \Add0~45\,
	combout => \Add0~46_combout\,
	cout => \Add0~47\);

-- Location: LCCOMB_X57_Y41_N20
\counter~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~23_combout\ = (\process_0~0_combout\ & (\Add0~46_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~4_combout\,
	datab => \process_0~0_combout\,
	datac => \Add0~46_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~23_combout\);

-- Location: FF_X57_Y41_N21
\counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~23_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(23));

-- Location: LCCOMB_X58_Y41_N16
\Add0~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~48_combout\ = (counter(24) & (\Add0~47\ $ (GND))) # (!counter(24) & (!\Add0~47\ & VCC))
-- \Add0~49\ = CARRY((counter(24) & !\Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(24),
	datad => VCC,
	cin => \Add0~47\,
	combout => \Add0~48_combout\,
	cout => \Add0~49\);

-- Location: LCCOMB_X58_Y43_N8
\counter~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~22_combout\ = (\process_0~0_combout\ & (\Add0~48_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \Add0~48_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~22_combout\);

-- Location: FF_X58_Y43_N9
\counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~22_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(24));

-- Location: LCCOMB_X58_Y41_N18
\Add0~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~50_combout\ = (counter(25) & (!\Add0~49\)) # (!counter(25) & ((\Add0~49\) # (GND)))
-- \Add0~51\ = CARRY((!\Add0~49\) # (!counter(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(25),
	datad => VCC,
	cin => \Add0~49\,
	combout => \Add0~50_combout\,
	cout => \Add0~51\);

-- Location: LCCOMB_X58_Y43_N22
\counter~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~21_combout\ = (\process_0~0_combout\ & (\Add0~50_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Add0~50_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~21_combout\);

-- Location: FF_X58_Y43_N23
\counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~21_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(25));

-- Location: LCCOMB_X58_Y41_N20
\Add0~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~52_combout\ = (counter(26) & (\Add0~51\ $ (GND))) # (!counter(26) & (!\Add0~51\ & VCC))
-- \Add0~53\ = CARRY((counter(26) & !\Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(26),
	datad => VCC,
	cin => \Add0~51\,
	combout => \Add0~52_combout\,
	cout => \Add0~53\);

-- Location: LCCOMB_X58_Y43_N28
\counter~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~20_combout\ = (\process_0~0_combout\ & (\Add0~52_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \Add0~52_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~20_combout\);

-- Location: FF_X58_Y43_N29
\counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~20_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(26));

-- Location: LCCOMB_X58_Y41_N22
\Add0~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~54_combout\ = (counter(27) & (!\Add0~53\)) # (!counter(27) & ((\Add0~53\) # (GND)))
-- \Add0~55\ = CARRY((!\Add0~53\) # (!counter(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(27),
	datad => VCC,
	cin => \Add0~53\,
	combout => \Add0~54_combout\,
	cout => \Add0~55\);

-- Location: LCCOMB_X57_Y41_N26
\counter~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~19_combout\ = (\Add0~54_combout\ & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~54_combout\,
	datab => \process_0~0_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~19_combout\);

-- Location: FF_X57_Y41_N27
\counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~19_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(27));

-- Location: LCCOMB_X58_Y41_N24
\Add0~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~56_combout\ = (counter(28) & (\Add0~55\ $ (GND))) # (!counter(28) & (!\Add0~55\ & VCC))
-- \Add0~57\ = CARRY((counter(28) & !\Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(28),
	datad => VCC,
	cin => \Add0~55\,
	combout => \Add0~56_combout\,
	cout => \Add0~57\);

-- Location: LCCOMB_X57_Y41_N4
\counter~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~18_combout\ = (\Add0~56_combout\ & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~4_combout\,
	datab => \Add0~56_combout\,
	datac => \process_0~0_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~18_combout\);

-- Location: FF_X57_Y41_N5
\counter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~18_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(28));

-- Location: LCCOMB_X58_Y41_N26
\Add0~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~58_combout\ = (counter(29) & (!\Add0~57\)) # (!counter(29) & ((\Add0~57\) # (GND)))
-- \Add0~59\ = CARRY((!\Add0~57\) # (!counter(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(29),
	datad => VCC,
	cin => \Add0~57\,
	combout => \Add0~58_combout\,
	cout => \Add0~59\);

-- Location: LCCOMB_X59_Y41_N26
\counter~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~31_combout\ = (\process_0~0_combout\ & (\Add0~60_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Add0~60_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~31_combout\);

-- Location: FF_X59_Y41_N27
\counter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~31_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(30));

-- Location: LCCOMB_X58_Y41_N28
\Add0~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~60_combout\ = (counter(30) & (\Add0~59\ $ (GND))) # (!counter(30) & (!\Add0~59\ & VCC))
-- \Add0~61\ = CARRY((counter(30) & !\Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(30),
	datad => VCC,
	cin => \Add0~59\,
	combout => \Add0~60_combout\,
	cout => \Add0~61\);

-- Location: LCCOMB_X57_Y41_N14
\counter~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~32_combout\ = (\Add0~62_combout\ & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~62_combout\,
	datab => \process_0~0_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~32_combout\);

-- Location: FF_X57_Y41_N15
\counter[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~32_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(31));

-- Location: LCCOMB_X58_Y41_N30
\Add0~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~62_combout\ = \Add0~61\ $ (counter(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => counter(31),
	cin => \Add0~61\,
	combout => \Add0~62_combout\);

-- Location: LCCOMB_X59_Y41_N4
\Equal0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (\Add0~32_combout\) # ((\Add0~38_combout\) # ((\Add0~36_combout\) # (\Add0~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~32_combout\,
	datab => \Add0~38_combout\,
	datac => \Add0~36_combout\,
	datad => \Add0~34_combout\,
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X59_Y41_N6
\Equal0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (\Add0~42_combout\) # ((\Add0~40_combout\) # ((\Add0~46_combout\) # (\Add0~44_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~42_combout\,
	datab => \Add0~40_combout\,
	datac => \Add0~46_combout\,
	datad => \Add0~44_combout\,
	combout => \Equal0~6_combout\);

-- Location: LCCOMB_X59_Y41_N12
\Equal0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = (\Add0~48_combout\) # ((\Add0~50_combout\) # ((\Equal0~5_combout\) # (\Equal0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~48_combout\,
	datab => \Add0~50_combout\,
	datac => \Equal0~5_combout\,
	datad => \Equal0~6_combout\,
	combout => \Equal0~7_combout\);

-- Location: LCCOMB_X59_Y41_N18
\Equal0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~8_combout\ = (\Add0~54_combout\) # ((\Add0~56_combout\) # ((\Add0~52_combout\) # (\Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~54_combout\,
	datab => \Add0~56_combout\,
	datac => \Add0~52_combout\,
	datad => \Equal0~7_combout\,
	combout => \Equal0~8_combout\);

-- Location: LCCOMB_X59_Y41_N0
\Equal0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~9_combout\ = (\Add0~58_combout\) # ((\Add0~60_combout\) # ((\Add0~62_combout\) # (\Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~58_combout\,
	datab => \Add0~60_combout\,
	datac => \Add0~62_combout\,
	datad => \Equal0~8_combout\,
	combout => \Equal0~9_combout\);

-- Location: LCCOMB_X58_Y43_N16
\counter~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~5_combout\ = (\Add0~8_combout\ & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~8_combout\,
	datab => \Equal0~4_combout\,
	datac => \process_0~0_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~5_combout\);

-- Location: FF_X58_Y43_N17
\counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~5_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(4));

-- Location: LCCOMB_X58_Y43_N12
\Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (\Add0~8_combout\) # ((\Add0~14_combout\) # ((\Add0~12_combout\) # (\Add0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~8_combout\,
	datab => \Add0~14_combout\,
	datac => \Add0~12_combout\,
	datad => \Add0~10_combout\,
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X59_Y42_N6
\Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\Add0~0_combout\) # (((\Add0~6_combout\) # (!\Add0~2_combout\)) # (!\Add0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Add0~4_combout\,
	datac => \Add0~6_combout\,
	datad => \Add0~2_combout\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X58_Y43_N4
\Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (\Add0~18_combout\) # ((\Add0~22_combout\) # ((\Add0~20_combout\) # (\Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~18_combout\,
	datab => \Add0~22_combout\,
	datac => \Add0~20_combout\,
	datad => \Add0~16_combout\,
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X58_Y43_N2
\Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (\Add0~24_combout\) # ((\Add0~26_combout\) # ((\Add0~30_combout\) # (\Add0~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~24_combout\,
	datab => \Add0~26_combout\,
	datac => \Add0~30_combout\,
	datad => \Add0~28_combout\,
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X58_Y43_N0
\Equal0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~1_combout\) # ((\Equal0~0_combout\) # ((\Equal0~2_combout\) # (\Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~2_combout\,
	datad => \Equal0~3_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X59_Y42_N20
\counter~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter~0_combout\ = (\Add0~0_combout\ & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Equal0~4_combout\,
	datac => \process_0~0_combout\,
	datad => \Equal0~9_combout\,
	combout => \counter~0_combout\);

-- Location: FF_X59_Y42_N21
\counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(0));

-- Location: LCCOMB_X59_Y41_N16
\Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~0_combout\ = (counter(0) & ((\load_prev~q\) # (!\load_a~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load_a~input_o\,
	datac => counter(0),
	datad => \load_prev~q\,
	combout => \Q~0_combout\);

-- Location: LCCOMB_X59_Y42_N0
\Q.length[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q.length[0]~0_combout\ = (\reset~input_o\) # ((!\process_0~0_combout\ & ((\btn_prev~q\) # (!\btn_b~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \btn_b~input_o\,
	datac => \btn_prev~q\,
	datad => \process_0~0_combout\,
	combout => \Q.length[0]~0_combout\);

-- Location: LCCOMB_X59_Y41_N14
\Q.length[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q.length[0]~1_combout\ = (!\Q.length[0]~0_combout\ & (((!\Equal0~4_combout\ & !\Equal0~9_combout\)) # (!\process_0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \Q.length[0]~0_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \Q.length[0]~1_combout\);

-- Location: FF_X59_Y41_N17
\Q.length[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Q~0_combout\,
	ena => \Q.length[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.length[0]~reg0_q\);

-- Location: LCCOMB_X59_Y41_N2
\Q~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~1_combout\ = (counter(1)) # ((\load_a~input_o\ & !\load_prev~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter(1),
	datac => \load_a~input_o\,
	datad => \load_prev~q\,
	combout => \Q~1_combout\);

-- Location: FF_X59_Y41_N3
\Q.length[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Q~1_combout\,
	ena => \Q.length[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.length[1]~reg0_q\);

-- Location: LCCOMB_X59_Y41_N24
\Q~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~2_combout\ = (counter(2)) # ((\load_a~input_o\ & !\load_prev~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter(2),
	datac => \load_a~input_o\,
	datad => \load_prev~q\,
	combout => \Q~2_combout\);

-- Location: FF_X59_Y41_N25
\Q.length[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Q~2_combout\,
	ena => \Q.length[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.length[2]~reg0_q\);

-- Location: IOIBUF_X60_Y54_N8
\D~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D,
	o => \D~input_o\);

-- Location: LCCOMB_X57_Y41_N16
\data_in~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \data_in~0_combout\ = (\D~input_o\ & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D~input_o\,
	datab => \process_0~0_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \data_in~0_combout\);

-- Location: FF_X57_Y41_N17
\data_in[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \data_in~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(0));

-- Location: LCCOMB_X59_Y41_N10
\Q~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~3_combout\ = (\load_a~input_o\ & ((\load_prev~q\ & ((data_in(0)))) # (!\load_prev~q\ & (\D~input_o\)))) # (!\load_a~input_o\ & (((data_in(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D~input_o\,
	datab => data_in(0),
	datac => \load_a~input_o\,
	datad => \load_prev~q\,
	combout => \Q~3_combout\);

-- Location: FF_X59_Y41_N11
\Q.value[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Q~3_combout\,
	ena => \Q.length[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.value[0]~reg0_q\);

-- Location: LCCOMB_X57_Y41_N6
\data_in~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \data_in~1_combout\ = (data_in(0) & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_in(0),
	datab => \process_0~0_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \data_in~1_combout\);

-- Location: FF_X57_Y41_N7
\data_in[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \data_in~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(1));

-- Location: LCCOMB_X59_Y41_N20
\Q~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~4_combout\ = (\load_a~input_o\ & ((\load_prev~q\ & ((data_in(1)))) # (!\load_prev~q\ & (data_in(0))))) # (!\load_a~input_o\ & (((data_in(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \load_a~input_o\,
	datab => data_in(0),
	datac => data_in(1),
	datad => \load_prev~q\,
	combout => \Q~4_combout\);

-- Location: FF_X59_Y41_N21
\Q.value[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Q~4_combout\,
	ena => \Q.length[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.value[1]~reg0_q\);

-- Location: LCCOMB_X57_Y41_N24
\data_in~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \data_in~2_combout\ = (data_in(1) & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_in(1),
	datab => \process_0~0_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \data_in~2_combout\);

-- Location: FF_X57_Y41_N25
\data_in[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \data_in~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(2));

-- Location: LCCOMB_X59_Y41_N22
\Q~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~5_combout\ = (\load_a~input_o\ & ((\load_prev~q\ & (data_in(2))) # (!\load_prev~q\ & ((data_in(1)))))) # (!\load_a~input_o\ & (data_in(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_in(2),
	datab => \load_a~input_o\,
	datac => data_in(1),
	datad => \load_prev~q\,
	combout => \Q~5_combout\);

-- Location: FF_X59_Y41_N23
\Q.value[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Q~5_combout\,
	ena => \Q.length[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.value[2]~reg0_q\);

-- Location: LCCOMB_X57_Y41_N22
\data_in~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \data_in~3_combout\ = (data_in(2) & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_in(2),
	datab => \process_0~0_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \data_in~3_combout\);

-- Location: FF_X57_Y41_N23
\data_in[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \data_in~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(3));

-- Location: LCCOMB_X59_Y41_N28
\Q~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~6_combout\ = (\load_prev~q\ & (data_in(3))) # (!\load_prev~q\ & ((\load_a~input_o\ & ((data_in(2)))) # (!\load_a~input_o\ & (data_in(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_in(3),
	datab => \load_prev~q\,
	datac => \load_a~input_o\,
	datad => data_in(2),
	combout => \Q~6_combout\);

-- Location: FF_X59_Y41_N29
\Q.value[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Q~6_combout\,
	ena => \Q.length[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.value[3]~reg0_q\);

-- Location: LCCOMB_X57_Y41_N28
\data_in~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \data_in~4_combout\ = (data_in(3) & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_in(3),
	datab => \process_0~0_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \data_in~4_combout\);

-- Location: FF_X57_Y41_N29
\data_in[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \data_in~4_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(4));

-- Location: LCCOMB_X59_Y41_N30
\Q~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~7_combout\ = (\load_a~input_o\ & ((\load_prev~q\ & (data_in(4))) # (!\load_prev~q\ & ((data_in(3)))))) # (!\load_a~input_o\ & (data_in(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_in(4),
	datab => \load_a~input_o\,
	datac => data_in(3),
	datad => \load_prev~q\,
	combout => \Q~7_combout\);

-- Location: FF_X59_Y41_N31
\Q.value[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Q~7_combout\,
	ena => \Q.length[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.value[4]~reg0_q\);

-- Location: LCCOMB_X57_Y41_N30
\data_in~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \data_in~5_combout\ = (data_in(4) & (\process_0~0_combout\ & ((\Equal0~4_combout\) # (\Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_in(4),
	datab => \process_0~0_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \data_in~5_combout\);

-- Location: FF_X57_Y41_N31
\data_in[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \data_in~5_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \counter[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(5));

-- Location: LCCOMB_X59_Y41_N8
\Q~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~8_combout\ = (\load_a~input_o\ & ((\load_prev~q\ & (data_in(5))) # (!\load_prev~q\ & ((data_in(4)))))) # (!\load_a~input_o\ & (data_in(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_in(5),
	datab => \load_a~input_o\,
	datac => data_in(4),
	datad => \load_prev~q\,
	combout => \Q~8_combout\);

-- Location: FF_X59_Y41_N9
\Q.value[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Q~8_combout\,
	ena => \Q.length[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.value[5]~reg0_q\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

\ww_Q.length\(0) <= \Q.length[0]~output_o\;

\ww_Q.length\(1) <= \Q.length[1]~output_o\;

\ww_Q.length\(2) <= \Q.length[2]~output_o\;

\ww_Q.value\(0) <= \Q.value[0]~output_o\;

\ww_Q.value\(1) <= \Q.value[1]~output_o\;

\ww_Q.value\(2) <= \Q.value[2]~output_o\;

\ww_Q.value\(3) <= \Q.value[3]~output_o\;

\ww_Q.value\(4) <= \Q.value[4]~output_o\;

\ww_Q.value\(5) <= \Q.value[5]~output_o\;
END structure;


