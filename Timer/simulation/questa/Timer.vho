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

-- DATE "11/14/2026 10:28:07"

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

ENTITY 	Timer IS
    PORT (
	clock : IN std_logic;
	btn_a : IN std_logic;
	reset : IN std_logic;
	milissegundos : BUFFER std_logic_vector(31 DOWNTO 0)
	);
END Timer;

-- Design Ports Information
-- milissegundos[0]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[1]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[2]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[3]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[4]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[5]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[6]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[7]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[8]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[9]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[10]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[11]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[12]	=>  Location: PIN_H11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[13]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[14]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[15]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[16]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[17]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[18]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[19]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[20]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[21]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[22]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[23]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[24]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[25]	=>  Location: PIN_G3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[26]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[27]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[28]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[29]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[30]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- milissegundos[31]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- btn_a	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Timer IS
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
SIGNAL ww_btn_a : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_milissegundos : std_logic_vector(31 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \milissegundos[0]~output_o\ : std_logic;
SIGNAL \milissegundos[1]~output_o\ : std_logic;
SIGNAL \milissegundos[2]~output_o\ : std_logic;
SIGNAL \milissegundos[3]~output_o\ : std_logic;
SIGNAL \milissegundos[4]~output_o\ : std_logic;
SIGNAL \milissegundos[5]~output_o\ : std_logic;
SIGNAL \milissegundos[6]~output_o\ : std_logic;
SIGNAL \milissegundos[7]~output_o\ : std_logic;
SIGNAL \milissegundos[8]~output_o\ : std_logic;
SIGNAL \milissegundos[9]~output_o\ : std_logic;
SIGNAL \milissegundos[10]~output_o\ : std_logic;
SIGNAL \milissegundos[11]~output_o\ : std_logic;
SIGNAL \milissegundos[12]~output_o\ : std_logic;
SIGNAL \milissegundos[13]~output_o\ : std_logic;
SIGNAL \milissegundos[14]~output_o\ : std_logic;
SIGNAL \milissegundos[15]~output_o\ : std_logic;
SIGNAL \milissegundos[16]~output_o\ : std_logic;
SIGNAL \milissegundos[17]~output_o\ : std_logic;
SIGNAL \milissegundos[18]~output_o\ : std_logic;
SIGNAL \milissegundos[19]~output_o\ : std_logic;
SIGNAL \milissegundos[20]~output_o\ : std_logic;
SIGNAL \milissegundos[21]~output_o\ : std_logic;
SIGNAL \milissegundos[22]~output_o\ : std_logic;
SIGNAL \milissegundos[23]~output_o\ : std_logic;
SIGNAL \milissegundos[24]~output_o\ : std_logic;
SIGNAL \milissegundos[25]~output_o\ : std_logic;
SIGNAL \milissegundos[26]~output_o\ : std_logic;
SIGNAL \milissegundos[27]~output_o\ : std_logic;
SIGNAL \milissegundos[28]~output_o\ : std_logic;
SIGNAL \milissegundos[29]~output_o\ : std_logic;
SIGNAL \milissegundos[30]~output_o\ : std_logic;
SIGNAL \milissegundos[31]~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \ms_count[0]~32_combout\ : std_logic;
SIGNAL \btn_a~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \btn_prev~0_combout\ : std_logic;
SIGNAL \btn_prev~q\ : std_logic;
SIGNAL \ms_count[17]~34_combout\ : std_logic;
SIGNAL \clock_period[0]~32_combout\ : std_logic;
SIGNAL \clock_period[31]~34_combout\ : std_logic;
SIGNAL \clock_period[31]~35_combout\ : std_logic;
SIGNAL \clock_period[0]~33\ : std_logic;
SIGNAL \clock_period[1]~36_combout\ : std_logic;
SIGNAL \clock_period[1]~37\ : std_logic;
SIGNAL \clock_period[2]~38_combout\ : std_logic;
SIGNAL \clock_period[2]~39\ : std_logic;
SIGNAL \clock_period[3]~40_combout\ : std_logic;
SIGNAL \clock_period[3]~41\ : std_logic;
SIGNAL \clock_period[4]~42_combout\ : std_logic;
SIGNAL \clock_period[4]~43\ : std_logic;
SIGNAL \clock_period[5]~44_combout\ : std_logic;
SIGNAL \clock_period[5]~45\ : std_logic;
SIGNAL \clock_period[6]~46_combout\ : std_logic;
SIGNAL \clock_period[6]~47\ : std_logic;
SIGNAL \clock_period[7]~48_combout\ : std_logic;
SIGNAL \clock_period[7]~49\ : std_logic;
SIGNAL \clock_period[8]~50_combout\ : std_logic;
SIGNAL \clock_period[8]~51\ : std_logic;
SIGNAL \clock_period[9]~52_combout\ : std_logic;
SIGNAL \clock_period[9]~53\ : std_logic;
SIGNAL \clock_period[10]~54_combout\ : std_logic;
SIGNAL \clock_period[10]~55\ : std_logic;
SIGNAL \clock_period[11]~56_combout\ : std_logic;
SIGNAL \clock_period[11]~57\ : std_logic;
SIGNAL \clock_period[12]~58_combout\ : std_logic;
SIGNAL \clock_period[12]~59\ : std_logic;
SIGNAL \clock_period[13]~60_combout\ : std_logic;
SIGNAL \clock_period[13]~61\ : std_logic;
SIGNAL \clock_period[14]~62_combout\ : std_logic;
SIGNAL \clock_period[14]~63\ : std_logic;
SIGNAL \clock_period[15]~64_combout\ : std_logic;
SIGNAL \clock_period[15]~65\ : std_logic;
SIGNAL \clock_period[16]~66_combout\ : std_logic;
SIGNAL \clock_period[16]~67\ : std_logic;
SIGNAL \clock_period[17]~68_combout\ : std_logic;
SIGNAL \clock_period[17]~69\ : std_logic;
SIGNAL \clock_period[18]~70_combout\ : std_logic;
SIGNAL \clock_period[18]~71\ : std_logic;
SIGNAL \clock_period[19]~72_combout\ : std_logic;
SIGNAL \clock_period[19]~73\ : std_logic;
SIGNAL \clock_period[20]~74_combout\ : std_logic;
SIGNAL \clock_period[20]~75\ : std_logic;
SIGNAL \clock_period[21]~76_combout\ : std_logic;
SIGNAL \clock_period[21]~77\ : std_logic;
SIGNAL \clock_period[22]~78_combout\ : std_logic;
SIGNAL \clock_period[22]~79\ : std_logic;
SIGNAL \clock_period[23]~80_combout\ : std_logic;
SIGNAL \clock_period[23]~81\ : std_logic;
SIGNAL \clock_period[24]~82_combout\ : std_logic;
SIGNAL \clock_period[24]~83\ : std_logic;
SIGNAL \clock_period[25]~84_combout\ : std_logic;
SIGNAL \clock_period[25]~85\ : std_logic;
SIGNAL \clock_period[26]~86_combout\ : std_logic;
SIGNAL \clock_period[26]~87\ : std_logic;
SIGNAL \clock_period[27]~88_combout\ : std_logic;
SIGNAL \clock_period[27]~89\ : std_logic;
SIGNAL \clock_period[28]~90_combout\ : std_logic;
SIGNAL \clock_period[28]~91\ : std_logic;
SIGNAL \clock_period[29]~92_combout\ : std_logic;
SIGNAL \clock_period[29]~93\ : std_logic;
SIGNAL \clock_period[30]~94_combout\ : std_logic;
SIGNAL \clock_period[30]~95\ : std_logic;
SIGNAL \clock_period[31]~96_combout\ : std_logic;
SIGNAL \Equal0~9_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~8_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \Equal0~10_combout\ : std_logic;
SIGNAL \ms_count[17]~35_combout\ : std_logic;
SIGNAL \ms_count[0]~33\ : std_logic;
SIGNAL \ms_count[1]~36_combout\ : std_logic;
SIGNAL \ms_count[1]~37\ : std_logic;
SIGNAL \ms_count[2]~38_combout\ : std_logic;
SIGNAL \ms_count[2]~39\ : std_logic;
SIGNAL \ms_count[3]~40_combout\ : std_logic;
SIGNAL \ms_count[3]~41\ : std_logic;
SIGNAL \ms_count[4]~42_combout\ : std_logic;
SIGNAL \ms_count[4]~43\ : std_logic;
SIGNAL \ms_count[5]~44_combout\ : std_logic;
SIGNAL \ms_count[5]~45\ : std_logic;
SIGNAL \ms_count[6]~46_combout\ : std_logic;
SIGNAL \ms_count[6]~47\ : std_logic;
SIGNAL \ms_count[7]~48_combout\ : std_logic;
SIGNAL \ms_count[7]~49\ : std_logic;
SIGNAL \ms_count[8]~50_combout\ : std_logic;
SIGNAL \ms_count[8]~51\ : std_logic;
SIGNAL \ms_count[9]~52_combout\ : std_logic;
SIGNAL \ms_count[9]~53\ : std_logic;
SIGNAL \ms_count[10]~54_combout\ : std_logic;
SIGNAL \ms_count[10]~55\ : std_logic;
SIGNAL \ms_count[11]~56_combout\ : std_logic;
SIGNAL \ms_count[11]~57\ : std_logic;
SIGNAL \ms_count[12]~58_combout\ : std_logic;
SIGNAL \ms_count[12]~59\ : std_logic;
SIGNAL \ms_count[13]~60_combout\ : std_logic;
SIGNAL \ms_count[13]~61\ : std_logic;
SIGNAL \ms_count[14]~62_combout\ : std_logic;
SIGNAL \ms_count[14]~63\ : std_logic;
SIGNAL \ms_count[15]~64_combout\ : std_logic;
SIGNAL \ms_count[15]~65\ : std_logic;
SIGNAL \ms_count[16]~66_combout\ : std_logic;
SIGNAL \ms_count[16]~67\ : std_logic;
SIGNAL \ms_count[17]~68_combout\ : std_logic;
SIGNAL \ms_count[17]~69\ : std_logic;
SIGNAL \ms_count[18]~70_combout\ : std_logic;
SIGNAL \ms_count[18]~71\ : std_logic;
SIGNAL \ms_count[19]~72_combout\ : std_logic;
SIGNAL \ms_count[19]~73\ : std_logic;
SIGNAL \ms_count[20]~74_combout\ : std_logic;
SIGNAL \ms_count[20]~75\ : std_logic;
SIGNAL \ms_count[21]~76_combout\ : std_logic;
SIGNAL \ms_count[21]~77\ : std_logic;
SIGNAL \ms_count[22]~78_combout\ : std_logic;
SIGNAL \ms_count[22]~79\ : std_logic;
SIGNAL \ms_count[23]~80_combout\ : std_logic;
SIGNAL \ms_count[23]~81\ : std_logic;
SIGNAL \ms_count[24]~82_combout\ : std_logic;
SIGNAL \ms_count[24]~83\ : std_logic;
SIGNAL \ms_count[25]~84_combout\ : std_logic;
SIGNAL \ms_count[25]~85\ : std_logic;
SIGNAL \ms_count[26]~86_combout\ : std_logic;
SIGNAL \ms_count[26]~87\ : std_logic;
SIGNAL \ms_count[27]~88_combout\ : std_logic;
SIGNAL \ms_count[27]~89\ : std_logic;
SIGNAL \ms_count[28]~90_combout\ : std_logic;
SIGNAL \ms_count[28]~91\ : std_logic;
SIGNAL \ms_count[29]~92_combout\ : std_logic;
SIGNAL \ms_count[29]~93\ : std_logic;
SIGNAL \ms_count[30]~94_combout\ : std_logic;
SIGNAL \ms_count[30]~95\ : std_logic;
SIGNAL \ms_count[31]~96_combout\ : std_logic;
SIGNAL clock_period : std_logic_vector(31 DOWNTO 0);
SIGNAL ms_count : std_logic_vector(31 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clock <= clock;
ww_btn_a <= btn_a;
ww_reset <= reset;
milissegundos <= ww_milissegundos;
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

-- Location: LCCOMB_X44_Y42_N12
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

-- Location: IOOBUF_X0_Y36_N2
\milissegundos[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(0),
	devoe => ww_devoe,
	o => \milissegundos[0]~output_o\);

-- Location: IOOBUF_X24_Y39_N9
\milissegundos[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(1),
	devoe => ww_devoe,
	o => \milissegundos[1]~output_o\);

-- Location: IOOBUF_X22_Y39_N30
\milissegundos[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(2),
	devoe => ww_devoe,
	o => \milissegundos[2]~output_o\);

-- Location: IOOBUF_X24_Y39_N30
\milissegundos[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(3),
	devoe => ww_devoe,
	o => \milissegundos[3]~output_o\);

-- Location: IOOBUF_X20_Y39_N2
\milissegundos[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(4),
	devoe => ww_devoe,
	o => \milissegundos[4]~output_o\);

-- Location: IOOBUF_X36_Y39_N23
\milissegundos[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(5),
	devoe => ww_devoe,
	o => \milissegundos[5]~output_o\);

-- Location: IOOBUF_X20_Y39_N16
\milissegundos[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(6),
	devoe => ww_devoe,
	o => \milissegundos[6]~output_o\);

-- Location: IOOBUF_X22_Y39_N16
\milissegundos[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(7),
	devoe => ww_devoe,
	o => \milissegundos[7]~output_o\);

-- Location: IOOBUF_X0_Y36_N9
\milissegundos[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(8),
	devoe => ww_devoe,
	o => \milissegundos[8]~output_o\);

-- Location: IOOBUF_X26_Y39_N30
\milissegundos[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(9),
	devoe => ww_devoe,
	o => \milissegundos[9]~output_o\);

-- Location: IOOBUF_X24_Y39_N23
\milissegundos[10]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(10),
	devoe => ww_devoe,
	o => \milissegundos[10]~output_o\);

-- Location: IOOBUF_X22_Y39_N23
\milissegundos[11]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(11),
	devoe => ww_devoe,
	o => \milissegundos[11]~output_o\);

