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

-- DATE "11/14/2026 12:49:01"

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
LIBRARY STD;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.STANDARD.ALL;

ENTITY 	Conversor IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	btn_a : IN std_logic;
	milissegundos : IN STD.STANDARD.integer;
	load_assembler : OUT std_logic;
	output : OUT std_logic
	);
END Conversor;

-- Design Ports Information
-- load_assembler	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[31]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[7]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[8]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[9]	=>  Location: PIN_H11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[4]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[5]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[6]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[3]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[2]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[0]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[1]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[10]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[11]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[12]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[13]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[14]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[15]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[16]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[17]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[18]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[19]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[20]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[21]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[22]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[23]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[24]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[25]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[26]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[27]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[28]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[29]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[30]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- btn_a	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Conversor IS
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
SIGNAL ww_btn_a : std_logic;
SIGNAL ww_milissegundos : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_load_assembler : std_logic;
SIGNAL ww_output : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \load_assembler~output_o\ : std_logic;
SIGNAL \output~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \milissegundos[7]~input_o\ : std_logic;
SIGNAL \milissegundos[4]~input_o\ : std_logic;
SIGNAL \milissegundos[5]~input_o\ : std_logic;
SIGNAL \milissegundos[6]~input_o\ : std_logic;
SIGNAL \milissegundos[3]~input_o\ : std_logic;
SIGNAL \milissegundos[0]~input_o\ : std_logic;
SIGNAL \milissegundos[1]~input_o\ : std_logic;
SIGNAL \milissegundos[2]~input_o\ : std_logic;
SIGNAL \load_a~0_combout\ : std_logic;
SIGNAL \load_a~1_combout\ : std_logic;
SIGNAL \milissegundos[8]~input_o\ : std_logic;
SIGNAL \milissegundos[9]~input_o\ : std_logic;
SIGNAL \load_a~2_combout\ : std_logic;
SIGNAL \milissegundos[31]~input_o\ : std_logic;
SIGNAL \btn_a~input_o\ : std_logic;
SIGNAL \btn_prev~0_combout\ : std_logic;
SIGNAL \btn_prev~q\ : std_logic;
SIGNAL \milissegundos[30]~input_o\ : std_logic;
SIGNAL \milissegundos[10]~input_o\ : std_logic;
SIGNAL \milissegundos[12]~input_o\ : std_logic;
SIGNAL \milissegundos[13]~input_o\ : std_logic;
SIGNAL \milissegundos[11]~input_o\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \milissegundos[25]~input_o\ : std_logic;
SIGNAL \milissegundos[24]~input_o\ : std_logic;
SIGNAL \milissegundos[23]~input_o\ : std_logic;
SIGNAL \milissegundos[22]~input_o\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \milissegundos[18]~input_o\ : std_logic;
SIGNAL \milissegundos[19]~input_o\ : std_logic;
SIGNAL \milissegundos[21]~input_o\ : std_logic;
SIGNAL \milissegundos[20]~input_o\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \milissegundos[16]~input_o\ : std_logic;
SIGNAL \milissegundos[17]~input_o\ : std_logic;
SIGNAL \milissegundos[15]~input_o\ : std_logic;
SIGNAL \milissegundos[14]~input_o\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \milissegundos[29]~input_o\ : std_logic;
SIGNAL \milissegundos[28]~input_o\ : std_logic;
SIGNAL \milissegundos[27]~input_o\ : std_logic;
SIGNAL \milissegundos[26]~input_o\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \LessThan0~6_combout\ : std_logic;
SIGNAL \load_a~3_combout\ : std_logic;
SIGNAL \load_a~4_combout\ : std_logic;
SIGNAL \load_a~5_combout\ : std_logic;
SIGNAL \load_a~q\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \output~0_combout\ : std_logic;
SIGNAL \output~1_combout\ : std_logic;
SIGNAL \output~2_combout\ : std_logic;
SIGNAL \output~reg0_q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_btn_a <= btn_a;
ww_milissegundos <= IEEE.STD_LOGIC_ARITH.CONV_STD_LOGIC_VECTOR(milissegundos, 32);
load_assembler <= ww_load_assembler;
output <= ww_output;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);
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

-- Location: IOOBUF_X22_Y39_N16
\load_assembler~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \load_a~q\,
	devoe => ww_devoe,
	o => \load_assembler~output_o\);