-- Location: IOOBUF_X34_Y39_N16
\milissegundos[12]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(12),
	devoe => ww_devoe,
	o => \milissegundos[12]~output_o\);

-- Location: IOOBUF_X20_Y39_N9
\milissegundos[13]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(13),
	devoe => ww_devoe,
	o => \milissegundos[13]~output_o\);

-- Location: IOOBUF_X24_Y39_N16
\milissegundos[14]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(14),
	devoe => ww_devoe,
	o => \milissegundos[14]~output_o\);

-- Location: IOOBUF_X34_Y39_N9
\milissegundos[15]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(15),
	devoe => ww_devoe,
	o => \milissegundos[15]~output_o\);

-- Location: IOOBUF_X24_Y39_N2
\milissegundos[16]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(16),
	devoe => ww_devoe,
	o => \milissegundos[16]~output_o\);

-- Location: IOOBUF_X31_Y39_N16
\milissegundos[17]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(17),
	devoe => ww_devoe,
	o => \milissegundos[17]~output_o\);

-- Location: IOOBUF_X26_Y39_N2
\milissegundos[18]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(18),
	devoe => ww_devoe,
	o => \milissegundos[18]~output_o\);

-- Location: IOOBUF_X29_Y39_N2
\milissegundos[19]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(19),
	devoe => ww_devoe,
	o => \milissegundos[19]~output_o\);

-- Location: IOOBUF_X31_Y39_N2
\milissegundos[20]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(20),
	devoe => ww_devoe,
	o => \milissegundos[20]~output_o\);

-- Location: IOOBUF_X29_Y39_N9
\milissegundos[21]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(21),
	devoe => ww_devoe,
	o => \milissegundos[21]~output_o\);