-- Location: IOOBUF_X24_Y39_N9
\output~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output~reg0_q\,
	devoe => ww_devoe,
	o => \output~output_o\);

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

-- Location: IOIBUF_X26_Y39_N22
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

-- Location: IOIBUF_X26_Y39_N29
\milissegundos[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(7),
	o => \milissegundos[7]~input_o\);

-- Location: IOIBUF_X29_Y39_N15
\milissegundos[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(4),
	o => \milissegundos[4]~input_o\);

-- Location: IOIBUF_X29_Y39_N8
\milissegundos[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(5),
	o => \milissegundos[5]~input_o\);

-- Location: IOIBUF_X22_Y39_N29
\milissegundos[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(6),
	o => \milissegundos[6]~input_o\);

-- Location: IOIBUF_X26_Y39_N15
\milissegundos[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(3),
	o => \milissegundos[3]~input_o\);

-- Location: IOIBUF_X34_Y39_N22
\milissegundos[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(0),
	o => \milissegundos[0]~input_o\);

-- Location: IOIBUF_X26_Y39_N1
\milissegundos[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(1),
	o => \milissegundos[1]~input_o\);

-- Location: IOIBUF_X31_Y39_N29
\milissegundos[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(2),
	o => \milissegundos[2]~input_o\);

-- Location: LCCOMB_X30_Y36_N10
\load_a~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \load_a~0_combout\ = (!\milissegundos[3]~input_o\ & (((!\milissegundos[0]~input_o\ & !\milissegundos[1]~input_o\)) # (!\milissegundos[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \milissegundos[3]~input_o\,
	datab => \milissegundos[0]~input_o\,
	datac => \milissegundos[1]~input_o\,
	datad => \milissegundos[2]~input_o\,
	combout => \load_a~0_combout\);

-- Location: LCCOMB_X30_Y36_N0
\load_a~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \load_a~1_combout\ = (!\milissegundos[4]~input_o\ & (!\milissegundos[5]~input_o\ & (!\milissegundos[6]~input_o\ & \load_a~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \milissegundos[4]~input_o\,
	datab => \milissegundos[5]~input_o\,
	datac => \milissegundos[6]~input_o\,
	datad => \load_a~0_combout\,
	combout => \load_a~1_combout\);

-- Location: IOIBUF_X31_Y39_N22
\milissegundos[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(8),
	o => \milissegundos[8]~input_o\);

-- Location: IOIBUF_X34_Y39_N15
\milissegundos[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(9),
	o => \milissegundos[9]~input_o\);

-- Location: LCCOMB_X30_Y36_N26
\load_a~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \load_a~2_combout\ = ((\load_a~1_combout\) # ((!\milissegundos[9]~input_o\) # (!\milissegundos[8]~input_o\))) # (!\milissegundos[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \milissegundos[7]~input_o\,
	datab => \load_a~1_combout\,
	datac => \milissegundos[8]~input_o\,
	datad => \milissegundos[9]~input_o\,
	combout => \load_a~2_combout\);

-- Location: IOIBUF_X26_Y39_N8
\milissegundos[31]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(31),
	o => \milissegundos[31]~input_o\);

-- Location: IOIBUF_X31_Y39_N8
\btn_a~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_btn_a,
	o => \btn_a~input_o\);

-- Location: LCCOMB_X30_Y36_N22
\btn_prev~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \btn_prev~0_combout\ = (\btn_a~input_o\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a~input_o\,
	datac => \reset~input_o\,
	combout => \btn_prev~0_combout\);

-- Location: FF_X30_Y36_N13
btn_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \btn_prev~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \btn_prev~q\);

-- Location: IOIBUF_X34_Y39_N8
\milissegundos[30]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(30),
	o => \milissegundos[30]~input_o\);

-- Location: IOIBUF_X24_Y39_N15
\milissegundos[10]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(10),
	o => \milissegundos[10]~input_o\);

-- Location: IOIBUF_X24_Y39_N22
\milissegundos[12]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(12),
	o => \milissegundos[12]~input_o\);

-- Location: IOIBUF_X24_Y39_N1
\milissegundos[13]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(13),
	o => \milissegundos[13]~input_o\);

-- Location: IOIBUF_X24_Y39_N29
\milissegundos[11]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(11),
	o => \milissegundos[11]~input_o\);