-- Location: IOOBUF_X34_Y39_N2
\milissegundos[22]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(22),
	devoe => ww_devoe,
	o => \milissegundos[22]~output_o\);

-- Location: IOOBUF_X36_Y39_N16
\milissegundos[23]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(23),
	devoe => ww_devoe,
	o => \milissegundos[23]~output_o\);

-- Location: IOOBUF_X31_Y39_N9
\milissegundos[24]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(24),
	devoe => ww_devoe,
	o => \milissegundos[24]~output_o\);

-- Location: IOOBUF_X0_Y35_N9
\milissegundos[25]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(25),
	devoe => ww_devoe,
	o => \milissegundos[25]~output_o\);

-- Location: IOOBUF_X34_Y39_N30
\milissegundos[26]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(26),
	devoe => ww_devoe,
	o => \milissegundos[26]~output_o\);

-- Location: IOOBUF_X26_Y39_N9
\milissegundos[27]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(27),
	devoe => ww_devoe,
	o => \milissegundos[27]~output_o\);

-- Location: IOOBUF_X26_Y39_N23
\milissegundos[28]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(28),
	devoe => ww_devoe,
	o => \milissegundos[28]~output_o\);

-- Location: IOOBUF_X34_Y39_N23
\milissegundos[29]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(29),
	devoe => ww_devoe,
	o => \milissegundos[29]~output_o\);

-- Location: IOOBUF_X31_Y39_N30
\milissegundos[30]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(30),
	devoe => ww_devoe,
	o => \milissegundos[30]~output_o\);

-- Location: IOOBUF_X26_Y39_N16
\milissegundos[31]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ms_count(31),
	devoe => ww_devoe,
	o => \milissegundos[31]~output_o\);

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

-- Location: LCCOMB_X25_Y36_N0
\ms_count[0]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[0]~32_combout\ = ms_count(0) $ (VCC)
-- \ms_count[0]~33\ = CARRY(ms_count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ms_count(0),
	datad => VCC,
	combout => \ms_count[0]~32_combout\,
	cout => \ms_count[0]~33\);

-- Location: IOIBUF_X31_Y39_N22
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

-- Location: IOIBUF_X29_Y39_N15
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

-- Location: LCCOMB_X26_Y36_N26
\btn_prev~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \btn_prev~0_combout\ = (\btn_a~input_o\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a~input_o\,
	datad => \reset~input_o\,
	combout => \btn_prev~0_combout\);

-- Location: FF_X26_Y36_N27
btn_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \btn_prev~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \btn_prev~q\);

-- Location: LCCOMB_X26_Y36_N16
\ms_count[17]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[17]~34_combout\ = (\reset~input_o\) # ((!\btn_prev~q\ & \btn_a~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_prev~q\,
	datab => \reset~input_o\,
	datad => \btn_a~input_o\,
	combout => \ms_count[17]~34_combout\);

-- Location: LCCOMB_X27_Y36_N0
\clock_period[0]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[0]~32_combout\ = clock_period(0) $ (VCC)
-- \clock_period[0]~33\ = CARRY(clock_period(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => clock_period(0),
	datad => VCC,
	combout => \clock_period[0]~32_combout\,
	cout => \clock_period[0]~33\);

-- Location: LCCOMB_X26_Y36_N30
\clock_period[31]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[31]~34_combout\ = (\reset~input_o\) # (((\btn_a~input_o\ & !\btn_prev~q\)) # (!\Equal0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a~input_o\,
	datab => \reset~input_o\,
	datac => \btn_prev~q\,
	datad => \Equal0~10_combout\,
	combout => \clock_period[31]~34_combout\);

-- Location: LCCOMB_X26_Y36_N22
\clock_period[31]~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[31]~35_combout\ = (\btn_a~input_o\) # (\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a~input_o\,
	datad => \reset~input_o\,
	combout => \clock_period[31]~35_combout\);

-- Location: FF_X27_Y36_N1
\clock_period[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[0]~32_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(0));

-- Location: LCCOMB_X27_Y36_N2
\clock_period[1]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[1]~36_combout\ = (clock_period(1) & (!\clock_period[0]~33\)) # (!clock_period(1) & ((\clock_period[0]~33\) # (GND)))
-- \clock_period[1]~37\ = CARRY((!\clock_period[0]~33\) # (!clock_period(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(1),
	datad => VCC,
	cin => \clock_period[0]~33\,
	combout => \clock_period[1]~36_combout\,
	cout => \clock_period[1]~37\);

-- Location: FF_X27_Y36_N3
\clock_period[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[1]~36_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(1));