-- Location: LCCOMB_X24_Y36_N4
\LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!\milissegundos[10]~input_o\ & (!\milissegundos[12]~input_o\ & (!\milissegundos[13]~input_o\ & !\milissegundos[11]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \milissegundos[10]~input_o\,
	datab => \milissegundos[12]~input_o\,
	datac => \milissegundos[13]~input_o\,
	datad => \milissegundos[11]~input_o\,
	combout => \LessThan0~0_combout\);

-- Location: IOIBUF_X20_Y39_N8
\milissegundos[25]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(25),
	o => \milissegundos[25]~input_o\);

-- Location: IOIBUF_X20_Y39_N15
\milissegundos[24]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(24),
	o => \milissegundos[24]~input_o\);

-- Location: IOIBUF_X20_Y39_N1
\milissegundos[23]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(23),
	o => \milissegundos[23]~input_o\);

-- Location: IOIBUF_X22_Y39_N22
\milissegundos[22]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(22),
	o => \milissegundos[22]~input_o\);

-- Location: LCCOMB_X21_Y38_N8
\LessThan0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (!\milissegundos[25]~input_o\ & (!\milissegundos[24]~input_o\ & (!\milissegundos[23]~input_o\ & !\milissegundos[22]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \milissegundos[25]~input_o\,
	datab => \milissegundos[24]~input_o\,
	datac => \milissegundos[23]~input_o\,
	datad => \milissegundos[22]~input_o\,
	combout => \LessThan0~3_combout\);

-- Location: IOIBUF_X29_Y39_N1
\milissegundos[18]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(18),
	o => \milissegundos[18]~input_o\);

-- Location: IOIBUF_X31_Y39_N15
\milissegundos[19]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(19),
	o => \milissegundos[19]~input_o\);

-- Location: IOIBUF_X31_Y39_N1
\milissegundos[21]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(21),
	o => \milissegundos[21]~input_o\);

-- Location: IOIBUF_X34_Y39_N29
\milissegundos[20]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(20),
	o => \milissegundos[20]~input_o\);

-- Location: LCCOMB_X30_Y36_N8
\LessThan0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (!\milissegundos[18]~input_o\ & (!\milissegundos[19]~input_o\ & (!\milissegundos[21]~input_o\ & !\milissegundos[20]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \milissegundos[18]~input_o\,
	datab => \milissegundos[19]~input_o\,
	datac => \milissegundos[21]~input_o\,
	datad => \milissegundos[20]~input_o\,
	combout => \LessThan0~2_combout\);

-- Location: IOIBUF_X46_Y54_N15
\milissegundos[16]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(16),
	o => \milissegundos[16]~input_o\);

-- Location: IOIBUF_X46_Y54_N22
\milissegundos[17]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(17),
	o => \milissegundos[17]~input_o\);

-- Location: IOIBUF_X46_Y54_N1
\milissegundos[15]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(15),
	o => \milissegundos[15]~input_o\);

-- Location: IOIBUF_X46_Y54_N29
\milissegundos[14]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(14),
	o => \milissegundos[14]~input_o\);