-- Location: LCCOMB_X27_Y36_N4
\clock_period[2]~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[2]~38_combout\ = (clock_period(2) & (\clock_period[1]~37\ $ (GND))) # (!clock_period(2) & (!\clock_period[1]~37\ & VCC))
-- \clock_period[2]~39\ = CARRY((clock_period(2) & !\clock_period[1]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(2),
	datad => VCC,
	cin => \clock_period[1]~37\,
	combout => \clock_period[2]~38_combout\,
	cout => \clock_period[2]~39\);

-- Location: FF_X27_Y36_N5
\clock_period[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[2]~38_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(2));

-- Location: LCCOMB_X27_Y36_N6
\clock_period[3]~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[3]~40_combout\ = (clock_period(3) & (!\clock_period[2]~39\)) # (!clock_period(3) & ((\clock_period[2]~39\) # (GND)))
-- \clock_period[3]~41\ = CARRY((!\clock_period[2]~39\) # (!clock_period(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(3),
	datad => VCC,
	cin => \clock_period[2]~39\,
	combout => \clock_period[3]~40_combout\,
	cout => \clock_period[3]~41\);

-- Location: FF_X27_Y36_N7
\clock_period[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[3]~40_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(3));

-- Location: LCCOMB_X27_Y36_N8
\clock_period[4]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[4]~42_combout\ = (clock_period(4) & (\clock_period[3]~41\ $ (GND))) # (!clock_period(4) & (!\clock_period[3]~41\ & VCC))
-- \clock_period[4]~43\ = CARRY((clock_period(4) & !\clock_period[3]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(4),
	datad => VCC,
	cin => \clock_period[3]~41\,
	combout => \clock_period[4]~42_combout\,
	cout => \clock_period[4]~43\);

-- Location: FF_X27_Y36_N9
\clock_period[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[4]~42_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(4));

-- Location: LCCOMB_X27_Y36_N10
\clock_period[5]~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[5]~44_combout\ = (clock_period(5) & (!\clock_period[4]~43\)) # (!clock_period(5) & ((\clock_period[4]~43\) # (GND)))
-- \clock_period[5]~45\ = CARRY((!\clock_period[4]~43\) # (!clock_period(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(5),
	datad => VCC,
	cin => \clock_period[4]~43\,
	combout => \clock_period[5]~44_combout\,
	cout => \clock_period[5]~45\);

-- Location: FF_X27_Y36_N11
\clock_period[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[5]~44_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(5));

-- Location: LCCOMB_X27_Y36_N12
\clock_period[6]~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[6]~46_combout\ = (clock_period(6) & (\clock_period[5]~45\ $ (GND))) # (!clock_period(6) & (!\clock_period[5]~45\ & VCC))
-- \clock_period[6]~47\ = CARRY((clock_period(6) & !\clock_period[5]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(6),
	datad => VCC,
	cin => \clock_period[5]~45\,
	combout => \clock_period[6]~46_combout\,
	cout => \clock_period[6]~47\);

-- Location: FF_X27_Y36_N13
\clock_period[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[6]~46_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(6));

-- Location: LCCOMB_X27_Y36_N14
\clock_period[7]~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[7]~48_combout\ = (clock_period(7) & (!\clock_period[6]~47\)) # (!clock_period(7) & ((\clock_period[6]~47\) # (GND)))
-- \clock_period[7]~49\ = CARRY((!\clock_period[6]~47\) # (!clock_period(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(7),
	datad => VCC,
	cin => \clock_period[6]~47\,
	combout => \clock_period[7]~48_combout\,
	cout => \clock_period[7]~49\);

-- Location: FF_X27_Y36_N15
\clock_period[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[7]~48_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(7));

-- Location: LCCOMB_X27_Y36_N16
\clock_period[8]~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[8]~50_combout\ = (clock_period(8) & (\clock_period[7]~49\ $ (GND))) # (!clock_period(8) & (!\clock_period[7]~49\ & VCC))
-- \clock_period[8]~51\ = CARRY((clock_period(8) & !\clock_period[7]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(8),
	datad => VCC,
	cin => \clock_period[7]~49\,
	combout => \clock_period[8]~50_combout\,
	cout => \clock_period[8]~51\);

-- Location: FF_X27_Y36_N17
\clock_period[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[8]~50_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(8));

-- Location: LCCOMB_X27_Y36_N18
\clock_period[9]~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[9]~52_combout\ = (clock_period(9) & (!\clock_period[8]~51\)) # (!clock_period(9) & ((\clock_period[8]~51\) # (GND)))
-- \clock_period[9]~53\ = CARRY((!\clock_period[8]~51\) # (!clock_period(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(9),
	datad => VCC,
	cin => \clock_period[8]~51\,
	combout => \clock_period[9]~52_combout\,
	cout => \clock_period[9]~53\);

-- Location: FF_X27_Y36_N19
\clock_period[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[9]~52_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(9));

-- Location: LCCOMB_X27_Y36_N20
\clock_period[10]~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[10]~54_combout\ = (clock_period(10) & (\clock_period[9]~53\ $ (GND))) # (!clock_period(10) & (!\clock_period[9]~53\ & VCC))
-- \clock_period[10]~55\ = CARRY((clock_period(10) & !\clock_period[9]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(10),
	datad => VCC,
	cin => \clock_period[9]~53\,
	combout => \clock_period[10]~54_combout\,
	cout => \clock_period[10]~55\);

-- Location: FF_X27_Y36_N21
\clock_period[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[10]~54_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(10));

-- Location: LCCOMB_X27_Y36_N22
\clock_period[11]~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[11]~56_combout\ = (clock_period(11) & (!\clock_period[10]~55\)) # (!clock_period(11) & ((\clock_period[10]~55\) # (GND)))
-- \clock_period[11]~57\ = CARRY((!\clock_period[10]~55\) # (!clock_period(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(11),
	datad => VCC,
	cin => \clock_period[10]~55\,
	combout => \clock_period[11]~56_combout\,
	cout => \clock_period[11]~57\);

-- Location: FF_X27_Y36_N23
\clock_period[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[11]~56_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(11));

-- Location: LCCOMB_X27_Y36_N24
\clock_period[12]~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[12]~58_combout\ = (clock_period(12) & (\clock_period[11]~57\ $ (GND))) # (!clock_period(12) & (!\clock_period[11]~57\ & VCC))
-- \clock_period[12]~59\ = CARRY((clock_period(12) & !\clock_period[11]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(12),
	datad => VCC,
	cin => \clock_period[11]~57\,
	combout => \clock_period[12]~58_combout\,
	cout => \clock_period[12]~59\);

-- Location: FF_X27_Y36_N25
\clock_period[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[12]~58_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(12));

-- Location: LCCOMB_X27_Y36_N26
\clock_period[13]~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[13]~60_combout\ = (clock_period(13) & (!\clock_period[12]~59\)) # (!clock_period(13) & ((\clock_period[12]~59\) # (GND)))
-- \clock_period[13]~61\ = CARRY((!\clock_period[12]~59\) # (!clock_period(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(13),
	datad => VCC,
	cin => \clock_period[12]~59\,
	combout => \clock_period[13]~60_combout\,
	cout => \clock_period[13]~61\);

-- Location: FF_X27_Y36_N27
\clock_period[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[13]~60_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(13));

-- Location: LCCOMB_X27_Y36_N28
\clock_period[14]~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[14]~62_combout\ = (clock_period(14) & (\clock_period[13]~61\ $ (GND))) # (!clock_period(14) & (!\clock_period[13]~61\ & VCC))
-- \clock_period[14]~63\ = CARRY((clock_period(14) & !\clock_period[13]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(14),
	datad => VCC,
	cin => \clock_period[13]~61\,
	combout => \clock_period[14]~62_combout\,
	cout => \clock_period[14]~63\);

-- Location: FF_X27_Y36_N29
\clock_period[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[14]~62_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(14));

-- Location: LCCOMB_X27_Y36_N30
\clock_period[15]~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[15]~64_combout\ = (clock_period(15) & (!\clock_period[14]~63\)) # (!clock_period(15) & ((\clock_period[14]~63\) # (GND)))
-- \clock_period[15]~65\ = CARRY((!\clock_period[14]~63\) # (!clock_period(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(15),
	datad => VCC,
	cin => \clock_period[14]~63\,
	combout => \clock_period[15]~64_combout\,
	cout => \clock_period[15]~65\);

-- Location: FF_X27_Y36_N31
\clock_period[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[15]~64_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(15));

-- Location: LCCOMB_X27_Y35_N0
\clock_period[16]~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[16]~66_combout\ = (clock_period(16) & (\clock_period[15]~65\ $ (GND))) # (!clock_period(16) & (!\clock_period[15]~65\ & VCC))
-- \clock_period[16]~67\ = CARRY((clock_period(16) & !\clock_period[15]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(16),
	datad => VCC,
	cin => \clock_period[15]~65\,
	combout => \clock_period[16]~66_combout\,
	cout => \clock_period[16]~67\);

-- Location: FF_X26_Y36_N17
\clock_period[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \clock_period[16]~66_combout\,
	sclr => \clock_period[31]~34_combout\,
	sload => VCC,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(16));

-- Location: LCCOMB_X27_Y35_N2
\clock_period[17]~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[17]~68_combout\ = (clock_period(17) & (!\clock_period[16]~67\)) # (!clock_period(17) & ((\clock_period[16]~67\) # (GND)))
-- \clock_period[17]~69\ = CARRY((!\clock_period[16]~67\) # (!clock_period(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(17),
	datad => VCC,
	cin => \clock_period[16]~67\,
	combout => \clock_period[17]~68_combout\,
	cout => \clock_period[17]~69\);

-- Location: FF_X26_Y36_N23
\clock_period[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \clock_period[17]~68_combout\,
	sclr => \clock_period[31]~34_combout\,
	sload => VCC,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(17));

-- Location: LCCOMB_X27_Y35_N4
\clock_period[18]~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[18]~70_combout\ = (clock_period(18) & (\clock_period[17]~69\ $ (GND))) # (!clock_period(18) & (!\clock_period[17]~69\ & VCC))
-- \clock_period[18]~71\ = CARRY((clock_period(18) & !\clock_period[17]~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(18),
	datad => VCC,
	cin => \clock_period[17]~69\,
	combout => \clock_period[18]~70_combout\,
	cout => \clock_period[18]~71\);

-- Location: FF_X26_Y36_N25
\clock_period[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \clock_period[18]~70_combout\,
	sclr => \clock_period[31]~34_combout\,
	sload => VCC,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(18));

-- Location: LCCOMB_X27_Y35_N6
\clock_period[19]~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[19]~72_combout\ = (clock_period(19) & (!\clock_period[18]~71\)) # (!clock_period(19) & ((\clock_period[18]~71\) # (GND)))
-- \clock_period[19]~73\ = CARRY((!\clock_period[18]~71\) # (!clock_period(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(19),
	datad => VCC,
	cin => \clock_period[18]~71\,
	combout => \clock_period[19]~72_combout\,
	cout => \clock_period[19]~73\);

-- Location: FF_X27_Y35_N7
\clock_period[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[19]~72_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(19));

-- Location: LCCOMB_X27_Y35_N8
\clock_period[20]~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[20]~74_combout\ = (clock_period(20) & (\clock_period[19]~73\ $ (GND))) # (!clock_period(20) & (!\clock_period[19]~73\ & VCC))
-- \clock_period[20]~75\ = CARRY((clock_period(20) & !\clock_period[19]~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(20),
	datad => VCC,
	cin => \clock_period[19]~73\,
	combout => \clock_period[20]~74_combout\,
	cout => \clock_period[20]~75\);

-- Location: FF_X27_Y35_N9
\clock_period[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[20]~74_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(20));

-- Location: LCCOMB_X27_Y35_N10
\clock_period[21]~76\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[21]~76_combout\ = (clock_period(21) & (!\clock_period[20]~75\)) # (!clock_period(21) & ((\clock_period[20]~75\) # (GND)))
-- \clock_period[21]~77\ = CARRY((!\clock_period[20]~75\) # (!clock_period(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(21),
	datad => VCC,
	cin => \clock_period[20]~75\,
	combout => \clock_period[21]~76_combout\,
	cout => \clock_period[21]~77\);

-- Location: FF_X27_Y35_N11
\clock_period[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[21]~76_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(21));

-- Location: LCCOMB_X27_Y35_N12
\clock_period[22]~78\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[22]~78_combout\ = (clock_period(22) & (\clock_period[21]~77\ $ (GND))) # (!clock_period(22) & (!\clock_period[21]~77\ & VCC))
-- \clock_period[22]~79\ = CARRY((clock_period(22) & !\clock_period[21]~77\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(22),
	datad => VCC,
	cin => \clock_period[21]~77\,
	combout => \clock_period[22]~78_combout\,
	cout => \clock_period[22]~79\);

-- Location: FF_X27_Y35_N13
\clock_period[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[22]~78_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(22));

-- Location: LCCOMB_X27_Y35_N14
\clock_period[23]~80\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[23]~80_combout\ = (clock_period(23) & (!\clock_period[22]~79\)) # (!clock_period(23) & ((\clock_period[22]~79\) # (GND)))
-- \clock_period[23]~81\ = CARRY((!\clock_period[22]~79\) # (!clock_period(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(23),
	datad => VCC,
	cin => \clock_period[22]~79\,
	combout => \clock_period[23]~80_combout\,
	cout => \clock_period[23]~81\);

-- Location: FF_X27_Y35_N15
\clock_period[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[23]~80_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(23));

-- Location: LCCOMB_X27_Y35_N16
\clock_period[24]~82\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[24]~82_combout\ = (clock_period(24) & (\clock_period[23]~81\ $ (GND))) # (!clock_period(24) & (!\clock_period[23]~81\ & VCC))
-- \clock_period[24]~83\ = CARRY((clock_period(24) & !\clock_period[23]~81\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(24),
	datad => VCC,
	cin => \clock_period[23]~81\,
	combout => \clock_period[24]~82_combout\,
	cout => \clock_period[24]~83\);

-- Location: FF_X27_Y35_N17
\clock_period[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[24]~82_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(24));

-- Location: LCCOMB_X27_Y35_N18
\clock_period[25]~84\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[25]~84_combout\ = (clock_period(25) & (!\clock_period[24]~83\)) # (!clock_period(25) & ((\clock_period[24]~83\) # (GND)))
-- \clock_period[25]~85\ = CARRY((!\clock_period[24]~83\) # (!clock_period(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(25),
	datad => VCC,
	cin => \clock_period[24]~83\,
	combout => \clock_period[25]~84_combout\,
	cout => \clock_period[25]~85\);

-- Location: FF_X27_Y35_N19
\clock_period[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[25]~84_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(25));

-- Location: LCCOMB_X27_Y35_N20
\clock_period[26]~86\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[26]~86_combout\ = (clock_period(26) & (\clock_period[25]~85\ $ (GND))) # (!clock_period(26) & (!\clock_period[25]~85\ & VCC))
-- \clock_period[26]~87\ = CARRY((clock_period(26) & !\clock_period[25]~85\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(26),
	datad => VCC,
	cin => \clock_period[25]~85\,
	combout => \clock_period[26]~86_combout\,
	cout => \clock_period[26]~87\);

-- Location: FF_X27_Y35_N21
\clock_period[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[26]~86_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(26));

-- Location: LCCOMB_X27_Y35_N22
\clock_period[27]~88\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[27]~88_combout\ = (clock_period(27) & (!\clock_period[26]~87\)) # (!clock_period(27) & ((\clock_period[26]~87\) # (GND)))
-- \clock_period[27]~89\ = CARRY((!\clock_period[26]~87\) # (!clock_period(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(27),
	datad => VCC,
	cin => \clock_period[26]~87\,
	combout => \clock_period[27]~88_combout\,
	cout => \clock_period[27]~89\);

-- Location: FF_X27_Y35_N23
\clock_period[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[27]~88_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(27));

-- Location: LCCOMB_X27_Y35_N24
\clock_period[28]~90\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[28]~90_combout\ = (clock_period(28) & (\clock_period[27]~89\ $ (GND))) # (!clock_period(28) & (!\clock_period[27]~89\ & VCC))
-- \clock_period[28]~91\ = CARRY((clock_period(28) & !\clock_period[27]~89\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(28),
	datad => VCC,
	cin => \clock_period[27]~89\,
	combout => \clock_period[28]~90_combout\,
	cout => \clock_period[28]~91\);

-- Location: FF_X27_Y35_N25
\clock_period[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[28]~90_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(28));

-- Location: LCCOMB_X27_Y35_N26
\clock_period[29]~92\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[29]~92_combout\ = (clock_period(29) & (!\clock_period[28]~91\)) # (!clock_period(29) & ((\clock_period[28]~91\) # (GND)))
-- \clock_period[29]~93\ = CARRY((!\clock_period[28]~91\) # (!clock_period(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(29),
	datad => VCC,
	cin => \clock_period[28]~91\,
	combout => \clock_period[29]~92_combout\,
	cout => \clock_period[29]~93\);

-- Location: FF_X27_Y35_N27
\clock_period[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[29]~92_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(29));

-- Location: LCCOMB_X27_Y35_N28
\clock_period[30]~94\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[30]~94_combout\ = (clock_period(30) & (\clock_period[29]~93\ $ (GND))) # (!clock_period(30) & (!\clock_period[29]~93\ & VCC))
-- \clock_period[30]~95\ = CARRY((clock_period(30) & !\clock_period[29]~93\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clock_period(30),
	datad => VCC,
	cin => \clock_period[29]~93\,
	combout => \clock_period[30]~94_combout\,
	cout => \clock_period[30]~95\);

-- Location: FF_X27_Y35_N29
\clock_period[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[30]~94_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(30));

-- Location: LCCOMB_X27_Y35_N30
\clock_period[31]~96\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \clock_period[31]~96_combout\ = clock_period(31) $ (\clock_period[30]~95\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(31),
	cin => \clock_period[30]~95\,
	combout => \clock_period[31]~96_combout\);

-- Location: FF_X27_Y35_N31
\clock_period[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \clock_period[31]~96_combout\,
	sclr => \clock_period[31]~34_combout\,
	ena => \clock_period[31]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clock_period(31));

-- Location: LCCOMB_X26_Y36_N12
\Equal0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~9_combout\ = (clock_period(29)) # ((clock_period(31)) # ((clock_period(28)) # (clock_period(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(29),
	datab => clock_period(31),
	datac => clock_period(28),
	datad => clock_period(30),
	combout => \Equal0~9_combout\);

-- Location: LCCOMB_X26_Y36_N6
\Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (clock_period(7)) # ((clock_period(4)) # ((clock_period(5)) # (!clock_period(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(7),
	datab => clock_period(4),
	datac => clock_period(5),
	datad => clock_period(6),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X26_Y36_N8
\Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (((!clock_period(3)) # (!clock_period(1))) # (!clock_period(0))) # (!clock_period(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(2),
	datab => clock_period(0),
	datac => clock_period(1),
	datad => clock_period(3),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X26_Y36_N4
\Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (clock_period(10)) # (((clock_period(11)) # (!clock_period(9))) # (!clock_period(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(10),
	datab => clock_period(8),
	datac => clock_period(11),
	datad => clock_period(9),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X26_Y36_N2
\Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = ((clock_period(13)) # ((clock_period(12)) # (!clock_period(14)))) # (!clock_period(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(15),
	datab => clock_period(13),
	datac => clock_period(12),
	datad => clock_period(14),
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X26_Y36_N20
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

-- Location: LCCOMB_X26_Y36_N14
\Equal0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~8_combout\ = (clock_period(25)) # ((clock_period(24)) # ((clock_period(26)) # (clock_period(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(25),
	datab => clock_period(24),
	datac => clock_period(26),
	datad => clock_period(27),
	combout => \Equal0~8_combout\);

-- Location: LCCOMB_X26_Y36_N10
\Equal0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (clock_period(17)) # (clock_period(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => clock_period(17),
	datad => clock_period(16),
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X26_Y36_N28
\Equal0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (clock_period(23)) # ((clock_period(21)) # ((clock_period(22)) # (clock_period(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clock_period(23),
	datab => clock_period(21),
	datac => clock_period(22),
	datad => clock_period(20),
	combout => \Equal0~6_combout\);

-- Location: LCCOMB_X26_Y36_N24
\Equal0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = (\Equal0~5_combout\) # ((clock_period(19)) # ((clock_period(18)) # (\Equal0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~5_combout\,
	datab => clock_period(19),
	datac => clock_period(18),
	datad => \Equal0~6_combout\,
	combout => \Equal0~7_combout\);

-- Location: LCCOMB_X26_Y36_N18
\Equal0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~10_combout\ = (\Equal0~9_combout\) # ((\Equal0~4_combout\) # ((\Equal0~8_combout\) # (\Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~9_combout\,
	datab => \Equal0~4_combout\,
	datac => \Equal0~8_combout\,
	datad => \Equal0~7_combout\,
	combout => \Equal0~10_combout\);

-- Location: LCCOMB_X26_Y36_N0
\ms_count[17]~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[17]~35_combout\ = (\reset~input_o\) # ((\btn_a~input_o\ & ((!\Equal0~10_combout\) # (!\btn_prev~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_a~input_o\,
	datab => \reset~input_o\,
	datac => \btn_prev~q\,
	datad => \Equal0~10_combout\,
	combout => \ms_count[17]~35_combout\);

-- Location: FF_X25_Y36_N1
\ms_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[0]~32_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(0));

-- Location: LCCOMB_X25_Y36_N2
\ms_count[1]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[1]~36_combout\ = (ms_count(1) & (!\ms_count[0]~33\)) # (!ms_count(1) & ((\ms_count[0]~33\) # (GND)))
-- \ms_count[1]~37\ = CARRY((!\ms_count[0]~33\) # (!ms_count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(1),
	datad => VCC,
	cin => \ms_count[0]~33\,
	combout => \ms_count[1]~36_combout\,
	cout => \ms_count[1]~37\);

-- Location: FF_X25_Y36_N3
\ms_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[1]~36_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(1));

-- Location: LCCOMB_X25_Y36_N4
\ms_count[2]~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[2]~38_combout\ = (ms_count(2) & (\ms_count[1]~37\ $ (GND))) # (!ms_count(2) & (!\ms_count[1]~37\ & VCC))
-- \ms_count[2]~39\ = CARRY((ms_count(2) & !\ms_count[1]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(2),
	datad => VCC,
	cin => \ms_count[1]~37\,
	combout => \ms_count[2]~38_combout\,
	cout => \ms_count[2]~39\);

-- Location: FF_X25_Y36_N5
\ms_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[2]~38_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(2));

-- Location: LCCOMB_X25_Y36_N6
\ms_count[3]~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[3]~40_combout\ = (ms_count(3) & (!\ms_count[2]~39\)) # (!ms_count(3) & ((\ms_count[2]~39\) # (GND)))
-- \ms_count[3]~41\ = CARRY((!\ms_count[2]~39\) # (!ms_count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ms_count(3),
	datad => VCC,
	cin => \ms_count[2]~39\,
	combout => \ms_count[3]~40_combout\,
	cout => \ms_count[3]~41\);

-- Location: FF_X25_Y36_N7
\ms_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[3]~40_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(3));

-- Location: LCCOMB_X25_Y36_N8
\ms_count[4]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[4]~42_combout\ = (ms_count(4) & (\ms_count[3]~41\ $ (GND))) # (!ms_count(4) & (!\ms_count[3]~41\ & VCC))
-- \ms_count[4]~43\ = CARRY((ms_count(4) & !\ms_count[3]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(4),
	datad => VCC,
	cin => \ms_count[3]~41\,
	combout => \ms_count[4]~42_combout\,
	cout => \ms_count[4]~43\);

-- Location: FF_X25_Y36_N9
\ms_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[4]~42_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(4));

-- Location: LCCOMB_X25_Y36_N10
\ms_count[5]~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[5]~44_combout\ = (ms_count(5) & (!\ms_count[4]~43\)) # (!ms_count(5) & ((\ms_count[4]~43\) # (GND)))
-- \ms_count[5]~45\ = CARRY((!\ms_count[4]~43\) # (!ms_count(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ms_count(5),
	datad => VCC,
	cin => \ms_count[4]~43\,
	combout => \ms_count[5]~44_combout\,
	cout => \ms_count[5]~45\);

-- Location: FF_X25_Y36_N11
\ms_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[5]~44_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(5));

-- Location: LCCOMB_X25_Y36_N12
\ms_count[6]~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[6]~46_combout\ = (ms_count(6) & (\ms_count[5]~45\ $ (GND))) # (!ms_count(6) & (!\ms_count[5]~45\ & VCC))
-- \ms_count[6]~47\ = CARRY((ms_count(6) & !\ms_count[5]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ms_count(6),
	datad => VCC,
	cin => \ms_count[5]~45\,
	combout => \ms_count[6]~46_combout\,
	cout => \ms_count[6]~47\);

-- Location: FF_X25_Y36_N13
\ms_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[6]~46_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(6));

-- Location: LCCOMB_X25_Y36_N14
\ms_count[7]~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[7]~48_combout\ = (ms_count(7) & (!\ms_count[6]~47\)) # (!ms_count(7) & ((\ms_count[6]~47\) # (GND)))
-- \ms_count[7]~49\ = CARRY((!\ms_count[6]~47\) # (!ms_count(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(7),
	datad => VCC,
	cin => \ms_count[6]~47\,
	combout => \ms_count[7]~48_combout\,
	cout => \ms_count[7]~49\);

-- Location: FF_X25_Y36_N15
\ms_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[7]~48_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(7));

-- Location: LCCOMB_X25_Y36_N16
\ms_count[8]~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[8]~50_combout\ = (ms_count(8) & (\ms_count[7]~49\ $ (GND))) # (!ms_count(8) & (!\ms_count[7]~49\ & VCC))
-- \ms_count[8]~51\ = CARRY((ms_count(8) & !\ms_count[7]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(8),
	datad => VCC,
	cin => \ms_count[7]~49\,
	combout => \ms_count[8]~50_combout\,
	cout => \ms_count[8]~51\);

-- Location: FF_X25_Y36_N17
\ms_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[8]~50_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(8));

-- Location: LCCOMB_X25_Y36_N18
\ms_count[9]~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[9]~52_combout\ = (ms_count(9) & (!\ms_count[8]~51\)) # (!ms_count(9) & ((\ms_count[8]~51\) # (GND)))
-- \ms_count[9]~53\ = CARRY((!\ms_count[8]~51\) # (!ms_count(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(9),
	datad => VCC,
	cin => \ms_count[8]~51\,
	combout => \ms_count[9]~52_combout\,
	cout => \ms_count[9]~53\);

-- Location: FF_X25_Y36_N19
\ms_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[9]~52_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(9));

-- Location: LCCOMB_X25_Y36_N20
\ms_count[10]~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[10]~54_combout\ = (ms_count(10) & (\ms_count[9]~53\ $ (GND))) # (!ms_count(10) & (!\ms_count[9]~53\ & VCC))
-- \ms_count[10]~55\ = CARRY((ms_count(10) & !\ms_count[9]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(10),
	datad => VCC,
	cin => \ms_count[9]~53\,
	combout => \ms_count[10]~54_combout\,
	cout => \ms_count[10]~55\);

-- Location: FF_X25_Y36_N21
\ms_count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[10]~54_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(10));

-- Location: LCCOMB_X25_Y36_N22
\ms_count[11]~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[11]~56_combout\ = (ms_count(11) & (!\ms_count[10]~55\)) # (!ms_count(11) & ((\ms_count[10]~55\) # (GND)))
-- \ms_count[11]~57\ = CARRY((!\ms_count[10]~55\) # (!ms_count(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ms_count(11),
	datad => VCC,
	cin => \ms_count[10]~55\,
	combout => \ms_count[11]~56_combout\,
	cout => \ms_count[11]~57\);

-- Location: FF_X25_Y36_N23
\ms_count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[11]~56_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(11));

-- Location: LCCOMB_X25_Y36_N24
\ms_count[12]~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[12]~58_combout\ = (ms_count(12) & (\ms_count[11]~57\ $ (GND))) # (!ms_count(12) & (!\ms_count[11]~57\ & VCC))
-- \ms_count[12]~59\ = CARRY((ms_count(12) & !\ms_count[11]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(12),
	datad => VCC,
	cin => \ms_count[11]~57\,
	combout => \ms_count[12]~58_combout\,
	cout => \ms_count[12]~59\);

-- Location: FF_X25_Y36_N25
\ms_count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[12]~58_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(12));

-- Location: LCCOMB_X25_Y36_N26
\ms_count[13]~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[13]~60_combout\ = (ms_count(13) & (!\ms_count[12]~59\)) # (!ms_count(13) & ((\ms_count[12]~59\) # (GND)))
-- \ms_count[13]~61\ = CARRY((!\ms_count[12]~59\) # (!ms_count(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ms_count(13),
	datad => VCC,
	cin => \ms_count[12]~59\,
	combout => \ms_count[13]~60_combout\,
	cout => \ms_count[13]~61\);

-- Location: FF_X25_Y36_N27
\ms_count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[13]~60_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(13));

-- Location: LCCOMB_X25_Y36_N28
\ms_count[14]~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[14]~62_combout\ = (ms_count(14) & (\ms_count[13]~61\ $ (GND))) # (!ms_count(14) & (!\ms_count[13]~61\ & VCC))
-- \ms_count[14]~63\ = CARRY((ms_count(14) & !\ms_count[13]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(14),
	datad => VCC,
	cin => \ms_count[13]~61\,
	combout => \ms_count[14]~62_combout\,
	cout => \ms_count[14]~63\);

-- Location: FF_X25_Y36_N29
\ms_count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[14]~62_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(14));

-- Location: LCCOMB_X25_Y36_N30
\ms_count[15]~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[15]~64_combout\ = (ms_count(15) & (!\ms_count[14]~63\)) # (!ms_count(15) & ((\ms_count[14]~63\) # (GND)))
-- \ms_count[15]~65\ = CARRY((!\ms_count[14]~63\) # (!ms_count(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ms_count(15),
	datad => VCC,
	cin => \ms_count[14]~63\,
	combout => \ms_count[15]~64_combout\,
	cout => \ms_count[15]~65\);

-- Location: FF_X25_Y36_N31
\ms_count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[15]~64_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(15));

-- Location: LCCOMB_X25_Y35_N0
\ms_count[16]~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[16]~66_combout\ = (ms_count(16) & (\ms_count[15]~65\ $ (GND))) # (!ms_count(16) & (!\ms_count[15]~65\ & VCC))
-- \ms_count[16]~67\ = CARRY((ms_count(16) & !\ms_count[15]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(16),
	datad => VCC,
	cin => \ms_count[15]~65\,
	combout => \ms_count[16]~66_combout\,
	cout => \ms_count[16]~67\);

-- Location: FF_X25_Y35_N1
\ms_count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[16]~66_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(16));

-- Location: LCCOMB_X25_Y35_N2
\ms_count[17]~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[17]~68_combout\ = (ms_count(17) & (!\ms_count[16]~67\)) # (!ms_count(17) & ((\ms_count[16]~67\) # (GND)))
-- \ms_count[17]~69\ = CARRY((!\ms_count[16]~67\) # (!ms_count(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(17),
	datad => VCC,
	cin => \ms_count[16]~67\,
	combout => \ms_count[17]~68_combout\,
	cout => \ms_count[17]~69\);

-- Location: FF_X25_Y35_N3
\ms_count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[17]~68_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(17));

-- Location: LCCOMB_X25_Y35_N4
\ms_count[18]~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[18]~70_combout\ = (ms_count(18) & (\ms_count[17]~69\ $ (GND))) # (!ms_count(18) & (!\ms_count[17]~69\ & VCC))
-- \ms_count[18]~71\ = CARRY((ms_count(18) & !\ms_count[17]~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(18),
	datad => VCC,
	cin => \ms_count[17]~69\,
	combout => \ms_count[18]~70_combout\,
	cout => \ms_count[18]~71\);

-- Location: FF_X25_Y35_N5
\ms_count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[18]~70_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(18));

-- Location: LCCOMB_X25_Y35_N6
\ms_count[19]~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[19]~72_combout\ = (ms_count(19) & (!\ms_count[18]~71\)) # (!ms_count(19) & ((\ms_count[18]~71\) # (GND)))
-- \ms_count[19]~73\ = CARRY((!\ms_count[18]~71\) # (!ms_count(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ms_count(19),
	datad => VCC,
	cin => \ms_count[18]~71\,
	combout => \ms_count[19]~72_combout\,
	cout => \ms_count[19]~73\);

-- Location: FF_X25_Y35_N7
\ms_count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[19]~72_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(19));

-- Location: LCCOMB_X25_Y35_N8
\ms_count[20]~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[20]~74_combout\ = (ms_count(20) & (\ms_count[19]~73\ $ (GND))) # (!ms_count(20) & (!\ms_count[19]~73\ & VCC))
-- \ms_count[20]~75\ = CARRY((ms_count(20) & !\ms_count[19]~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(20),
	datad => VCC,
	cin => \ms_count[19]~73\,
	combout => \ms_count[20]~74_combout\,
	cout => \ms_count[20]~75\);

-- Location: FF_X25_Y35_N9
\ms_count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[20]~74_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(20));

-- Location: LCCOMB_X25_Y35_N10
\ms_count[21]~76\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[21]~76_combout\ = (ms_count(21) & (!\ms_count[20]~75\)) # (!ms_count(21) & ((\ms_count[20]~75\) # (GND)))
-- \ms_count[21]~77\ = CARRY((!\ms_count[20]~75\) # (!ms_count(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ms_count(21),
	datad => VCC,
	cin => \ms_count[20]~75\,
	combout => \ms_count[21]~76_combout\,
	cout => \ms_count[21]~77\);

-- Location: FF_X25_Y35_N11
\ms_count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[21]~76_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(21));