-- Location: LCCOMB_X46_Y53_N0
\LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (!\milissegundos[16]~input_o\ & (!\milissegundos[17]~input_o\ & (!\milissegundos[15]~input_o\ & !\milissegundos[14]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \milissegundos[16]~input_o\,
	datab => \milissegundos[17]~input_o\,
	datac => \milissegundos[15]~input_o\,
	datad => \milissegundos[14]~input_o\,
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X30_Y36_N14
\LessThan0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = (\LessThan0~0_combout\ & (\LessThan0~3_combout\ & (\LessThan0~2_combout\ & \LessThan0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \LessThan0~3_combout\,
	datac => \LessThan0~2_combout\,
	datad => \LessThan0~1_combout\,
	combout => \LessThan0~4_combout\);

-- Location: IOIBUF_X36_Y39_N15
\milissegundos[29]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(29),
	o => \milissegundos[29]~input_o\);

-- Location: IOIBUF_X36_Y39_N22
\milissegundos[28]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(28),
	o => \milissegundos[28]~input_o\);

-- Location: IOIBUF_X34_Y39_N1
\milissegundos[27]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(27),
	o => \milissegundos[27]~input_o\);

-- Location: IOIBUF_X36_Y39_N29
\milissegundos[26]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_milissegundos(26),
	o => \milissegundos[26]~input_o\);

-- Location: LCCOMB_X35_Y36_N24
\LessThan0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = (!\milissegundos[29]~input_o\ & (!\milissegundos[28]~input_o\ & (!\milissegundos[27]~input_o\ & !\milissegundos[26]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \milissegundos[29]~input_o\,
	datab => \milissegundos[28]~input_o\,
	datac => \milissegundos[27]~input_o\,
	datad => \milissegundos[26]~input_o\,
	combout => \LessThan0~5_combout\);

-- Location: LCCOMB_X34_Y36_N16
\LessThan0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~6_combout\ = (!\milissegundos[30]~input_o\ & (\LessThan0~4_combout\ & \LessThan0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \milissegundos[30]~input_o\,
	datac => \LessThan0~4_combout\,
	datad => \LessThan0~5_combout\,
	combout => \LessThan0~6_combout\);

-- Location: LCCOMB_X30_Y36_N16
\load_a~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \load_a~3_combout\ = (!\btn_a~input_o\ & ((\milissegundos[31]~input_o\) # (\LessThan0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a~input_o\,
	datab => \milissegundos[31]~input_o\,
	datac => \LessThan0~6_combout\,
	combout => \load_a~3_combout\);

-- Location: LCCOMB_X30_Y36_N12
\load_a~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \load_a~4_combout\ = (\btn_prev~q\ & (\load_a~3_combout\ & ((\load_a~2_combout\) # (\milissegundos[31]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \load_a~2_combout\,
	datab => \milissegundos[31]~input_o\,
	datac => \btn_prev~q\,
	datad => \load_a~3_combout\,
	combout => \load_a~4_combout\);

-- Location: LCCOMB_X30_Y36_N20
\load_a~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \load_a~5_combout\ = (!\reset~input_o\ & \load_a~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \load_a~4_combout\,
	combout => \load_a~5_combout\);

-- Location: FF_X30_Y36_N21
load_a : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \load_a~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \load_a~q\);

-- Location: LCCOMB_X30_Y36_N28
\LessThan1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (\milissegundos[3]~input_o\ & (\milissegundos[2]~input_o\ & ((\milissegundos[0]~input_o\) # (\milissegundos[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \milissegundos[3]~input_o\,
	datab => \milissegundos[0]~input_o\,
	datac => \milissegundos[1]~input_o\,
	datad => \milissegundos[2]~input_o\,
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X30_Y36_N6
\LessThan1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (\milissegundos[7]~input_o\) # ((\milissegundos[6]~input_o\) # ((\milissegundos[5]~input_o\ & \milissegundos[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \milissegundos[7]~input_o\,
	datab => \milissegundos[5]~input_o\,
	datac => \milissegundos[6]~input_o\,
	datad => \milissegundos[4]~input_o\,
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X30_Y36_N18
\output~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \output~0_combout\ = (\milissegundos[8]~input_o\ & ((\LessThan1~0_combout\) # ((\LessThan1~1_combout\ & \milissegundos[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \milissegundos[8]~input_o\,
	datab => \LessThan1~1_combout\,
	datac => \milissegundos[5]~input_o\,
	datad => \LessThan1~0_combout\,
	combout => \output~0_combout\);

-- Location: LCCOMB_X30_Y36_N24
\output~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \output~1_combout\ = (\milissegundos[31]~input_o\) # ((\LessThan0~6_combout\ & (!\output~0_combout\ & !\milissegundos[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~6_combout\,
	datab => \output~0_combout\,
	datac => \milissegundos[31]~input_o\,
	datad => \milissegundos[9]~input_o\,
	combout => \output~1_combout\);

-- Location: LCCOMB_X30_Y36_N30
\output~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \output~2_combout\ = (!\reset~input_o\ & ((\load_a~4_combout\ & (!\output~1_combout\)) # (!\load_a~4_combout\ & ((\output~reg0_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \output~1_combout\,
	datac => \output~reg0_q\,
	datad => \load_a~4_combout\,
	combout => \output~2_combout\);

-- Location: FF_X30_Y36_N31
\output~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \output~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output~reg0_q\);

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

ww_load_assembler <= \load_assembler~output_o\;

ww_output <= \output~output_o\;
END structure;