-- Location: LCCOMB_X25_Y35_N12
\ms_count[22]~78\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[22]~78_combout\ = (ms_count(22) & (\ms_count[21]~77\ $ (GND))) # (!ms_count(22) & (!\ms_count[21]~77\ & VCC))
-- \ms_count[22]~79\ = CARRY((ms_count(22) & !\ms_count[21]~77\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ms_count(22),
	datad => VCC,
	cin => \ms_count[21]~77\,
	combout => \ms_count[22]~78_combout\,
	cout => \ms_count[22]~79\);

-- Location: FF_X25_Y35_N13
\ms_count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[22]~78_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(22));

-- Location: LCCOMB_X25_Y35_N14
\ms_count[23]~80\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[23]~80_combout\ = (ms_count(23) & (!\ms_count[22]~79\)) # (!ms_count(23) & ((\ms_count[22]~79\) # (GND)))
-- \ms_count[23]~81\ = CARRY((!\ms_count[22]~79\) # (!ms_count(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(23),
	datad => VCC,
	cin => \ms_count[22]~79\,
	combout => \ms_count[23]~80_combout\,
	cout => \ms_count[23]~81\);

-- Location: FF_X25_Y35_N15
\ms_count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[23]~80_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(23));

-- Location: LCCOMB_X25_Y35_N16
\ms_count[24]~82\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[24]~82_combout\ = (ms_count(24) & (\ms_count[23]~81\ $ (GND))) # (!ms_count(24) & (!\ms_count[23]~81\ & VCC))
-- \ms_count[24]~83\ = CARRY((ms_count(24) & !\ms_count[23]~81\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(24),
	datad => VCC,
	cin => \ms_count[23]~81\,
	combout => \ms_count[24]~82_combout\,
	cout => \ms_count[24]~83\);

-- Location: FF_X25_Y35_N17
\ms_count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[24]~82_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(24));

-- Location: LCCOMB_X25_Y35_N18
\ms_count[25]~84\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[25]~84_combout\ = (ms_count(25) & (!\ms_count[24]~83\)) # (!ms_count(25) & ((\ms_count[24]~83\) # (GND)))
-- \ms_count[25]~85\ = CARRY((!\ms_count[24]~83\) # (!ms_count(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(25),
	datad => VCC,
	cin => \ms_count[24]~83\,
	combout => \ms_count[25]~84_combout\,
	cout => \ms_count[25]~85\);

-- Location: FF_X25_Y35_N19
\ms_count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[25]~84_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(25));

-- Location: LCCOMB_X25_Y35_N20
\ms_count[26]~86\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[26]~86_combout\ = (ms_count(26) & (\ms_count[25]~85\ $ (GND))) # (!ms_count(26) & (!\ms_count[25]~85\ & VCC))
-- \ms_count[26]~87\ = CARRY((ms_count(26) & !\ms_count[25]~85\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(26),
	datad => VCC,
	cin => \ms_count[25]~85\,
	combout => \ms_count[26]~86_combout\,
	cout => \ms_count[26]~87\);

-- Location: FF_X25_Y35_N21
\ms_count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[26]~86_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(26));

-- Location: LCCOMB_X25_Y35_N22
\ms_count[27]~88\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[27]~88_combout\ = (ms_count(27) & (!\ms_count[26]~87\)) # (!ms_count(27) & ((\ms_count[26]~87\) # (GND)))
-- \ms_count[27]~89\ = CARRY((!\ms_count[26]~87\) # (!ms_count(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ms_count(27),
	datad => VCC,
	cin => \ms_count[26]~87\,
	combout => \ms_count[27]~88_combout\,
	cout => \ms_count[27]~89\);

-- Location: FF_X25_Y35_N23
\ms_count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[27]~88_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(27));

-- Location: LCCOMB_X25_Y35_N24
\ms_count[28]~90\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[28]~90_combout\ = (ms_count(28) & (\ms_count[27]~89\ $ (GND))) # (!ms_count(28) & (!\ms_count[27]~89\ & VCC))
-- \ms_count[28]~91\ = CARRY((ms_count(28) & !\ms_count[27]~89\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(28),
	datad => VCC,
	cin => \ms_count[27]~89\,
	combout => \ms_count[28]~90_combout\,
	cout => \ms_count[28]~91\);

-- Location: FF_X25_Y35_N25
\ms_count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[28]~90_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(28));

-- Location: LCCOMB_X25_Y35_N26
\ms_count[29]~92\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[29]~92_combout\ = (ms_count(29) & (!\ms_count[28]~91\)) # (!ms_count(29) & ((\ms_count[28]~91\) # (GND)))
-- \ms_count[29]~93\ = CARRY((!\ms_count[28]~91\) # (!ms_count(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ms_count(29),
	datad => VCC,
	cin => \ms_count[28]~91\,
	combout => \ms_count[29]~92_combout\,
	cout => \ms_count[29]~93\);

-- Location: FF_X25_Y35_N27
\ms_count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[29]~92_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(29));

-- Location: LCCOMB_X25_Y35_N28
\ms_count[30]~94\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[30]~94_combout\ = (ms_count(30) & (\ms_count[29]~93\ $ (GND))) # (!ms_count(30) & (!\ms_count[29]~93\ & VCC))
-- \ms_count[30]~95\ = CARRY((ms_count(30) & !\ms_count[29]~93\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ms_count(30),
	datad => VCC,
	cin => \ms_count[29]~93\,
	combout => \ms_count[30]~94_combout\,
	cout => \ms_count[30]~95\);

-- Location: FF_X25_Y35_N29
\ms_count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[30]~94_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(30));

-- Location: LCCOMB_X25_Y35_N30
\ms_count[31]~96\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ms_count[31]~96_combout\ = ms_count(31) $ (\ms_count[30]~95\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ms_count(31),
	cin => \ms_count[30]~95\,
	combout => \ms_count[31]~96_combout\);

-- Location: FF_X25_Y35_N31
\ms_count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \ms_count[31]~96_combout\,
	sclr => \ms_count[17]~34_combout\,
	ena => \ms_count[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ms_count(31));

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

ww_milissegundos(0) <= \milissegundos[0]~output_o\;

ww_milissegundos(1) <= \milissegundos[1]~output_o\;

ww_milissegundos(2) <= \milissegundos[2]~output_o\;

ww_milissegundos(3) <= \milissegundos[3]~output_o\;

ww_milissegundos(4) <= \milissegundos[4]~output_o\;

ww_milissegundos(5) <= \milissegundos[5]~output_o\;

ww_milissegundos(6) <= \milissegundos[6]~output_o\;

ww_milissegundos(7) <= \milissegundos[7]~output_o\;

ww_milissegundos(8) <= \milissegundos[8]~output_o\;

ww_milissegundos(9) <= \milissegundos[9]~output_o\;

ww_milissegundos(10) <= \milissegundos[10]~output_o\;

ww_milissegundos(11) <= \milissegundos[11]~output_o\;

ww_milissegundos(12) <= \milissegundos[12]~output_o\;

ww_milissegundos(13) <= \milissegundos[13]~output_o\;

ww_milissegundos(14) <= \milissegundos[14]~output_o\;

ww_milissegundos(15) <= \milissegundos[15]~output_o\;

ww_milissegundos(16) <= \milissegundos[16]~output_o\;

ww_milissegundos(17) <= \milissegundos[17]~output_o\;

ww_milissegundos(18) <= \milissegundos[18]~output_o\;

ww_milissegundos(19) <= \milissegundos[19]~output_o\;

ww_milissegundos(20) <= \milissegundos[20]~output_o\;

ww_milissegundos(21) <= \milissegundos[21]~output_o\;

ww_milissegundos(22) <= \milissegundos[22]~output_o\;

ww_milissegundos(23) <= \milissegundos[23]~output_o\;

ww_milissegundos(24) <= \milissegundos[24]~output_o\;

ww_milissegundos(25) <= \milissegundos[25]~output_o\;

ww_milissegundos(26) <= \milissegundos[26]~output_o\;

ww_milissegundos(27) <= \milissegundos[27]~output_o\;

ww_milissegundos(28) <= \milissegundos[28]~output_o\;

ww_milissegundos(29) <= \milissegundos[29]~output_o\;

ww_milissegundos(30) <= \milissegundos[30]~output_o\;

ww_milissegundos(31) <= \milissegundos[31]~output_o\;
END structure;


