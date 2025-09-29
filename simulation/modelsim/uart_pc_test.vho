-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "09/29/2025 11:30:49"

-- 
-- Device: Altera EP2C70F896C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	uart_pc_test IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	rx : IN std_logic;
	btn : IN std_logic;
	led : OUT std_logic_vector(7 DOWNTO 0);
	tx : OUT std_logic;
	tx_full : OUT std_logic;
	rx_empty : OUT std_logic
	);
END uart_pc_test;

-- Design Ports Information
-- led[0]	=>  Location: PIN_AJ6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[1]	=>  Location: PIN_AK5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[2]	=>  Location: PIN_AJ5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[3]	=>  Location: PIN_AJ4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[4]	=>  Location: PIN_AK3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[5]	=>  Location: PIN_AH4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[6]	=>  Location: PIN_AJ3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[7]	=>  Location: PIN_AJ2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- tx	=>  Location: PIN_E21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- tx_full	=>  Location: PIN_AD8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- rx_empty	=>  Location: PIN_AJ17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_AD15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_L8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- btn	=>  Location: PIN_U29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- rx	=>  Location: PIN_D21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF uart_pc_test IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_rx : std_logic;
SIGNAL ww_btn : std_logic;
SIGNAL ww_led : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_tx : std_logic;
SIGNAL ww_tx_full : std_logic;
SIGNAL ww_rx_empty : std_logic;
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \btn_db_unit|Add0~4_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~8_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~0_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~6_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~12_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~8_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~9_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~18_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~11_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~13_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~22_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~15_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|Mux5~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|state_reg.start~regout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|Add0~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|s_reg[1]~3_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|s_reg[3]~6_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|Add0~1_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|r_next[6]~1_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector1~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector24~0_combout\ : std_logic;
SIGNAL \btn_db_unit|q_reg[13]~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector22~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector17~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector15~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector9~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector6~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector5~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|n_reg[2]~1_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|Selector1~4_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|Selector1~5_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|Selector1~6_combout\ : std_logic;
SIGNAL \btn_db_unit|state_reg.WAIT1~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Add0~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Add0~1_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|s_reg[0]~7_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~18feeder_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~22feeder_combout\ : std_logic;
SIGNAL \rx~combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|Selector0~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|state_reg.idle~regout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|Add1~0_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~9\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~11\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~13\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~14_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~15\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~16_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|r_next[8]~0_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~10_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Equal0~0_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|r_next[0]~3_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~1\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~2_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~3\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~5\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~7\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~8_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Add0~4_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|r_next[2]~2_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Equal0~1_combout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|Equal0~2_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|Selector1~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|Selector3~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|state_reg.stop~regout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|s_reg[1]~2_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|s_reg[1]~4_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|s_reg[1]~8_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|s_reg[0]~5_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|s_reg[2]~7_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|Equal2~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|s_reg[0]~1_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|s_reg[0]~9_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|s_reg[1]~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|Selector1~2_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|n_reg[2]~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|n_reg[0]~3_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|n_reg[1]~2_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|Selector1~1_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|Selector1~3_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|Selector2~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|state_reg.data~regout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|b_reg[0]~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|b_reg[6]~feeder_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|b_reg[5]~feeder_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|b_reg[4]~feeder_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|b_reg[3]~feeder_combout\ : std_logic;
SIGNAL \uart_unit|uart_rx_unit|b_reg[1]~feeder_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|w_ptr_reg[0]~1_combout\ : std_logic;
SIGNAL \btn~combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector21~0_combout\ : std_logic;
SIGNAL \btn_db_unit|q_reg[13]~1_combout\ : std_logic;
SIGNAL \btn_db_unit|Equal0~6_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector3~1_combout\ : std_logic;
SIGNAL \btn_db_unit|state_reg.WAIT1~1_combout\ : std_logic;
SIGNAL \btn_db_unit|state_reg.WAIT1~regout\ : std_logic;
SIGNAL \btn_db_unit|Selector23~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~1\ : std_logic;
SIGNAL \btn_db_unit|Add0~3\ : std_logic;
SIGNAL \btn_db_unit|Add0~5\ : std_logic;
SIGNAL \btn_db_unit|Add0~6_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~2_combout\ : std_logic;
SIGNAL \btn_db_unit|Equal0~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector14~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector20~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~7\ : std_logic;
SIGNAL \btn_db_unit|Add0~9\ : std_logic;
SIGNAL \btn_db_unit|Add0~10_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector19~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~11\ : std_logic;
SIGNAL \btn_db_unit|Add0~12_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector18~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~13\ : std_logic;
SIGNAL \btn_db_unit|Add0~15\ : std_logic;
SIGNAL \btn_db_unit|Add0~16_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector16~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~17\ : std_logic;
SIGNAL \btn_db_unit|Add0~19\ : std_logic;
SIGNAL \btn_db_unit|Add0~20_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~18_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector13~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~21\ : std_logic;
SIGNAL \btn_db_unit|Add0~22_combout\ : std_logic;
SIGNAL \btn_db_unit|Equal0~2_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector12~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~23\ : std_logic;
SIGNAL \btn_db_unit|Add0~24_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector10~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~25\ : std_logic;
SIGNAL \btn_db_unit|Add0~26_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector11~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~27\ : std_logic;
SIGNAL \btn_db_unit|Add0~28_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~29\ : std_logic;
SIGNAL \btn_db_unit|Add0~30_combout\ : std_logic;
SIGNAL \btn_db_unit|Equal0~3_combout\ : std_logic;
SIGNAL \btn_db_unit|Equal0~4_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~31\ : std_logic;
SIGNAL \btn_db_unit|Add0~32_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector8~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~33\ : std_logic;
SIGNAL \btn_db_unit|Add0~35\ : std_logic;
SIGNAL \btn_db_unit|Add0~37\ : std_logic;
SIGNAL \btn_db_unit|Add0~38_combout\ : std_logic;
SIGNAL \btn_db_unit|Equal0~7_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector4~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~39\ : std_logic;
SIGNAL \btn_db_unit|Add0~40_combout\ : std_logic;
SIGNAL \btn_db_unit|Equal0~8_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector2~1_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector0~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector0~1_combout\ : std_logic;
SIGNAL \btn_db_unit|state_reg.HIGH~regout\ : std_logic;
SIGNAL \btn_db_unit|Selector2~2_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector2~3_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector2~4_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector2~5_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector2~6_combout\ : std_logic;
SIGNAL \btn_db_unit|state_reg.LOW~regout\ : std_logic;
SIGNAL \btn_db_unit|Selector3~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector1~1_combout\ : std_logic;
SIGNAL \btn_db_unit|state_reg.WAIT0~regout\ : std_logic;
SIGNAL \btn_db_unit|Selector7~0_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~34_combout\ : std_logic;
SIGNAL \btn_db_unit|Add0~36_combout\ : std_logic;
SIGNAL \btn_db_unit|Equal0~5_combout\ : std_logic;
SIGNAL \btn_db_unit|Selector2~0_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|w_ptr_reg[1]~0_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|r_ptr_reg[0]~1_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|r_ptr_reg[0]~0_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|Add0~0_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|Mux4~0_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|Mux4~1_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|Mux5~2_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|empty_reg~regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|Mux5~1_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|full_reg~regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~51_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~24_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|Add1~0_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~48_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~16_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~50_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~0_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~32_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~33_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~17_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~25_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~1_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~34_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~35_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~49_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~10_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~26_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~2_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~36_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~37_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~3_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~38_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~19_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~27_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~39_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~28feeder_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~28_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~12_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~4_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~20feeder_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~20_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~40_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~41_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~5_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~42_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~21_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~29_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~43_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~30feeder_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~30_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~6_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~44_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~14_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~45_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~31_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~23_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~7_regout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~46_combout\ : std_logic;
SIGNAL \uart_unit|fifo_rx_unit|array_reg~47_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \btn_db_unit|Add0~14_combout\ : std_logic;
SIGNAL \btn_db_unit|Equal0~1_combout\ : std_logic;
SIGNAL \btn_db_unit|db_tick~0_combout\ : std_logic;
SIGNAL \btn_db_unit|db_tick~1_combout\ : std_logic;
SIGNAL \btn_db_unit|db_tick~2_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|n_reg[2]~1_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|n_reg[0]~4_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|n_reg[1]~3_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Add1~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|n_reg[2]~2_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|n_reg[2]~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector1~2_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector1~1_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector1~3_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|state_reg.IDLE~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|state_reg.IDLE~regout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector3~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector3~1_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|state_reg.DATA~regout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector4~1_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector2~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector2~1_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|state_reg.START~regout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|s_reg[0]~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|s_reg[2]~1_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|s_reg[2]~2_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|s_reg[2]~3_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|s_reg[2]~5_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|s_reg[3]~4_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|s_reg[1]~6_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Equal1~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector1~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector4~2_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|state_reg.STOP~regout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|b_reg[3]~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector9~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|b_reg[7]~2_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector10~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|b_reg[3]~1_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector11~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector12~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector13~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector14~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector15~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector16~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|Selector0~0_combout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|tx_reg~regout\ : std_logic;
SIGNAL \uart_unit|baud_gen_unit|r_reg\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \uart_unit|uart_rx_unit|s_reg\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \uart_unit|uart_rx_unit|n_reg\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \uart_unit|uart_rx_unit|b_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \uart_unit|fifo_rx_unit|w_ptr_reg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \uart_unit|fifo_rx_unit|r_ptr_reg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \uart_unit|uart_tx_unit|s_reg\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \uart_unit|uart_tx_unit|n_reg\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \uart_unit|uart_tx_unit|b_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \btn_db_unit|q_reg\ : std_logic_vector(20 DOWNTO 0);
SIGNAL \uart_unit|fifo_rx_unit|ALT_INV_empty_reg~regout\ : std_logic;
SIGNAL \uart_unit|uart_tx_unit|ALT_INV_tx_reg~regout\ : std_logic;
SIGNAL \ALT_INV_reset~combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_rx <= rx;
ww_btn <= btn;
led <= ww_led;
tx <= ww_tx;
tx_full <= ww_tx_full;
rx_empty <= ww_rx_empty;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\uart_unit|fifo_rx_unit|ALT_INV_empty_reg~regout\ <= NOT \uart_unit|fifo_rx_unit|empty_reg~regout\;
\uart_unit|uart_tx_unit|ALT_INV_tx_reg~regout\ <= NOT \uart_unit|uart_tx_unit|tx_reg~regout\;
\ALT_INV_reset~combout\ <= NOT \reset~combout\;

-- Location: LCCOMB_X41_Y29_N16
\btn_db_unit|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~4_combout\ = (\btn_db_unit|q_reg\(2) & ((GND) # (!\btn_db_unit|Add0~3\))) # (!\btn_db_unit|q_reg\(2) & (\btn_db_unit|Add0~3\ $ (GND)))
-- \btn_db_unit|Add0~5\ = CARRY((\btn_db_unit|q_reg\(2)) # (!\btn_db_unit|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|q_reg\(2),
	datad => VCC,
	cin => \btn_db_unit|Add0~3\,
	combout => \btn_db_unit|Add0~4_combout\,
	cout => \btn_db_unit|Add0~5\);

-- Location: LCCOMB_X41_Y29_N20
\btn_db_unit|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~8_combout\ = (\btn_db_unit|q_reg\(4) & ((GND) # (!\btn_db_unit|Add0~7\))) # (!\btn_db_unit|q_reg\(4) & (\btn_db_unit|Add0~7\ $ (GND)))
-- \btn_db_unit|Add0~9\ = CARRY((\btn_db_unit|q_reg\(4)) # (!\btn_db_unit|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|q_reg\(4),
	datad => VCC,
	cin => \btn_db_unit|Add0~7\,
	combout => \btn_db_unit|Add0~8_combout\,
	cout => \btn_db_unit|Add0~9\);

-- Location: LCCOMB_X43_Y29_N0
\uart_unit|baud_gen_unit|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|Add0~0_combout\ = \uart_unit|baud_gen_unit|r_reg\(0) $ (VCC)
-- \uart_unit|baud_gen_unit|Add0~1\ = CARRY(\uart_unit|baud_gen_unit|r_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|baud_gen_unit|r_reg\(0),
	datad => VCC,
	combout => \uart_unit|baud_gen_unit|Add0~0_combout\,
	cout => \uart_unit|baud_gen_unit|Add0~1\);

-- Location: LCCOMB_X43_Y29_N6
\uart_unit|baud_gen_unit|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|Add0~6_combout\ = (\uart_unit|baud_gen_unit|r_reg\(3) & (!\uart_unit|baud_gen_unit|Add0~5\)) # (!\uart_unit|baud_gen_unit|r_reg\(3) & ((\uart_unit|baud_gen_unit|Add0~5\) # (GND)))
-- \uart_unit|baud_gen_unit|Add0~7\ = CARRY((!\uart_unit|baud_gen_unit|Add0~5\) # (!\uart_unit|baud_gen_unit|r_reg\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|baud_gen_unit|r_reg\(3),
	datad => VCC,
	cin => \uart_unit|baud_gen_unit|Add0~5\,
	combout => \uart_unit|baud_gen_unit|Add0~6_combout\,
	cout => \uart_unit|baud_gen_unit|Add0~7\);

-- Location: LCCOMB_X43_Y29_N12
\uart_unit|baud_gen_unit|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|Add0~12_combout\ = (\uart_unit|baud_gen_unit|r_reg\(6) & (\uart_unit|baud_gen_unit|Add0~11\ $ (GND))) # (!\uart_unit|baud_gen_unit|r_reg\(6) & (!\uart_unit|baud_gen_unit|Add0~11\ & VCC))
-- \uart_unit|baud_gen_unit|Add0~13\ = CARRY((\uart_unit|baud_gen_unit|r_reg\(6) & !\uart_unit|baud_gen_unit|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|baud_gen_unit|r_reg\(6),
	datad => VCC,
	cin => \uart_unit|baud_gen_unit|Add0~11\,
	combout => \uart_unit|baud_gen_unit|Add0~12_combout\,
	cout => \uart_unit|baud_gen_unit|Add0~13\);

-- Location: LCFF_X42_Y27_N13
\uart_unit|fifo_rx_unit|array_reg~8\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(0),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~8_regout\);

-- Location: LCFF_X42_Y27_N17
\uart_unit|fifo_rx_unit|array_reg~9\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(1),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~9_regout\);

-- Location: LCFF_X41_Y27_N15
\uart_unit|fifo_rx_unit|array_reg~18\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|fifo_rx_unit|array_reg~18feeder_combout\,
	ena => \uart_unit|fifo_rx_unit|array_reg~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~18_regout\);

-- Location: LCFF_X42_Y27_N25
\uart_unit|fifo_rx_unit|array_reg~11\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(3),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~11_regout\);

-- Location: LCFF_X42_Y27_N21
\uart_unit|fifo_rx_unit|array_reg~13\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(5),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~13_regout\);

-- Location: LCFF_X41_Y27_N9
\uart_unit|fifo_rx_unit|array_reg~22\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|fifo_rx_unit|array_reg~22feeder_combout\,
	ena => \uart_unit|fifo_rx_unit|array_reg~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~22_regout\);

-- Location: LCFF_X42_Y27_N5
\uart_unit|fifo_rx_unit|array_reg~15\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(7),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~15_regout\);

-- Location: LCFF_X45_Y28_N25
\uart_unit|uart_rx_unit|s_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|s_reg[3]~6_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|s_reg\(3));

-- Location: LCFF_X43_Y29_N21
\uart_unit|baud_gen_unit|r_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|baud_gen_unit|r_next[6]~1_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|baud_gen_unit|r_reg\(6));

-- Location: LCFF_X43_Y29_N7
\uart_unit|baud_gen_unit|r_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|baud_gen_unit|Add0~6_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|baud_gen_unit|r_reg\(3));

-- Location: LCFF_X41_Y29_N13
\btn_db_unit|q_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector24~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(0));

-- Location: LCFF_X41_Y29_N23
\btn_db_unit|q_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector22~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(2));

-- Location: LCFF_X41_Y29_N27
\btn_db_unit|q_reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector17~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(7));

-- Location: LCFF_X41_Y29_N11
\btn_db_unit|q_reg[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \btn_db_unit|Selector15~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(9));

-- Location: LCFF_X41_Y28_N21
\btn_db_unit|q_reg[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector9~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(15));

-- Location: LCFF_X41_Y28_N19
\btn_db_unit|q_reg[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector6~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(18));

-- Location: LCFF_X41_Y28_N9
\btn_db_unit|q_reg[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector5~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(19));

-- Location: LCCOMB_X43_Y27_N6
\uart_unit|fifo_rx_unit|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|Mux5~0_combout\ = (\uart_unit|fifo_rx_unit|w_ptr_reg\(0) & (!\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) $ (\uart_unit|fifo_rx_unit|w_ptr_reg\(1))))) # (!\uart_unit|fifo_rx_unit|w_ptr_reg\(0) & 
-- (\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) $ (!\uart_unit|fifo_rx_unit|w_ptr_reg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010000011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datab => \uart_unit|fifo_rx_unit|w_ptr_reg\(0),
	datac => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	datad => \uart_unit|fifo_rx_unit|w_ptr_reg\(1),
	combout => \uart_unit|fifo_rx_unit|Mux5~0_combout\);

-- Location: LCFF_X44_Y28_N11
\uart_unit|uart_rx_unit|n_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|n_reg[2]~1_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|n_reg\(2));

-- Location: LCFF_X44_Y28_N15
\uart_unit|uart_rx_unit|state_reg.start\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|Selector1~6_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|state_reg.start~regout\);

-- Location: LCCOMB_X45_Y28_N8
\uart_unit|uart_rx_unit|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|Add0~0_combout\ = \uart_unit|uart_rx_unit|s_reg\(3) $ (((\uart_unit|uart_rx_unit|s_reg\(0) & (\uart_unit|uart_rx_unit|s_reg\(1) & \uart_unit|uart_rx_unit|s_reg\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|s_reg\(3),
	datab => \uart_unit|uart_rx_unit|s_reg\(0),
	datac => \uart_unit|uart_rx_unit|s_reg\(1),
	datad => \uart_unit|uart_rx_unit|s_reg\(2),
	combout => \uart_unit|uart_rx_unit|Add0~0_combout\);

-- Location: LCCOMB_X44_Y28_N30
\uart_unit|uart_rx_unit|s_reg[1]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|s_reg[1]~3_combout\ = (\uart_unit|uart_rx_unit|state_reg.start~regout\) # ((\uart_unit|uart_rx_unit|state_reg.stop~regout\) # (\uart_unit|uart_rx_unit|state_reg.data~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|uart_rx_unit|state_reg.start~regout\,
	datac => \uart_unit|uart_rx_unit|state_reg.stop~regout\,
	datad => \uart_unit|uart_rx_unit|state_reg.data~regout\,
	combout => \uart_unit|uart_rx_unit|s_reg[1]~3_combout\);

-- Location: LCCOMB_X45_Y28_N24
\uart_unit|uart_rx_unit|s_reg[3]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|s_reg[3]~6_combout\ = (\uart_unit|uart_rx_unit|s_reg[0]~5_combout\ & ((\uart_unit|uart_rx_unit|Add0~0_combout\) # ((\uart_unit|uart_rx_unit|s_reg\(3) & \uart_unit|uart_rx_unit|s_reg[1]~4_combout\)))) # 
-- (!\uart_unit|uart_rx_unit|s_reg[0]~5_combout\ & (((\uart_unit|uart_rx_unit|s_reg\(3) & \uart_unit|uart_rx_unit|s_reg[1]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|s_reg[0]~5_combout\,
	datab => \uart_unit|uart_rx_unit|Add0~0_combout\,
	datac => \uart_unit|uart_rx_unit|s_reg\(3),
	datad => \uart_unit|uart_rx_unit|s_reg[1]~4_combout\,
	combout => \uart_unit|uart_rx_unit|s_reg[3]~6_combout\);

-- Location: LCCOMB_X45_Y28_N16
\uart_unit|uart_rx_unit|Add0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|Add0~1_combout\ = \uart_unit|uart_rx_unit|s_reg\(2) $ (((\uart_unit|uart_rx_unit|s_reg\(0) & \uart_unit|uart_rx_unit|s_reg\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|s_reg\(0),
	datab => \uart_unit|uart_rx_unit|s_reg\(1),
	datad => \uart_unit|uart_rx_unit|s_reg\(2),
	combout => \uart_unit|uart_rx_unit|Add0~1_combout\);

-- Location: LCCOMB_X43_Y29_N20
\uart_unit|baud_gen_unit|r_next[6]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|r_next[6]~1_combout\ = (\uart_unit|baud_gen_unit|Add0~12_combout\ & (((\uart_unit|baud_gen_unit|r_reg\(0)) # (!\uart_unit|baud_gen_unit|Equal0~1_combout\)) # (!\uart_unit|baud_gen_unit|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|baud_gen_unit|Add0~12_combout\,
	datab => \uart_unit|baud_gen_unit|Equal0~0_combout\,
	datac => \uart_unit|baud_gen_unit|Equal0~1_combout\,
	datad => \uart_unit|baud_gen_unit|r_reg\(0),
	combout => \uart_unit|baud_gen_unit|r_next[6]~1_combout\);

-- Location: LCCOMB_X39_Y28_N20
\btn_db_unit|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector1~0_combout\ = (!\btn_db_unit|state_reg.HIGH~regout\ & !\btn~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|state_reg.HIGH~regout\,
	datac => \btn~combout\,
	combout => \btn_db_unit|Selector1~0_combout\);

-- Location: LCCOMB_X42_Y29_N28
\btn_db_unit|Selector24~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector24~0_combout\ = (\btn_db_unit|Add0~0_combout\) # ((!\btn_db_unit|state_reg.WAIT1~regout\ & !\btn_db_unit|state_reg.WAIT0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Add0~0_combout\,
	datac => \btn_db_unit|state_reg.WAIT1~regout\,
	datad => \btn_db_unit|state_reg.WAIT0~regout\,
	combout => \btn_db_unit|Selector24~0_combout\);

-- Location: LCCOMB_X39_Y28_N6
\btn_db_unit|q_reg[13]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|q_reg[13]~0_combout\ = (\btn_db_unit|state_reg.WAIT1~regout\ & (!\btn~combout\)) # (!\btn_db_unit|state_reg.WAIT1~regout\ & ((\btn~combout\ & ((\btn_db_unit|state_reg.WAIT0~regout\))) # (!\btn~combout\ & 
-- (\btn_db_unit|state_reg.LOW~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT1~regout\,
	datab => \btn~combout\,
	datac => \btn_db_unit|state_reg.LOW~regout\,
	datad => \btn_db_unit|state_reg.WAIT0~regout\,
	combout => \btn_db_unit|q_reg[13]~0_combout\);

-- Location: LCCOMB_X42_Y29_N0
\btn_db_unit|Selector22~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector22~0_combout\ = (\btn_db_unit|Add0~4_combout\) # ((!\btn_db_unit|state_reg.WAIT1~regout\ & !\btn_db_unit|state_reg.WAIT0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT1~regout\,
	datac => \btn_db_unit|state_reg.WAIT0~regout\,
	datad => \btn_db_unit|Add0~4_combout\,
	combout => \btn_db_unit|Selector22~0_combout\);

-- Location: LCCOMB_X42_Y29_N10
\btn_db_unit|Selector17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector17~0_combout\ = (\btn_db_unit|Add0~14_combout\) # ((!\btn_db_unit|state_reg.WAIT1~regout\ & !\btn_db_unit|state_reg.WAIT0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT1~regout\,
	datac => \btn_db_unit|state_reg.WAIT0~regout\,
	datad => \btn_db_unit|Add0~14_combout\,
	combout => \btn_db_unit|Selector17~0_combout\);

-- Location: LCCOMB_X41_Y29_N10
\btn_db_unit|Selector15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector15~0_combout\ = (\btn_db_unit|Add0~18_combout\) # ((!\btn_db_unit|state_reg.WAIT1~regout\ & !\btn_db_unit|state_reg.WAIT0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|Add0~18_combout\,
	datac => \btn_db_unit|state_reg.WAIT1~regout\,
	datad => \btn_db_unit|state_reg.WAIT0~regout\,
	combout => \btn_db_unit|Selector15~0_combout\);

-- Location: LCCOMB_X42_Y28_N8
\btn_db_unit|Selector9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector9~0_combout\ = (\btn_db_unit|Add0~30_combout\) # ((!\btn_db_unit|state_reg.WAIT1~regout\ & !\btn_db_unit|state_reg.WAIT0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|state_reg.WAIT1~regout\,
	datac => \btn_db_unit|state_reg.WAIT0~regout\,
	datad => \btn_db_unit|Add0~30_combout\,
	combout => \btn_db_unit|Selector9~0_combout\);

-- Location: LCCOMB_X40_Y28_N0
\btn_db_unit|Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector6~0_combout\ = (\btn_db_unit|Add0~36_combout\) # ((!\btn_db_unit|state_reg.WAIT1~regout\ & !\btn_db_unit|state_reg.WAIT0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT1~regout\,
	datac => \btn_db_unit|Add0~36_combout\,
	datad => \btn_db_unit|state_reg.WAIT0~regout\,
	combout => \btn_db_unit|Selector6~0_combout\);

-- Location: LCCOMB_X40_Y28_N30
\btn_db_unit|Selector5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector5~0_combout\ = (\btn_db_unit|Add0~38_combout\) # ((!\btn_db_unit|state_reg.WAIT0~regout\ & !\btn_db_unit|state_reg.WAIT1~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT0~regout\,
	datac => \btn_db_unit|state_reg.WAIT1~regout\,
	datad => \btn_db_unit|Add0~38_combout\,
	combout => \btn_db_unit|Selector5~0_combout\);

-- Location: LCFF_X43_Y28_N31
\uart_unit|uart_tx_unit|s_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|s_reg[0]~7_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|s_reg\(0));

-- Location: LCCOMB_X44_Y28_N10
\uart_unit|uart_rx_unit|n_reg[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|n_reg[2]~1_combout\ = (\uart_unit|uart_rx_unit|n_reg[2]~0_combout\ & (((\uart_unit|uart_rx_unit|n_reg\(2))))) # (!\uart_unit|uart_rx_unit|n_reg[2]~0_combout\ & (\uart_unit|uart_rx_unit|state_reg.data~regout\ & 
-- (\uart_unit|uart_rx_unit|Add1~0_combout\ $ (\uart_unit|uart_rx_unit|n_reg\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|state_reg.data~regout\,
	datab => \uart_unit|uart_rx_unit|Add1~0_combout\,
	datac => \uart_unit|uart_rx_unit|n_reg\(2),
	datad => \uart_unit|uart_rx_unit|n_reg[2]~0_combout\,
	combout => \uart_unit|uart_rx_unit|n_reg[2]~1_combout\);

-- Location: LCCOMB_X44_Y28_N18
\uart_unit|uart_rx_unit|Selector1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|Selector1~4_combout\ = (\uart_unit|uart_rx_unit|Selector1~2_combout\ & (((!\uart_unit|uart_rx_unit|b_reg[0]~0_combout\) # (!\uart_unit|uart_rx_unit|Add1~0_combout\)) # (!\uart_unit|uart_rx_unit|n_reg\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|n_reg\(2),
	datab => \uart_unit|uart_rx_unit|Add1~0_combout\,
	datac => \uart_unit|uart_rx_unit|b_reg[0]~0_combout\,
	datad => \uart_unit|uart_rx_unit|Selector1~2_combout\,
	combout => \uart_unit|uart_rx_unit|Selector1~4_combout\);

-- Location: LCCOMB_X44_Y28_N8
\uart_unit|uart_rx_unit|Selector1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|Selector1~5_combout\ = (!\uart_unit|uart_rx_unit|state_reg.idle~regout\ & !\rx~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|uart_rx_unit|state_reg.idle~regout\,
	datad => \rx~combout\,
	combout => \uart_unit|uart_rx_unit|Selector1~5_combout\);

-- Location: LCCOMB_X44_Y28_N14
\uart_unit|uart_rx_unit|Selector1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|Selector1~6_combout\ = (!\uart_unit|uart_rx_unit|Selector1~0_combout\ & (\uart_unit|uart_rx_unit|Selector1~4_combout\ & ((\uart_unit|uart_rx_unit|Selector1~5_combout\) # (\uart_unit|uart_rx_unit|state_reg.start~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|Selector1~0_combout\,
	datab => \uart_unit|uart_rx_unit|Selector1~5_combout\,
	datac => \uart_unit|uart_rx_unit|state_reg.start~regout\,
	datad => \uart_unit|uart_rx_unit|Selector1~4_combout\,
	combout => \uart_unit|uart_rx_unit|Selector1~6_combout\);

-- Location: LCCOMB_X43_Y28_N26
\btn_db_unit|state_reg.WAIT1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|state_reg.WAIT1~0_combout\ = (\btn_db_unit|state_reg.LOW~regout\ & \btn~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|state_reg.LOW~regout\,
	datad => \btn~combout\,
	combout => \btn_db_unit|state_reg.WAIT1~0_combout\);

-- Location: LCCOMB_X44_Y28_N6
\uart_unit|uart_tx_unit|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Add0~0_combout\ = \uart_unit|uart_tx_unit|s_reg\(3) $ (((\uart_unit|uart_tx_unit|s_reg\(0) & (\uart_unit|uart_tx_unit|s_reg\(2) & \uart_unit|uart_tx_unit|s_reg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|s_reg\(0),
	datab => \uart_unit|uart_tx_unit|s_reg\(2),
	datac => \uart_unit|uart_tx_unit|s_reg\(3),
	datad => \uart_unit|uart_tx_unit|s_reg\(1),
	combout => \uart_unit|uart_tx_unit|Add0~0_combout\);

-- Location: LCCOMB_X44_Y28_N26
\uart_unit|uart_tx_unit|Add0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Add0~1_combout\ = \uart_unit|uart_tx_unit|s_reg\(2) $ (((\uart_unit|uart_tx_unit|s_reg\(0) & \uart_unit|uart_tx_unit|s_reg\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|s_reg\(0),
	datab => \uart_unit|uart_tx_unit|s_reg\(2),
	datad => \uart_unit|uart_tx_unit|s_reg\(1),
	combout => \uart_unit|uart_tx_unit|Add0~1_combout\);

-- Location: LCCOMB_X43_Y28_N30
\uart_unit|uart_tx_unit|s_reg[0]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|s_reg[0]~7_combout\ = (\uart_unit|uart_tx_unit|s_reg\(0) & ((\uart_unit|uart_tx_unit|s_reg[2]~3_combout\))) # (!\uart_unit|uart_tx_unit|s_reg\(0) & (\uart_unit|uart_tx_unit|s_reg[0]~0_combout\ & 
-- !\uart_unit|uart_tx_unit|s_reg[2]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|uart_tx_unit|s_reg[0]~0_combout\,
	datac => \uart_unit|uart_tx_unit|s_reg\(0),
	datad => \uart_unit|uart_tx_unit|s_reg[2]~3_combout\,
	combout => \uart_unit|uart_tx_unit|s_reg[0]~7_combout\);

-- Location: LCCOMB_X41_Y27_N14
\uart_unit|fifo_rx_unit|array_reg~18feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~18feeder_combout\ = \uart_unit|uart_rx_unit|b_reg\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_unit|uart_rx_unit|b_reg\(2),
	combout => \uart_unit|fifo_rx_unit|array_reg~18feeder_combout\);

-- Location: LCCOMB_X41_Y27_N8
\uart_unit|fifo_rx_unit|array_reg~22feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~22feeder_combout\ = \uart_unit|uart_rx_unit|b_reg\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_unit|uart_rx_unit|b_reg\(6),
	combout => \uart_unit|fifo_rx_unit|array_reg~22feeder_combout\);

-- Location: PIN_D21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rx~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_rx,
	combout => \rx~combout\);

-- Location: PIN_L8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: LCCOMB_X44_Y28_N0
\uart_unit|uart_rx_unit|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|Selector0~0_combout\ = (!\uart_unit|uart_rx_unit|Selector1~0_combout\ & ((\uart_unit|uart_rx_unit|state_reg.idle~regout\) # (!\rx~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|Selector1~0_combout\,
	datac => \uart_unit|uart_rx_unit|state_reg.idle~regout\,
	datad => \rx~combout\,
	combout => \uart_unit|uart_rx_unit|Selector0~0_combout\);

-- Location: LCFF_X44_Y28_N1
\uart_unit|uart_rx_unit|state_reg.idle\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|Selector0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|state_reg.idle~regout\);

-- Location: LCCOMB_X44_Y28_N2
\uart_unit|uart_rx_unit|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|Add1~0_combout\ = (\uart_unit|uart_rx_unit|n_reg\(1) & \uart_unit|uart_rx_unit|n_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|uart_rx_unit|n_reg\(1),
	datad => \uart_unit|uart_rx_unit|n_reg\(0),
	combout => \uart_unit|uart_rx_unit|Add1~0_combout\);

-- Location: LCCOMB_X43_Y29_N8
\uart_unit|baud_gen_unit|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|Add0~8_combout\ = (\uart_unit|baud_gen_unit|r_reg\(4) & (\uart_unit|baud_gen_unit|Add0~7\ $ (GND))) # (!\uart_unit|baud_gen_unit|r_reg\(4) & (!\uart_unit|baud_gen_unit|Add0~7\ & VCC))
-- \uart_unit|baud_gen_unit|Add0~9\ = CARRY((\uart_unit|baud_gen_unit|r_reg\(4) & !\uart_unit|baud_gen_unit|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|baud_gen_unit|r_reg\(4),
	datad => VCC,
	cin => \uart_unit|baud_gen_unit|Add0~7\,
	combout => \uart_unit|baud_gen_unit|Add0~8_combout\,
	cout => \uart_unit|baud_gen_unit|Add0~9\);

-- Location: LCCOMB_X43_Y29_N10
\uart_unit|baud_gen_unit|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|Add0~10_combout\ = (\uart_unit|baud_gen_unit|r_reg\(5) & (!\uart_unit|baud_gen_unit|Add0~9\)) # (!\uart_unit|baud_gen_unit|r_reg\(5) & ((\uart_unit|baud_gen_unit|Add0~9\) # (GND)))
-- \uart_unit|baud_gen_unit|Add0~11\ = CARRY((!\uart_unit|baud_gen_unit|Add0~9\) # (!\uart_unit|baud_gen_unit|r_reg\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|baud_gen_unit|r_reg\(5),
	datad => VCC,
	cin => \uart_unit|baud_gen_unit|Add0~9\,
	combout => \uart_unit|baud_gen_unit|Add0~10_combout\,
	cout => \uart_unit|baud_gen_unit|Add0~11\);

-- Location: LCCOMB_X43_Y29_N14
\uart_unit|baud_gen_unit|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|Add0~14_combout\ = (\uart_unit|baud_gen_unit|r_reg\(7) & (!\uart_unit|baud_gen_unit|Add0~13\)) # (!\uart_unit|baud_gen_unit|r_reg\(7) & ((\uart_unit|baud_gen_unit|Add0~13\) # (GND)))
-- \uart_unit|baud_gen_unit|Add0~15\ = CARRY((!\uart_unit|baud_gen_unit|Add0~13\) # (!\uart_unit|baud_gen_unit|r_reg\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|baud_gen_unit|r_reg\(7),
	datad => VCC,
	cin => \uart_unit|baud_gen_unit|Add0~13\,
	combout => \uart_unit|baud_gen_unit|Add0~14_combout\,
	cout => \uart_unit|baud_gen_unit|Add0~15\);

-- Location: LCFF_X43_Y29_N15
\uart_unit|baud_gen_unit|r_reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|baud_gen_unit|Add0~14_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|baud_gen_unit|r_reg\(7));

-- Location: LCCOMB_X43_Y29_N16
\uart_unit|baud_gen_unit|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|Add0~16_combout\ = \uart_unit|baud_gen_unit|Add0~15\ $ (!\uart_unit|baud_gen_unit|r_reg\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \uart_unit|baud_gen_unit|r_reg\(8),
	cin => \uart_unit|baud_gen_unit|Add0~15\,
	combout => \uart_unit|baud_gen_unit|Add0~16_combout\);

-- Location: LCCOMB_X44_Y29_N12
\uart_unit|baud_gen_unit|r_next[8]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|r_next[8]~0_combout\ = (\uart_unit|baud_gen_unit|Add0~16_combout\ & (((\uart_unit|baud_gen_unit|r_reg\(0)) # (!\uart_unit|baud_gen_unit|Equal0~1_combout\)) # (!\uart_unit|baud_gen_unit|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|baud_gen_unit|Equal0~0_combout\,
	datab => \uart_unit|baud_gen_unit|r_reg\(0),
	datac => \uart_unit|baud_gen_unit|Equal0~1_combout\,
	datad => \uart_unit|baud_gen_unit|Add0~16_combout\,
	combout => \uart_unit|baud_gen_unit|r_next[8]~0_combout\);

-- Location: LCFF_X43_Y29_N31
\uart_unit|baud_gen_unit|r_reg[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|baud_gen_unit|r_next[8]~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|baud_gen_unit|r_reg\(8));

-- Location: LCFF_X43_Y29_N11
\uart_unit|baud_gen_unit|r_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|baud_gen_unit|Add0~10_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|baud_gen_unit|r_reg\(5));

-- Location: LCCOMB_X43_Y29_N18
\uart_unit|baud_gen_unit|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|Equal0~0_combout\ = (\uart_unit|baud_gen_unit|r_reg\(6) & (\uart_unit|baud_gen_unit|r_reg\(8) & (!\uart_unit|baud_gen_unit|r_reg\(7) & !\uart_unit|baud_gen_unit|r_reg\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|baud_gen_unit|r_reg\(6),
	datab => \uart_unit|baud_gen_unit|r_reg\(8),
	datac => \uart_unit|baud_gen_unit|r_reg\(7),
	datad => \uart_unit|baud_gen_unit|r_reg\(5),
	combout => \uart_unit|baud_gen_unit|Equal0~0_combout\);

-- Location: LCCOMB_X43_Y29_N28
\uart_unit|baud_gen_unit|r_next[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|r_next[0]~3_combout\ = (\uart_unit|baud_gen_unit|Add0~0_combout\ & (((\uart_unit|baud_gen_unit|r_reg\(0)) # (!\uart_unit|baud_gen_unit|Equal0~0_combout\)) # (!\uart_unit|baud_gen_unit|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|baud_gen_unit|Add0~0_combout\,
	datab => \uart_unit|baud_gen_unit|Equal0~1_combout\,
	datac => \uart_unit|baud_gen_unit|r_reg\(0),
	datad => \uart_unit|baud_gen_unit|Equal0~0_combout\,
	combout => \uart_unit|baud_gen_unit|r_next[0]~3_combout\);

-- Location: LCFF_X43_Y29_N29
\uart_unit|baud_gen_unit|r_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|baud_gen_unit|r_next[0]~3_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|baud_gen_unit|r_reg\(0));

-- Location: LCCOMB_X43_Y29_N2
\uart_unit|baud_gen_unit|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|Add0~2_combout\ = (\uart_unit|baud_gen_unit|r_reg\(1) & (!\uart_unit|baud_gen_unit|Add0~1\)) # (!\uart_unit|baud_gen_unit|r_reg\(1) & ((\uart_unit|baud_gen_unit|Add0~1\) # (GND)))
-- \uart_unit|baud_gen_unit|Add0~3\ = CARRY((!\uart_unit|baud_gen_unit|Add0~1\) # (!\uart_unit|baud_gen_unit|r_reg\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|baud_gen_unit|r_reg\(1),
	datad => VCC,
	cin => \uart_unit|baud_gen_unit|Add0~1\,
	combout => \uart_unit|baud_gen_unit|Add0~2_combout\,
	cout => \uart_unit|baud_gen_unit|Add0~3\);

-- Location: LCFF_X43_Y29_N3
\uart_unit|baud_gen_unit|r_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|baud_gen_unit|Add0~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|baud_gen_unit|r_reg\(1));

-- Location: LCCOMB_X43_Y29_N4
\uart_unit|baud_gen_unit|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|Add0~4_combout\ = (\uart_unit|baud_gen_unit|r_reg\(2) & (\uart_unit|baud_gen_unit|Add0~3\ $ (GND))) # (!\uart_unit|baud_gen_unit|r_reg\(2) & (!\uart_unit|baud_gen_unit|Add0~3\ & VCC))
-- \uart_unit|baud_gen_unit|Add0~5\ = CARRY((\uart_unit|baud_gen_unit|r_reg\(2) & !\uart_unit|baud_gen_unit|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|baud_gen_unit|r_reg\(2),
	datad => VCC,
	cin => \uart_unit|baud_gen_unit|Add0~3\,
	combout => \uart_unit|baud_gen_unit|Add0~4_combout\,
	cout => \uart_unit|baud_gen_unit|Add0~5\);

-- Location: LCFF_X43_Y29_N9
\uart_unit|baud_gen_unit|r_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|baud_gen_unit|Add0~8_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|baud_gen_unit|r_reg\(4));

-- Location: LCCOMB_X43_Y29_N24
\uart_unit|baud_gen_unit|r_next[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|r_next[2]~2_combout\ = (\uart_unit|baud_gen_unit|Add0~4_combout\ & ((\uart_unit|baud_gen_unit|r_reg\(0)) # ((!\uart_unit|baud_gen_unit|Equal0~1_combout\) # (!\uart_unit|baud_gen_unit|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|baud_gen_unit|r_reg\(0),
	datab => \uart_unit|baud_gen_unit|Equal0~0_combout\,
	datac => \uart_unit|baud_gen_unit|Add0~4_combout\,
	datad => \uart_unit|baud_gen_unit|Equal0~1_combout\,
	combout => \uart_unit|baud_gen_unit|r_next[2]~2_combout\);

-- Location: LCFF_X43_Y29_N25
\uart_unit|baud_gen_unit|r_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|baud_gen_unit|r_next[2]~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|baud_gen_unit|r_reg\(2));

-- Location: LCCOMB_X43_Y29_N26
\uart_unit|baud_gen_unit|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|Equal0~1_combout\ = (!\uart_unit|baud_gen_unit|r_reg\(3) & (!\uart_unit|baud_gen_unit|r_reg\(4) & (\uart_unit|baud_gen_unit|r_reg\(2) & !\uart_unit|baud_gen_unit|r_reg\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|baud_gen_unit|r_reg\(3),
	datab => \uart_unit|baud_gen_unit|r_reg\(4),
	datac => \uart_unit|baud_gen_unit|r_reg\(2),
	datad => \uart_unit|baud_gen_unit|r_reg\(1),
	combout => \uart_unit|baud_gen_unit|Equal0~1_combout\);

-- Location: LCCOMB_X43_Y29_N30
\uart_unit|baud_gen_unit|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|baud_gen_unit|Equal0~2_combout\ = (!\uart_unit|baud_gen_unit|r_reg\(0) & (\uart_unit|baud_gen_unit|Equal0~1_combout\ & \uart_unit|baud_gen_unit|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|baud_gen_unit|r_reg\(0),
	datab => \uart_unit|baud_gen_unit|Equal0~1_combout\,
	datad => \uart_unit|baud_gen_unit|Equal0~0_combout\,
	combout => \uart_unit|baud_gen_unit|Equal0~2_combout\);

-- Location: LCCOMB_X44_Y27_N8
\uart_unit|uart_rx_unit|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|Selector1~0_combout\ = (\uart_unit|uart_rx_unit|state_reg.stop~regout\ & (\uart_unit|baud_gen_unit|Equal0~2_combout\ & \uart_unit|uart_rx_unit|Equal2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|uart_rx_unit|state_reg.stop~regout\,
	datac => \uart_unit|baud_gen_unit|Equal0~2_combout\,
	datad => \uart_unit|uart_rx_unit|Equal2~0_combout\,
	combout => \uart_unit|uart_rx_unit|Selector1~0_combout\);

-- Location: LCCOMB_X44_Y28_N24
\uart_unit|uart_rx_unit|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|Selector3~0_combout\ = (!\uart_unit|uart_rx_unit|Selector1~0_combout\ & ((\uart_unit|uart_rx_unit|Selector1~3_combout\ & ((\uart_unit|uart_rx_unit|state_reg.stop~regout\))) # (!\uart_unit|uart_rx_unit|Selector1~3_combout\ & 
-- (\uart_unit|uart_rx_unit|Selector1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|Selector1~1_combout\,
	datab => \uart_unit|uart_rx_unit|Selector1~0_combout\,
	datac => \uart_unit|uart_rx_unit|state_reg.stop~regout\,
	datad => \uart_unit|uart_rx_unit|Selector1~3_combout\,
	combout => \uart_unit|uart_rx_unit|Selector3~0_combout\);

-- Location: LCFF_X44_Y28_N25
\uart_unit|uart_rx_unit|state_reg.stop\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|Selector3~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|state_reg.stop~regout\);

-- Location: LCCOMB_X44_Y28_N16
\uart_unit|uart_rx_unit|s_reg[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|s_reg[1]~2_combout\ = (\rx~combout\ & (((\uart_unit|uart_rx_unit|state_reg.stop~regout\ & \uart_unit|uart_rx_unit|Equal2~0_combout\)) # (!\uart_unit|uart_rx_unit|state_reg.idle~regout\))) # (!\rx~combout\ & 
-- (((\uart_unit|uart_rx_unit|state_reg.stop~regout\ & \uart_unit|uart_rx_unit|Equal2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rx~combout\,
	datab => \uart_unit|uart_rx_unit|state_reg.idle~regout\,
	datac => \uart_unit|uart_rx_unit|state_reg.stop~regout\,
	datad => \uart_unit|uart_rx_unit|Equal2~0_combout\,
	combout => \uart_unit|uart_rx_unit|s_reg[1]~2_combout\);

-- Location: LCCOMB_X45_Y28_N0
\uart_unit|uart_rx_unit|s_reg[1]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|s_reg[1]~4_combout\ = (\uart_unit|uart_rx_unit|s_reg[1]~2_combout\) # ((\uart_unit|uart_rx_unit|s_reg[1]~3_combout\ & !\uart_unit|baud_gen_unit|Equal0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|s_reg[1]~3_combout\,
	datac => \uart_unit|baud_gen_unit|Equal0~2_combout\,
	datad => \uart_unit|uart_rx_unit|s_reg[1]~2_combout\,
	combout => \uart_unit|uart_rx_unit|s_reg[1]~4_combout\);

-- Location: LCCOMB_X45_Y28_N4
\uart_unit|uart_rx_unit|s_reg[1]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|s_reg[1]~8_combout\ = (\uart_unit|uart_rx_unit|s_reg\(1) & ((\uart_unit|uart_rx_unit|s_reg[1]~4_combout\) # ((\uart_unit|uart_rx_unit|s_reg[0]~5_combout\ & !\uart_unit|uart_rx_unit|s_reg\(0))))) # 
-- (!\uart_unit|uart_rx_unit|s_reg\(1) & (\uart_unit|uart_rx_unit|s_reg[0]~5_combout\ & (\uart_unit|uart_rx_unit|s_reg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|s_reg[0]~5_combout\,
	datab => \uart_unit|uart_rx_unit|s_reg\(0),
	datac => \uart_unit|uart_rx_unit|s_reg\(1),
	datad => \uart_unit|uart_rx_unit|s_reg[1]~4_combout\,
	combout => \uart_unit|uart_rx_unit|s_reg[1]~8_combout\);

-- Location: LCFF_X45_Y28_N5
\uart_unit|uart_rx_unit|s_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|s_reg[1]~8_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|s_reg\(1));

-- Location: LCCOMB_X45_Y28_N10
\uart_unit|uart_rx_unit|s_reg[0]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|s_reg[0]~5_combout\ = (\uart_unit|uart_rx_unit|s_reg[0]~1_combout\ & (\uart_unit|uart_rx_unit|state_reg.idle~regout\ & !\uart_unit|uart_rx_unit|s_reg[1]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|uart_rx_unit|s_reg[0]~1_combout\,
	datac => \uart_unit|uart_rx_unit|state_reg.idle~regout\,
	datad => \uart_unit|uart_rx_unit|s_reg[1]~4_combout\,
	combout => \uart_unit|uart_rx_unit|s_reg[0]~5_combout\);

-- Location: LCCOMB_X45_Y28_N22
\uart_unit|uart_rx_unit|s_reg[2]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|s_reg[2]~7_combout\ = (\uart_unit|uart_rx_unit|Add0~1_combout\ & ((\uart_unit|uart_rx_unit|s_reg[0]~5_combout\) # ((\uart_unit|uart_rx_unit|s_reg[1]~4_combout\ & \uart_unit|uart_rx_unit|s_reg\(2))))) # 
-- (!\uart_unit|uart_rx_unit|Add0~1_combout\ & (\uart_unit|uart_rx_unit|s_reg[1]~4_combout\ & (\uart_unit|uart_rx_unit|s_reg\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|Add0~1_combout\,
	datab => \uart_unit|uart_rx_unit|s_reg[1]~4_combout\,
	datac => \uart_unit|uart_rx_unit|s_reg\(2),
	datad => \uart_unit|uart_rx_unit|s_reg[0]~5_combout\,
	combout => \uart_unit|uart_rx_unit|s_reg[2]~7_combout\);

-- Location: LCFF_X45_Y28_N23
\uart_unit|uart_rx_unit|s_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|s_reg[2]~7_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|s_reg\(2));

-- Location: LCCOMB_X45_Y28_N28
\uart_unit|uart_rx_unit|Equal2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|Equal2~0_combout\ = (\uart_unit|uart_rx_unit|s_reg\(3) & (\uart_unit|uart_rx_unit|s_reg\(0) & (\uart_unit|uart_rx_unit|s_reg\(1) & \uart_unit|uart_rx_unit|s_reg\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|s_reg\(3),
	datab => \uart_unit|uart_rx_unit|s_reg\(0),
	datac => \uart_unit|uart_rx_unit|s_reg\(1),
	datad => \uart_unit|uart_rx_unit|s_reg\(2),
	combout => \uart_unit|uart_rx_unit|Equal2~0_combout\);

-- Location: LCCOMB_X45_Y28_N2
\uart_unit|uart_rx_unit|s_reg[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|s_reg[0]~1_combout\ = (\uart_unit|uart_rx_unit|state_reg.data~regout\ & (((!\uart_unit|uart_rx_unit|Equal2~0_combout\)))) # (!\uart_unit|uart_rx_unit|state_reg.data~regout\ & (((!\uart_unit|uart_rx_unit|s_reg[1]~0_combout\)) # 
-- (!\uart_unit|uart_rx_unit|state_reg.start~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|state_reg.start~regout\,
	datab => \uart_unit|uart_rx_unit|Equal2~0_combout\,
	datac => \uart_unit|uart_rx_unit|state_reg.data~regout\,
	datad => \uart_unit|uart_rx_unit|s_reg[1]~0_combout\,
	combout => \uart_unit|uart_rx_unit|s_reg[0]~1_combout\);

-- Location: LCCOMB_X45_Y28_N18
\uart_unit|uart_rx_unit|s_reg[0]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|s_reg[0]~9_combout\ = (\uart_unit|uart_rx_unit|s_reg\(0) & (((\uart_unit|uart_rx_unit|s_reg[1]~4_combout\)))) # (!\uart_unit|uart_rx_unit|s_reg\(0) & (\uart_unit|uart_rx_unit|state_reg.idle~regout\ & 
-- (\uart_unit|uart_rx_unit|s_reg[0]~1_combout\ & !\uart_unit|uart_rx_unit|s_reg[1]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|state_reg.idle~regout\,
	datab => \uart_unit|uart_rx_unit|s_reg[0]~1_combout\,
	datac => \uart_unit|uart_rx_unit|s_reg\(0),
	datad => \uart_unit|uart_rx_unit|s_reg[1]~4_combout\,
	combout => \uart_unit|uart_rx_unit|s_reg[0]~9_combout\);

-- Location: LCFF_X45_Y28_N19
\uart_unit|uart_rx_unit|s_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|s_reg[0]~9_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|s_reg\(0));

-- Location: LCCOMB_X45_Y28_N12
\uart_unit|uart_rx_unit|s_reg[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|s_reg[1]~0_combout\ = (\uart_unit|uart_rx_unit|s_reg\(3) & (!\uart_unit|uart_rx_unit|s_reg\(0) & (!\uart_unit|uart_rx_unit|s_reg\(1) & !\uart_unit|uart_rx_unit|s_reg\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|s_reg\(3),
	datab => \uart_unit|uart_rx_unit|s_reg\(0),
	datac => \uart_unit|uart_rx_unit|s_reg\(1),
	datad => \uart_unit|uart_rx_unit|s_reg\(2),
	combout => \uart_unit|uart_rx_unit|s_reg[1]~0_combout\);

-- Location: LCCOMB_X45_Y28_N6
\uart_unit|uart_rx_unit|Selector1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|Selector1~2_combout\ = ((!\uart_unit|uart_rx_unit|s_reg[1]~0_combout\) # (!\uart_unit|baud_gen_unit|Equal0~2_combout\)) # (!\uart_unit|uart_rx_unit|state_reg.start~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|state_reg.start~regout\,
	datac => \uart_unit|baud_gen_unit|Equal0~2_combout\,
	datad => \uart_unit|uart_rx_unit|s_reg[1]~0_combout\,
	combout => \uart_unit|uart_rx_unit|Selector1~2_combout\);

-- Location: LCCOMB_X44_Y28_N28
\uart_unit|uart_rx_unit|n_reg[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|n_reg[2]~0_combout\ = (\uart_unit|uart_rx_unit|Selector1~2_combout\ & (((\uart_unit|uart_rx_unit|n_reg\(2) & \uart_unit|uart_rx_unit|Add1~0_combout\)) # (!\uart_unit|uart_rx_unit|b_reg[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|n_reg\(2),
	datab => \uart_unit|uart_rx_unit|Add1~0_combout\,
	datac => \uart_unit|uart_rx_unit|b_reg[0]~0_combout\,
	datad => \uart_unit|uart_rx_unit|Selector1~2_combout\,
	combout => \uart_unit|uart_rx_unit|n_reg[2]~0_combout\);

-- Location: LCCOMB_X45_Y28_N30
\uart_unit|uart_rx_unit|n_reg[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|n_reg[0]~3_combout\ = (\uart_unit|uart_rx_unit|n_reg\(0) & ((\uart_unit|uart_rx_unit|n_reg[2]~0_combout\))) # (!\uart_unit|uart_rx_unit|n_reg\(0) & (\uart_unit|uart_rx_unit|state_reg.data~regout\ & 
-- !\uart_unit|uart_rx_unit|n_reg[2]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|state_reg.data~regout\,
	datac => \uart_unit|uart_rx_unit|n_reg\(0),
	datad => \uart_unit|uart_rx_unit|n_reg[2]~0_combout\,
	combout => \uart_unit|uart_rx_unit|n_reg[0]~3_combout\);

-- Location: LCFF_X45_Y28_N31
\uart_unit|uart_rx_unit|n_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|n_reg[0]~3_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|n_reg\(0));

-- Location: LCCOMB_X45_Y28_N20
\uart_unit|uart_rx_unit|n_reg[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|n_reg[1]~2_combout\ = (\uart_unit|uart_rx_unit|n_reg[2]~0_combout\ & (((\uart_unit|uart_rx_unit|n_reg\(1))))) # (!\uart_unit|uart_rx_unit|n_reg[2]~0_combout\ & (\uart_unit|uart_rx_unit|state_reg.data~regout\ & 
-- (\uart_unit|uart_rx_unit|n_reg\(0) $ (\uart_unit|uart_rx_unit|n_reg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|state_reg.data~regout\,
	datab => \uart_unit|uart_rx_unit|n_reg\(0),
	datac => \uart_unit|uart_rx_unit|n_reg\(1),
	datad => \uart_unit|uart_rx_unit|n_reg[2]~0_combout\,
	combout => \uart_unit|uart_rx_unit|n_reg[1]~2_combout\);

-- Location: LCFF_X45_Y28_N21
\uart_unit|uart_rx_unit|n_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|n_reg[1]~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|n_reg\(1));

-- Location: LCCOMB_X44_Y28_N20
\uart_unit|uart_rx_unit|Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|Selector1~1_combout\ = (\uart_unit|uart_rx_unit|n_reg\(2) & (\uart_unit|uart_rx_unit|n_reg\(1) & (\uart_unit|uart_rx_unit|b_reg[0]~0_combout\ & \uart_unit|uart_rx_unit|n_reg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|n_reg\(2),
	datab => \uart_unit|uart_rx_unit|n_reg\(1),
	datac => \uart_unit|uart_rx_unit|b_reg[0]~0_combout\,
	datad => \uart_unit|uart_rx_unit|n_reg\(0),
	combout => \uart_unit|uart_rx_unit|Selector1~1_combout\);

-- Location: LCCOMB_X44_Y28_N22
\uart_unit|uart_rx_unit|Selector1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|Selector1~3_combout\ = (!\uart_unit|uart_rx_unit|Selector1~1_combout\ & (\uart_unit|uart_rx_unit|Selector1~2_combout\ & ((\rx~combout\) # (\uart_unit|uart_rx_unit|state_reg.idle~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rx~combout\,
	datab => \uart_unit|uart_rx_unit|state_reg.idle~regout\,
	datac => \uart_unit|uart_rx_unit|Selector1~1_combout\,
	datad => \uart_unit|uart_rx_unit|Selector1~2_combout\,
	combout => \uart_unit|uart_rx_unit|Selector1~3_combout\);

-- Location: LCCOMB_X44_Y28_N12
\uart_unit|uart_rx_unit|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|Selector2~0_combout\ = (!\uart_unit|uart_rx_unit|Selector1~0_combout\ & ((\uart_unit|uart_rx_unit|Selector1~3_combout\ & (\uart_unit|uart_rx_unit|state_reg.data~regout\)) # (!\uart_unit|uart_rx_unit|Selector1~3_combout\ & 
-- ((!\uart_unit|uart_rx_unit|Selector1~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|Selector1~0_combout\,
	datab => \uart_unit|uart_rx_unit|Selector1~3_combout\,
	datac => \uart_unit|uart_rx_unit|state_reg.data~regout\,
	datad => \uart_unit|uart_rx_unit|Selector1~2_combout\,
	combout => \uart_unit|uart_rx_unit|Selector2~0_combout\);

-- Location: LCFF_X44_Y28_N13
\uart_unit|uart_rx_unit|state_reg.data\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|Selector2~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|state_reg.data~regout\);

-- Location: LCCOMB_X44_Y27_N10
\uart_unit|uart_rx_unit|b_reg[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|b_reg[0]~0_combout\ = (\uart_unit|uart_rx_unit|Equal2~0_combout\ & (\uart_unit|uart_rx_unit|state_reg.data~regout\ & \uart_unit|baud_gen_unit|Equal0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|Equal2~0_combout\,
	datab => \uart_unit|uart_rx_unit|state_reg.data~regout\,
	datac => \uart_unit|baud_gen_unit|Equal0~2_combout\,
	combout => \uart_unit|uart_rx_unit|b_reg[0]~0_combout\);

-- Location: LCFF_X44_Y28_N27
\uart_unit|uart_rx_unit|b_reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \rx~combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \uart_unit|uart_rx_unit|b_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|b_reg\(7));

-- Location: LCCOMB_X40_Y27_N22
\uart_unit|uart_rx_unit|b_reg[6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|b_reg[6]~feeder_combout\ = \uart_unit|uart_rx_unit|b_reg\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_unit|uart_rx_unit|b_reg\(7),
	combout => \uart_unit|uart_rx_unit|b_reg[6]~feeder_combout\);

-- Location: LCFF_X40_Y27_N23
\uart_unit|uart_rx_unit|b_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|b_reg[6]~feeder_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \uart_unit|uart_rx_unit|b_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|b_reg\(6));

-- Location: LCCOMB_X40_Y27_N0
\uart_unit|uart_rx_unit|b_reg[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|b_reg[5]~feeder_combout\ = \uart_unit|uart_rx_unit|b_reg\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_unit|uart_rx_unit|b_reg\(6),
	combout => \uart_unit|uart_rx_unit|b_reg[5]~feeder_combout\);

-- Location: LCFF_X40_Y27_N1
\uart_unit|uart_rx_unit|b_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|b_reg[5]~feeder_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \uart_unit|uart_rx_unit|b_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|b_reg\(5));

-- Location: LCCOMB_X40_Y27_N18
\uart_unit|uart_rx_unit|b_reg[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|b_reg[4]~feeder_combout\ = \uart_unit|uart_rx_unit|b_reg\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_unit|uart_rx_unit|b_reg\(5),
	combout => \uart_unit|uart_rx_unit|b_reg[4]~feeder_combout\);

-- Location: LCFF_X40_Y27_N19
\uart_unit|uart_rx_unit|b_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|b_reg[4]~feeder_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \uart_unit|uart_rx_unit|b_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|b_reg\(4));

-- Location: LCCOMB_X40_Y27_N8
\uart_unit|uart_rx_unit|b_reg[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|b_reg[3]~feeder_combout\ = \uart_unit|uart_rx_unit|b_reg\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_unit|uart_rx_unit|b_reg\(4),
	combout => \uart_unit|uart_rx_unit|b_reg[3]~feeder_combout\);

-- Location: LCFF_X40_Y27_N9
\uart_unit|uart_rx_unit|b_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|b_reg[3]~feeder_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \uart_unit|uart_rx_unit|b_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|b_reg\(3));

-- Location: LCFF_X40_Y27_N27
\uart_unit|uart_rx_unit|b_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(3),
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \uart_unit|uart_rx_unit|b_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|b_reg\(2));

-- Location: LCCOMB_X40_Y27_N16
\uart_unit|uart_rx_unit|b_reg[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_rx_unit|b_reg[1]~feeder_combout\ = \uart_unit|uart_rx_unit|b_reg\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_unit|uart_rx_unit|b_reg\(2),
	combout => \uart_unit|uart_rx_unit|b_reg[1]~feeder_combout\);

-- Location: LCFF_X40_Y27_N17
\uart_unit|uart_rx_unit|b_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_rx_unit|b_reg[1]~feeder_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \uart_unit|uart_rx_unit|b_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|b_reg\(1));

-- Location: LCFF_X40_Y27_N3
\uart_unit|uart_rx_unit|b_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(1),
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \uart_unit|uart_rx_unit|b_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_rx_unit|b_reg\(0));

-- Location: LCCOMB_X43_Y27_N10
\uart_unit|fifo_rx_unit|w_ptr_reg[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|w_ptr_reg[0]~1_combout\ = !\uart_unit|fifo_rx_unit|w_ptr_reg\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_unit|fifo_rx_unit|w_ptr_reg\(0),
	combout => \uart_unit|fifo_rx_unit|w_ptr_reg[0]~1_combout\);

-- Location: PIN_U29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\btn~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_btn,
	combout => \btn~combout\);

-- Location: LCCOMB_X41_Y29_N12
\btn_db_unit|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~0_combout\ = \btn_db_unit|q_reg\(0) $ (VCC)
-- \btn_db_unit|Add0~1\ = CARRY(\btn_db_unit|q_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|q_reg\(0),
	datad => VCC,
	combout => \btn_db_unit|Add0~0_combout\,
	cout => \btn_db_unit|Add0~1\);

-- Location: LCCOMB_X42_Y29_N26
\btn_db_unit|Selector21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector21~0_combout\ = (\btn_db_unit|Add0~6_combout\) # ((!\btn_db_unit|state_reg.WAIT1~regout\ & !\btn_db_unit|state_reg.WAIT0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT1~regout\,
	datac => \btn_db_unit|state_reg.WAIT0~regout\,
	datad => \btn_db_unit|Add0~6_combout\,
	combout => \btn_db_unit|Selector21~0_combout\);

-- Location: LCCOMB_X39_Y28_N0
\btn_db_unit|q_reg[13]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|q_reg[13]~1_combout\ = (!\btn_db_unit|q_reg[13]~0_combout\ & ((\btn_db_unit|state_reg.HIGH~regout\) # (\btn_db_unit|state_reg.LOW~regout\ $ (!\btn~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|q_reg[13]~0_combout\,
	datab => \btn_db_unit|state_reg.LOW~regout\,
	datac => \btn~combout\,
	datad => \btn_db_unit|state_reg.HIGH~regout\,
	combout => \btn_db_unit|q_reg[13]~1_combout\);

-- Location: LCFF_X41_Y29_N19
\btn_db_unit|q_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector21~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(3));

-- Location: LCCOMB_X42_Y28_N22
\btn_db_unit|Equal0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Equal0~6_combout\ = (!\btn_db_unit|Add0~40_combout\ & (\btn_db_unit|Equal0~5_combout\ & \btn_db_unit|Equal0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Add0~40_combout\,
	datab => \btn_db_unit|Equal0~5_combout\,
	datad => \btn_db_unit|Equal0~4_combout\,
	combout => \btn_db_unit|Equal0~6_combout\);

-- Location: LCCOMB_X42_Y28_N28
\btn_db_unit|Selector3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector3~1_combout\ = (\btn_db_unit|state_reg.WAIT1~regout\ & (((\btn_db_unit|Equal0~6_combout\)) # (!\btn~combout\))) # (!\btn_db_unit|state_reg.WAIT1~regout\ & (\btn_db_unit|state_reg.WAIT0~regout\ & ((\btn~combout\) # 
-- (\btn_db_unit|Equal0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn~combout\,
	datab => \btn_db_unit|state_reg.WAIT1~regout\,
	datac => \btn_db_unit|state_reg.WAIT0~regout\,
	datad => \btn_db_unit|Equal0~6_combout\,
	combout => \btn_db_unit|Selector3~1_combout\);

-- Location: LCCOMB_X42_Y28_N18
\btn_db_unit|state_reg.WAIT1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|state_reg.WAIT1~1_combout\ = (\btn_db_unit|state_reg.WAIT1~0_combout\) # ((\btn_db_unit|Selector3~0_combout\ & (\btn_db_unit|state_reg.WAIT1~regout\ & !\btn_db_unit|Selector3~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT1~0_combout\,
	datab => \btn_db_unit|Selector3~0_combout\,
	datac => \btn_db_unit|state_reg.WAIT1~regout\,
	datad => \btn_db_unit|Selector3~1_combout\,
	combout => \btn_db_unit|state_reg.WAIT1~1_combout\);

-- Location: LCFF_X42_Y28_N19
\btn_db_unit|state_reg.WAIT1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \btn_db_unit|state_reg.WAIT1~1_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|state_reg.WAIT1~regout\);

-- Location: LCCOMB_X42_Y29_N22
\btn_db_unit|Selector23~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector23~0_combout\ = (\btn_db_unit|Add0~2_combout\) # ((!\btn_db_unit|state_reg.WAIT0~regout\ & !\btn_db_unit|state_reg.WAIT1~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Add0~2_combout\,
	datac => \btn_db_unit|state_reg.WAIT0~regout\,
	datad => \btn_db_unit|state_reg.WAIT1~regout\,
	combout => \btn_db_unit|Selector23~0_combout\);

-- Location: LCFF_X41_Y29_N15
\btn_db_unit|q_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector23~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(1));

-- Location: LCCOMB_X41_Y29_N14
\btn_db_unit|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~2_combout\ = (\btn_db_unit|q_reg\(1) & (\btn_db_unit|Add0~1\ & VCC)) # (!\btn_db_unit|q_reg\(1) & (!\btn_db_unit|Add0~1\))
-- \btn_db_unit|Add0~3\ = CARRY((!\btn_db_unit|q_reg\(1) & !\btn_db_unit|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|q_reg\(1),
	datad => VCC,
	cin => \btn_db_unit|Add0~1\,
	combout => \btn_db_unit|Add0~2_combout\,
	cout => \btn_db_unit|Add0~3\);

-- Location: LCCOMB_X41_Y29_N18
\btn_db_unit|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~6_combout\ = (\btn_db_unit|q_reg\(3) & (\btn_db_unit|Add0~5\ & VCC)) # (!\btn_db_unit|q_reg\(3) & (!\btn_db_unit|Add0~5\))
-- \btn_db_unit|Add0~7\ = CARRY((!\btn_db_unit|q_reg\(3) & !\btn_db_unit|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|q_reg\(3),
	datad => VCC,
	cin => \btn_db_unit|Add0~5\,
	combout => \btn_db_unit|Add0~6_combout\,
	cout => \btn_db_unit|Add0~7\);

-- Location: LCCOMB_X41_Y29_N8
\btn_db_unit|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Equal0~0_combout\ = (!\btn_db_unit|Add0~4_combout\ & (!\btn_db_unit|Add0~0_combout\ & (!\btn_db_unit|Add0~6_combout\ & !\btn_db_unit|Add0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Add0~4_combout\,
	datab => \btn_db_unit|Add0~0_combout\,
	datac => \btn_db_unit|Add0~6_combout\,
	datad => \btn_db_unit|Add0~2_combout\,
	combout => \btn_db_unit|Equal0~0_combout\);

-- Location: LCCOMB_X42_Y29_N16
\btn_db_unit|Selector14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector14~0_combout\ = (\btn_db_unit|Add0~20_combout\) # ((!\btn_db_unit|state_reg.WAIT0~regout\ & !\btn_db_unit|state_reg.WAIT1~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT0~regout\,
	datac => \btn_db_unit|state_reg.WAIT1~regout\,
	datad => \btn_db_unit|Add0~20_combout\,
	combout => \btn_db_unit|Selector14~0_combout\);

-- Location: LCFF_X41_Y28_N27
\btn_db_unit|q_reg[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector14~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(10));

-- Location: LCCOMB_X42_Y29_N12
\btn_db_unit|Selector20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector20~0_combout\ = (\btn_db_unit|Add0~8_combout\) # ((!\btn_db_unit|state_reg.WAIT1~regout\ & !\btn_db_unit|state_reg.WAIT0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Add0~8_combout\,
	datac => \btn_db_unit|state_reg.WAIT1~regout\,
	datad => \btn_db_unit|state_reg.WAIT0~regout\,
	combout => \btn_db_unit|Selector20~0_combout\);

-- Location: LCFF_X41_Y29_N25
\btn_db_unit|q_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector20~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(4));

-- Location: LCCOMB_X41_Y29_N22
\btn_db_unit|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~10_combout\ = (\btn_db_unit|q_reg\(5) & (\btn_db_unit|Add0~9\ & VCC)) # (!\btn_db_unit|q_reg\(5) & (!\btn_db_unit|Add0~9\))
-- \btn_db_unit|Add0~11\ = CARRY((!\btn_db_unit|q_reg\(5) & !\btn_db_unit|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|q_reg\(5),
	datad => VCC,
	cin => \btn_db_unit|Add0~9\,
	combout => \btn_db_unit|Add0~10_combout\,
	cout => \btn_db_unit|Add0~11\);

-- Location: LCCOMB_X42_Y29_N14
\btn_db_unit|Selector19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector19~0_combout\ = (\btn_db_unit|Add0~10_combout\) # ((!\btn_db_unit|state_reg.WAIT0~regout\ & !\btn_db_unit|state_reg.WAIT1~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|Add0~10_combout\,
	datac => \btn_db_unit|state_reg.WAIT0~regout\,
	datad => \btn_db_unit|state_reg.WAIT1~regout\,
	combout => \btn_db_unit|Selector19~0_combout\);

-- Location: LCFF_X41_Y29_N17
\btn_db_unit|q_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector19~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(5));

-- Location: LCCOMB_X41_Y29_N24
\btn_db_unit|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~12_combout\ = (\btn_db_unit|q_reg\(6) & ((GND) # (!\btn_db_unit|Add0~11\))) # (!\btn_db_unit|q_reg\(6) & (\btn_db_unit|Add0~11\ $ (GND)))
-- \btn_db_unit|Add0~13\ = CARRY((\btn_db_unit|q_reg\(6)) # (!\btn_db_unit|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|q_reg\(6),
	datad => VCC,
	cin => \btn_db_unit|Add0~11\,
	combout => \btn_db_unit|Add0~12_combout\,
	cout => \btn_db_unit|Add0~13\);

-- Location: LCCOMB_X42_Y29_N8
\btn_db_unit|Selector18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector18~0_combout\ = (\btn_db_unit|Add0~12_combout\) # ((!\btn_db_unit|state_reg.WAIT1~regout\ & !\btn_db_unit|state_reg.WAIT0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT1~regout\,
	datab => \btn_db_unit|Add0~12_combout\,
	datac => \btn_db_unit|state_reg.WAIT0~regout\,
	combout => \btn_db_unit|Selector18~0_combout\);

-- Location: LCFF_X41_Y29_N21
\btn_db_unit|q_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector18~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(6));

-- Location: LCCOMB_X41_Y29_N26
\btn_db_unit|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~14_combout\ = (\btn_db_unit|q_reg\(7) & (\btn_db_unit|Add0~13\ & VCC)) # (!\btn_db_unit|q_reg\(7) & (!\btn_db_unit|Add0~13\))
-- \btn_db_unit|Add0~15\ = CARRY((!\btn_db_unit|q_reg\(7) & !\btn_db_unit|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|q_reg\(7),
	datad => VCC,
	cin => \btn_db_unit|Add0~13\,
	combout => \btn_db_unit|Add0~14_combout\,
	cout => \btn_db_unit|Add0~15\);

-- Location: LCCOMB_X41_Y29_N28
\btn_db_unit|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~16_combout\ = (\btn_db_unit|q_reg\(8) & ((GND) # (!\btn_db_unit|Add0~15\))) # (!\btn_db_unit|q_reg\(8) & (\btn_db_unit|Add0~15\ $ (GND)))
-- \btn_db_unit|Add0~17\ = CARRY((\btn_db_unit|q_reg\(8)) # (!\btn_db_unit|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|q_reg\(8),
	datad => VCC,
	cin => \btn_db_unit|Add0~15\,
	combout => \btn_db_unit|Add0~16_combout\,
	cout => \btn_db_unit|Add0~17\);

-- Location: LCCOMB_X41_Y29_N0
\btn_db_unit|Selector16~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector16~0_combout\ = (\btn_db_unit|Add0~16_combout\) # ((!\btn_db_unit|state_reg.WAIT1~regout\ & !\btn_db_unit|state_reg.WAIT0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|Add0~16_combout\,
	datac => \btn_db_unit|state_reg.WAIT1~regout\,
	datad => \btn_db_unit|state_reg.WAIT0~regout\,
	combout => \btn_db_unit|Selector16~0_combout\);

-- Location: LCFF_X41_Y29_N1
\btn_db_unit|q_reg[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \btn_db_unit|Selector16~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(8));

-- Location: LCCOMB_X41_Y29_N30
\btn_db_unit|Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~18_combout\ = (\btn_db_unit|q_reg\(9) & (\btn_db_unit|Add0~17\ & VCC)) # (!\btn_db_unit|q_reg\(9) & (!\btn_db_unit|Add0~17\))
-- \btn_db_unit|Add0~19\ = CARRY((!\btn_db_unit|q_reg\(9) & !\btn_db_unit|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|q_reg\(9),
	datad => VCC,
	cin => \btn_db_unit|Add0~17\,
	combout => \btn_db_unit|Add0~18_combout\,
	cout => \btn_db_unit|Add0~19\);

-- Location: LCCOMB_X41_Y28_N0
\btn_db_unit|Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~20_combout\ = (\btn_db_unit|q_reg\(10) & ((GND) # (!\btn_db_unit|Add0~19\))) # (!\btn_db_unit|q_reg\(10) & (\btn_db_unit|Add0~19\ $ (GND)))
-- \btn_db_unit|Add0~21\ = CARRY((\btn_db_unit|q_reg\(10)) # (!\btn_db_unit|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|q_reg\(10),
	datad => VCC,
	cin => \btn_db_unit|Add0~19\,
	combout => \btn_db_unit|Add0~20_combout\,
	cout => \btn_db_unit|Add0~21\);

-- Location: LCCOMB_X42_Y28_N12
\btn_db_unit|Selector13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector13~0_combout\ = (\btn_db_unit|Add0~22_combout\) # ((!\btn_db_unit|state_reg.WAIT0~regout\ & !\btn_db_unit|state_reg.WAIT1~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Add0~22_combout\,
	datab => \btn_db_unit|state_reg.WAIT0~regout\,
	datad => \btn_db_unit|state_reg.WAIT1~regout\,
	combout => \btn_db_unit|Selector13~0_combout\);

-- Location: LCFF_X41_Y28_N13
\btn_db_unit|q_reg[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector13~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(11));

-- Location: LCCOMB_X41_Y28_N2
\btn_db_unit|Add0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~22_combout\ = (\btn_db_unit|q_reg\(11) & (\btn_db_unit|Add0~21\ & VCC)) # (!\btn_db_unit|q_reg\(11) & (!\btn_db_unit|Add0~21\))
-- \btn_db_unit|Add0~23\ = CARRY((!\btn_db_unit|q_reg\(11) & !\btn_db_unit|Add0~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|q_reg\(11),
	datad => VCC,
	cin => \btn_db_unit|Add0~21\,
	combout => \btn_db_unit|Add0~22_combout\,
	cout => \btn_db_unit|Add0~23\);

-- Location: LCCOMB_X42_Y28_N14
\btn_db_unit|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Equal0~2_combout\ = (!\btn_db_unit|Add0~16_combout\ & (!\btn_db_unit|Add0~20_combout\ & (!\btn_db_unit|Add0~18_combout\ & !\btn_db_unit|Add0~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Add0~16_combout\,
	datab => \btn_db_unit|Add0~20_combout\,
	datac => \btn_db_unit|Add0~18_combout\,
	datad => \btn_db_unit|Add0~22_combout\,
	combout => \btn_db_unit|Equal0~2_combout\);

-- Location: LCCOMB_X42_Y28_N26
\btn_db_unit|Selector12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector12~0_combout\ = (\btn_db_unit|Add0~24_combout\) # ((!\btn_db_unit|state_reg.WAIT0~regout\ & !\btn_db_unit|state_reg.WAIT1~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|state_reg.WAIT0~regout\,
	datac => \btn_db_unit|Add0~24_combout\,
	datad => \btn_db_unit|state_reg.WAIT1~regout\,
	combout => \btn_db_unit|Selector12~0_combout\);

-- Location: LCFF_X41_Y28_N17
\btn_db_unit|q_reg[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector12~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(12));

-- Location: LCCOMB_X41_Y28_N4
\btn_db_unit|Add0~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~24_combout\ = (\btn_db_unit|q_reg\(12) & ((GND) # (!\btn_db_unit|Add0~23\))) # (!\btn_db_unit|q_reg\(12) & (\btn_db_unit|Add0~23\ $ (GND)))
-- \btn_db_unit|Add0~25\ = CARRY((\btn_db_unit|q_reg\(12)) # (!\btn_db_unit|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|q_reg\(12),
	datad => VCC,
	cin => \btn_db_unit|Add0~23\,
	combout => \btn_db_unit|Add0~24_combout\,
	cout => \btn_db_unit|Add0~25\);

-- Location: LCCOMB_X42_Y29_N6
\btn_db_unit|Selector10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector10~0_combout\ = (\btn_db_unit|Add0~28_combout\) # ((!\btn_db_unit|state_reg.WAIT1~regout\ & !\btn_db_unit|state_reg.WAIT0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT1~regout\,
	datac => \btn_db_unit|state_reg.WAIT0~regout\,
	datad => \btn_db_unit|Add0~28_combout\,
	combout => \btn_db_unit|Selector10~0_combout\);

-- Location: LCFF_X41_Y28_N5
\btn_db_unit|q_reg[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector10~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(14));

-- Location: LCCOMB_X41_Y28_N6
\btn_db_unit|Add0~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~26_combout\ = (\btn_db_unit|q_reg\(13) & (\btn_db_unit|Add0~25\ & VCC)) # (!\btn_db_unit|q_reg\(13) & (!\btn_db_unit|Add0~25\))
-- \btn_db_unit|Add0~27\ = CARRY((!\btn_db_unit|q_reg\(13) & !\btn_db_unit|Add0~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|q_reg\(13),
	datad => VCC,
	cin => \btn_db_unit|Add0~25\,
	combout => \btn_db_unit|Add0~26_combout\,
	cout => \btn_db_unit|Add0~27\);

-- Location: LCCOMB_X41_Y28_N28
\btn_db_unit|Selector11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector11~0_combout\ = (\btn_db_unit|Add0~26_combout\) # ((!\btn_db_unit|state_reg.WAIT0~regout\ & !\btn_db_unit|state_reg.WAIT1~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT0~regout\,
	datab => \btn_db_unit|state_reg.WAIT1~regout\,
	datad => \btn_db_unit|Add0~26_combout\,
	combout => \btn_db_unit|Selector11~0_combout\);

-- Location: LCFF_X41_Y28_N29
\btn_db_unit|q_reg[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \btn_db_unit|Selector11~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(13));

-- Location: LCCOMB_X41_Y28_N8
\btn_db_unit|Add0~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~28_combout\ = (\btn_db_unit|q_reg\(14) & ((GND) # (!\btn_db_unit|Add0~27\))) # (!\btn_db_unit|q_reg\(14) & (\btn_db_unit|Add0~27\ $ (GND)))
-- \btn_db_unit|Add0~29\ = CARRY((\btn_db_unit|q_reg\(14)) # (!\btn_db_unit|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|q_reg\(14),
	datad => VCC,
	cin => \btn_db_unit|Add0~27\,
	combout => \btn_db_unit|Add0~28_combout\,
	cout => \btn_db_unit|Add0~29\);

-- Location: LCCOMB_X41_Y28_N10
\btn_db_unit|Add0~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~30_combout\ = (\btn_db_unit|q_reg\(15) & (\btn_db_unit|Add0~29\ & VCC)) # (!\btn_db_unit|q_reg\(15) & (!\btn_db_unit|Add0~29\))
-- \btn_db_unit|Add0~31\ = CARRY((!\btn_db_unit|q_reg\(15) & !\btn_db_unit|Add0~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|q_reg\(15),
	datad => VCC,
	cin => \btn_db_unit|Add0~29\,
	combout => \btn_db_unit|Add0~30_combout\,
	cout => \btn_db_unit|Add0~31\);

-- Location: LCCOMB_X41_Y28_N22
\btn_db_unit|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Equal0~3_combout\ = (!\btn_db_unit|Add0~26_combout\ & (!\btn_db_unit|Add0~24_combout\ & (!\btn_db_unit|Add0~28_combout\ & !\btn_db_unit|Add0~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Add0~26_combout\,
	datab => \btn_db_unit|Add0~24_combout\,
	datac => \btn_db_unit|Add0~28_combout\,
	datad => \btn_db_unit|Add0~30_combout\,
	combout => \btn_db_unit|Equal0~3_combout\);

-- Location: LCCOMB_X42_Y28_N0
\btn_db_unit|Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Equal0~4_combout\ = (\btn_db_unit|Equal0~1_combout\ & (\btn_db_unit|Equal0~0_combout\ & (\btn_db_unit|Equal0~2_combout\ & \btn_db_unit|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Equal0~1_combout\,
	datab => \btn_db_unit|Equal0~0_combout\,
	datac => \btn_db_unit|Equal0~2_combout\,
	datad => \btn_db_unit|Equal0~3_combout\,
	combout => \btn_db_unit|Equal0~4_combout\);

-- Location: LCCOMB_X41_Y28_N12
\btn_db_unit|Add0~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~32_combout\ = (\btn_db_unit|q_reg\(16) & ((GND) # (!\btn_db_unit|Add0~31\))) # (!\btn_db_unit|q_reg\(16) & (\btn_db_unit|Add0~31\ $ (GND)))
-- \btn_db_unit|Add0~33\ = CARRY((\btn_db_unit|q_reg\(16)) # (!\btn_db_unit|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|q_reg\(16),
	datad => VCC,
	cin => \btn_db_unit|Add0~31\,
	combout => \btn_db_unit|Add0~32_combout\,
	cout => \btn_db_unit|Add0~33\);

-- Location: LCCOMB_X42_Y28_N6
\btn_db_unit|Selector8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector8~0_combout\ = (\btn_db_unit|Add0~32_combout\) # ((!\btn_db_unit|state_reg.WAIT1~regout\ & !\btn_db_unit|state_reg.WAIT0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|state_reg.WAIT1~regout\,
	datac => \btn_db_unit|state_reg.WAIT0~regout\,
	datad => \btn_db_unit|Add0~32_combout\,
	combout => \btn_db_unit|Selector8~0_combout\);

-- Location: LCFF_X41_Y28_N3
\btn_db_unit|q_reg[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector8~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(16));

-- Location: LCCOMB_X41_Y28_N14
\btn_db_unit|Add0~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~34_combout\ = (\btn_db_unit|q_reg\(17) & (\btn_db_unit|Add0~33\ & VCC)) # (!\btn_db_unit|q_reg\(17) & (!\btn_db_unit|Add0~33\))
-- \btn_db_unit|Add0~35\ = CARRY((!\btn_db_unit|q_reg\(17) & !\btn_db_unit|Add0~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|q_reg\(17),
	datad => VCC,
	cin => \btn_db_unit|Add0~33\,
	combout => \btn_db_unit|Add0~34_combout\,
	cout => \btn_db_unit|Add0~35\);

-- Location: LCCOMB_X41_Y28_N16
\btn_db_unit|Add0~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~36_combout\ = (\btn_db_unit|q_reg\(18) & ((GND) # (!\btn_db_unit|Add0~35\))) # (!\btn_db_unit|q_reg\(18) & (\btn_db_unit|Add0~35\ $ (GND)))
-- \btn_db_unit|Add0~37\ = CARRY((\btn_db_unit|q_reg\(18)) # (!\btn_db_unit|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|q_reg\(18),
	datad => VCC,
	cin => \btn_db_unit|Add0~35\,
	combout => \btn_db_unit|Add0~36_combout\,
	cout => \btn_db_unit|Add0~37\);

-- Location: LCCOMB_X41_Y28_N18
\btn_db_unit|Add0~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~38_combout\ = (\btn_db_unit|q_reg\(19) & (\btn_db_unit|Add0~37\ & VCC)) # (!\btn_db_unit|q_reg\(19) & (!\btn_db_unit|Add0~37\))
-- \btn_db_unit|Add0~39\ = CARRY((!\btn_db_unit|q_reg\(19) & !\btn_db_unit|Add0~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|q_reg\(19),
	datad => VCC,
	cin => \btn_db_unit|Add0~37\,
	combout => \btn_db_unit|Add0~38_combout\,
	cout => \btn_db_unit|Add0~39\);

-- Location: LCCOMB_X41_Y28_N26
\btn_db_unit|Equal0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Equal0~7_combout\ = (!\btn_db_unit|Add0~32_combout\ & !\btn_db_unit|Add0~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Add0~32_combout\,
	datad => \btn_db_unit|Add0~34_combout\,
	combout => \btn_db_unit|Equal0~7_combout\);

-- Location: LCCOMB_X41_Y29_N4
\btn_db_unit|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector4~0_combout\ = (\btn_db_unit|Add0~40_combout\) # ((!\btn_db_unit|state_reg.WAIT0~regout\ & !\btn_db_unit|state_reg.WAIT1~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|state_reg.WAIT0~regout\,
	datac => \btn_db_unit|state_reg.WAIT1~regout\,
	datad => \btn_db_unit|Add0~40_combout\,
	combout => \btn_db_unit|Selector4~0_combout\);

-- Location: LCFF_X41_Y29_N5
\btn_db_unit|q_reg[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \btn_db_unit|Selector4~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(20));

-- Location: LCCOMB_X41_Y28_N20
\btn_db_unit|Add0~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Add0~40_combout\ = \btn_db_unit|Add0~39\ $ (\btn_db_unit|q_reg\(20))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \btn_db_unit|q_reg\(20),
	cin => \btn_db_unit|Add0~39\,
	combout => \btn_db_unit|Add0~40_combout\);

-- Location: LCCOMB_X40_Y28_N22
\btn_db_unit|Equal0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Equal0~8_combout\ = (!\btn_db_unit|Add0~36_combout\ & (!\btn_db_unit|Add0~38_combout\ & (\btn_db_unit|Equal0~7_combout\ & !\btn_db_unit|Add0~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Add0~36_combout\,
	datab => \btn_db_unit|Add0~38_combout\,
	datac => \btn_db_unit|Equal0~7_combout\,
	datad => \btn_db_unit|Add0~40_combout\,
	combout => \btn_db_unit|Equal0~8_combout\);

-- Location: LCCOMB_X39_Y28_N12
\btn_db_unit|Selector2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector2~1_combout\ = (\btn_db_unit|state_reg.WAIT1~regout\ & (((\btn_db_unit|Equal0~4_combout\ & \btn_db_unit|Equal0~8_combout\)) # (!\btn~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT1~regout\,
	datab => \btn~combout\,
	datac => \btn_db_unit|Equal0~4_combout\,
	datad => \btn_db_unit|Equal0~8_combout\,
	combout => \btn_db_unit|Selector2~1_combout\);

-- Location: LCCOMB_X39_Y28_N10
\btn_db_unit|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector0~0_combout\ = (\btn~combout\ & ((\btn_db_unit|Selector2~1_combout\) # ((\btn_db_unit|state_reg.WAIT0~regout\ & \btn_db_unit|Selector2~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT0~regout\,
	datab => \btn~combout\,
	datac => \btn_db_unit|Selector2~3_combout\,
	datad => \btn_db_unit|Selector2~1_combout\,
	combout => \btn_db_unit|Selector0~0_combout\);

-- Location: LCCOMB_X39_Y28_N22
\btn_db_unit|Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector0~1_combout\ = (!\btn_db_unit|Selector0~0_combout\ & ((\btn_db_unit|Selector2~1_combout\) # ((\btn_db_unit|Selector2~3_combout\) # (\btn_db_unit|state_reg.HIGH~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Selector2~1_combout\,
	datab => \btn_db_unit|Selector2~3_combout\,
	datac => \btn_db_unit|state_reg.HIGH~regout\,
	datad => \btn_db_unit|Selector0~0_combout\,
	combout => \btn_db_unit|Selector0~1_combout\);

-- Location: LCFF_X39_Y28_N23
\btn_db_unit|state_reg.HIGH\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \btn_db_unit|Selector0~1_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|state_reg.HIGH~regout\);

-- Location: LCCOMB_X39_Y28_N2
\btn_db_unit|Selector2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector2~2_combout\ = (\btn_db_unit|state_reg.LOW~regout\ & (((\btn~combout\)))) # (!\btn_db_unit|state_reg.LOW~regout\ & ((\btn~combout\ & (\btn_db_unit|state_reg.WAIT0~regout\)) # (!\btn~combout\ & 
-- ((!\btn_db_unit|state_reg.HIGH~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT0~regout\,
	datab => \btn_db_unit|state_reg.LOW~regout\,
	datac => \btn~combout\,
	datad => \btn_db_unit|state_reg.HIGH~regout\,
	combout => \btn_db_unit|Selector2~2_combout\);

-- Location: LCCOMB_X39_Y28_N8
\btn_db_unit|Selector2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector2~3_combout\ = (\btn_db_unit|Selector2~2_combout\) # ((\btn_db_unit|state_reg.WAIT0~regout\ & (\btn_db_unit|Equal0~4_combout\ & \btn_db_unit|Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT0~regout\,
	datab => \btn_db_unit|Selector2~2_combout\,
	datac => \btn_db_unit|Equal0~4_combout\,
	datad => \btn_db_unit|Equal0~8_combout\,
	combout => \btn_db_unit|Selector2~3_combout\);

-- Location: LCCOMB_X40_Y28_N24
\btn_db_unit|Selector2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector2~4_combout\ = (\btn_db_unit|state_reg.WAIT0~regout\ & (!\btn_db_unit|Add0~40_combout\ & \btn_db_unit|Equal0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT0~regout\,
	datab => \btn_db_unit|Add0~40_combout\,
	datad => \btn_db_unit|Equal0~5_combout\,
	combout => \btn_db_unit|Selector2~4_combout\);

-- Location: LCCOMB_X39_Y28_N28
\btn_db_unit|Selector2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector2~5_combout\ = (\btn_db_unit|Selector2~3_combout\ & (((\btn_db_unit|Equal0~4_combout\ & \btn_db_unit|Selector2~4_combout\)))) # (!\btn_db_unit|Selector2~3_combout\ & (\btn_db_unit|state_reg.LOW~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.LOW~regout\,
	datab => \btn_db_unit|Equal0~4_combout\,
	datac => \btn_db_unit|Selector2~3_combout\,
	datad => \btn_db_unit|Selector2~4_combout\,
	combout => \btn_db_unit|Selector2~5_combout\);

-- Location: LCCOMB_X39_Y28_N14
\btn_db_unit|Selector2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector2~6_combout\ = (\btn_db_unit|Selector2~1_combout\ & (!\btn~combout\)) # (!\btn_db_unit|Selector2~1_combout\ & (\btn_db_unit|Selector2~5_combout\ & ((!\btn_db_unit|Selector2~3_combout\) # (!\btn~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Selector2~1_combout\,
	datab => \btn~combout\,
	datac => \btn_db_unit|Selector2~3_combout\,
	datad => \btn_db_unit|Selector2~5_combout\,
	combout => \btn_db_unit|Selector2~6_combout\);

-- Location: LCFF_X39_Y28_N15
\btn_db_unit|state_reg.LOW\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \btn_db_unit|Selector2~6_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|state_reg.LOW~regout\);

-- Location: LCCOMB_X39_Y28_N16
\btn_db_unit|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector3~0_combout\ = (\btn~combout\ & (!\btn_db_unit|state_reg.LOW~regout\)) # (!\btn~combout\ & ((\btn_db_unit|state_reg.HIGH~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \btn_db_unit|state_reg.LOW~regout\,
	datac => \btn~combout\,
	datad => \btn_db_unit|state_reg.HIGH~regout\,
	combout => \btn_db_unit|Selector3~0_combout\);

-- Location: LCCOMB_X42_Y28_N4
\btn_db_unit|Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector1~1_combout\ = (\btn_db_unit|Selector1~0_combout\) # ((\btn_db_unit|Selector3~0_combout\ & (\btn_db_unit|state_reg.WAIT0~regout\ & !\btn_db_unit|Selector3~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Selector1~0_combout\,
	datab => \btn_db_unit|Selector3~0_combout\,
	datac => \btn_db_unit|state_reg.WAIT0~regout\,
	datad => \btn_db_unit|Selector3~1_combout\,
	combout => \btn_db_unit|Selector1~1_combout\);

-- Location: LCFF_X42_Y28_N5
\btn_db_unit|state_reg.WAIT0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \btn_db_unit|Selector1~1_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|state_reg.WAIT0~regout\);

-- Location: LCCOMB_X42_Y29_N4
\btn_db_unit|Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector7~0_combout\ = (\btn_db_unit|Add0~34_combout\) # ((!\btn_db_unit|state_reg.WAIT1~regout\ & !\btn_db_unit|state_reg.WAIT0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|state_reg.WAIT1~regout\,
	datac => \btn_db_unit|state_reg.WAIT0~regout\,
	datad => \btn_db_unit|Add0~34_combout\,
	combout => \btn_db_unit|Selector7~0_combout\);

-- Location: LCFF_X41_Y28_N15
\btn_db_unit|q_reg[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \btn_db_unit|Selector7~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \btn_db_unit|q_reg[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \btn_db_unit|q_reg\(17));

-- Location: LCCOMB_X41_Y28_N24
\btn_db_unit|Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Equal0~5_combout\ = (!\btn_db_unit|Add0~32_combout\ & (!\btn_db_unit|Add0~34_combout\ & (!\btn_db_unit|Add0~36_combout\ & !\btn_db_unit|Add0~38_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Add0~32_combout\,
	datab => \btn_db_unit|Add0~34_combout\,
	datac => \btn_db_unit|Add0~36_combout\,
	datad => \btn_db_unit|Add0~38_combout\,
	combout => \btn_db_unit|Equal0~5_combout\);

-- Location: LCCOMB_X42_Y28_N10
\btn_db_unit|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Selector2~0_combout\ = (!\btn_db_unit|Add0~40_combout\ & (\btn_db_unit|Equal0~5_combout\ & (\btn_db_unit|state_reg.WAIT0~regout\ & \btn_db_unit|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Add0~40_combout\,
	datab => \btn_db_unit|Equal0~5_combout\,
	datac => \btn_db_unit|state_reg.WAIT0~regout\,
	datad => \btn_db_unit|Equal0~4_combout\,
	combout => \btn_db_unit|Selector2~0_combout\);

-- Location: LCCOMB_X42_Y28_N24
\uart_unit|fifo_rx_unit|w_ptr_reg[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|w_ptr_reg[1]~0_combout\ = (\uart_unit|uart_rx_unit|Selector1~0_combout\ & (((!\btn~combout\ & \btn_db_unit|Selector2~0_combout\)) # (!\uart_unit|fifo_rx_unit|full_reg~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|full_reg~regout\,
	datab => \btn~combout\,
	datac => \uart_unit|uart_rx_unit|Selector1~0_combout\,
	datad => \btn_db_unit|Selector2~0_combout\,
	combout => \uart_unit|fifo_rx_unit|w_ptr_reg[1]~0_combout\);

-- Location: LCFF_X42_Y28_N23
\uart_unit|fifo_rx_unit|w_ptr_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|fifo_rx_unit|w_ptr_reg[0]~1_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|w_ptr_reg[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|w_ptr_reg\(0));

-- Location: LCCOMB_X45_Y28_N26
\uart_unit|fifo_rx_unit|r_ptr_reg[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|r_ptr_reg[0]~1_combout\ = !\uart_unit|fifo_rx_unit|r_ptr_reg\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	combout => \uart_unit|fifo_rx_unit|r_ptr_reg[0]~1_combout\);

-- Location: LCCOMB_X45_Y28_N14
\uart_unit|fifo_rx_unit|r_ptr_reg[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|r_ptr_reg[0]~0_combout\ = (!\btn~combout\ & (\btn_db_unit|Selector2~0_combout\ & ((\uart_unit|uart_rx_unit|Selector1~0_combout\) # (\uart_unit|fifo_rx_unit|empty_reg~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|Selector1~0_combout\,
	datab => \btn~combout\,
	datac => \uart_unit|fifo_rx_unit|empty_reg~regout\,
	datad => \btn_db_unit|Selector2~0_combout\,
	combout => \uart_unit|fifo_rx_unit|r_ptr_reg[0]~0_combout\);

-- Location: LCFF_X45_Y28_N27
\uart_unit|fifo_rx_unit|r_ptr_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|fifo_rx_unit|r_ptr_reg[0]~1_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \uart_unit|fifo_rx_unit|r_ptr_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|r_ptr_reg\(0));

-- Location: LCCOMB_X41_Y27_N2
\uart_unit|fifo_rx_unit|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|Add0~0_combout\ = \uart_unit|fifo_rx_unit|w_ptr_reg\(1) $ (\uart_unit|fifo_rx_unit|w_ptr_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|w_ptr_reg\(1),
	datad => \uart_unit|fifo_rx_unit|w_ptr_reg\(0),
	combout => \uart_unit|fifo_rx_unit|Add0~0_combout\);

-- Location: LCFF_X42_Y28_N13
\uart_unit|fifo_rx_unit|w_ptr_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|fifo_rx_unit|Add0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|w_ptr_reg[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|w_ptr_reg\(1));

-- Location: LCCOMB_X43_Y27_N2
\uart_unit|fifo_rx_unit|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|Mux4~0_combout\ = (\uart_unit|fifo_rx_unit|w_ptr_reg\(0) & (!\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) $ (!\uart_unit|fifo_rx_unit|w_ptr_reg\(1))))) # (!\uart_unit|fifo_rx_unit|w_ptr_reg\(0) & 
-- (\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) $ (\uart_unit|fifo_rx_unit|w_ptr_reg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100000100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datab => \uart_unit|fifo_rx_unit|w_ptr_reg\(0),
	datac => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	datad => \uart_unit|fifo_rx_unit|w_ptr_reg\(1),
	combout => \uart_unit|fifo_rx_unit|Mux4~0_combout\);

-- Location: LCCOMB_X43_Y27_N0
\uart_unit|fifo_rx_unit|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|Mux4~1_combout\ = (\uart_unit|uart_rx_unit|Selector1~0_combout\ & (((\uart_unit|fifo_rx_unit|empty_reg~regout\)) # (!\uart_unit|fifo_rx_unit|full_reg~regout\))) # (!\uart_unit|uart_rx_unit|Selector1~0_combout\ & 
-- (((\uart_unit|fifo_rx_unit|empty_reg~regout\ & !\uart_unit|fifo_rx_unit|Mux4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_rx_unit|Selector1~0_combout\,
	datab => \uart_unit|fifo_rx_unit|full_reg~regout\,
	datac => \uart_unit|fifo_rx_unit|empty_reg~regout\,
	datad => \uart_unit|fifo_rx_unit|Mux4~0_combout\,
	combout => \uart_unit|fifo_rx_unit|Mux4~1_combout\);

-- Location: LCCOMB_X43_Y27_N8
\uart_unit|fifo_rx_unit|Mux5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|Mux5~2_combout\ = \uart_unit|uart_rx_unit|Selector1~0_combout\ $ (((!\btn~combout\ & \btn_db_unit|Selector2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \btn~combout\,
	datac => \uart_unit|uart_rx_unit|Selector1~0_combout\,
	datad => \btn_db_unit|Selector2~0_combout\,
	combout => \uart_unit|fifo_rx_unit|Mux5~2_combout\);

-- Location: LCFF_X43_Y27_N1
\uart_unit|fifo_rx_unit|empty_reg\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|fifo_rx_unit|Mux4~1_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \uart_unit|fifo_rx_unit|Mux5~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|empty_reg~regout\);

-- Location: LCCOMB_X43_Y27_N14
\uart_unit|fifo_rx_unit|Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|Mux5~1_combout\ = (\uart_unit|fifo_rx_unit|full_reg~regout\ & (((\uart_unit|uart_rx_unit|Selector1~0_combout\) # (!\uart_unit|fifo_rx_unit|empty_reg~regout\)))) # (!\uart_unit|fifo_rx_unit|full_reg~regout\ & 
-- (\uart_unit|fifo_rx_unit|Mux5~0_combout\ & ((\uart_unit|uart_rx_unit|Selector1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|Mux5~0_combout\,
	datab => \uart_unit|fifo_rx_unit|empty_reg~regout\,
	datac => \uart_unit|fifo_rx_unit|full_reg~regout\,
	datad => \uart_unit|uart_rx_unit|Selector1~0_combout\,
	combout => \uart_unit|fifo_rx_unit|Mux5~1_combout\);

-- Location: LCFF_X43_Y27_N15
\uart_unit|fifo_rx_unit|full_reg\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|fifo_rx_unit|Mux5~1_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \uart_unit|fifo_rx_unit|Mux5~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|full_reg~regout\);

-- Location: LCCOMB_X41_Y27_N26
\uart_unit|fifo_rx_unit|array_reg~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~51_combout\ = (\uart_unit|fifo_rx_unit|w_ptr_reg\(1) & (\uart_unit|fifo_rx_unit|w_ptr_reg\(0) & (!\uart_unit|fifo_rx_unit|full_reg~regout\ & \uart_unit|uart_rx_unit|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|w_ptr_reg\(1),
	datab => \uart_unit|fifo_rx_unit|w_ptr_reg\(0),
	datac => \uart_unit|fifo_rx_unit|full_reg~regout\,
	datad => \uart_unit|uart_rx_unit|Selector1~0_combout\,
	combout => \uart_unit|fifo_rx_unit|array_reg~51_combout\);

-- Location: LCFF_X41_Y27_N7
\uart_unit|fifo_rx_unit|array_reg~24\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(0),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~24_regout\);

-- Location: LCCOMB_X45_Y27_N0
\uart_unit|fifo_rx_unit|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|Add1~0_combout\ = \uart_unit|fifo_rx_unit|r_ptr_reg\(0) $ (\uart_unit|fifo_rx_unit|r_ptr_reg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	datac => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	combout => \uart_unit|fifo_rx_unit|Add1~0_combout\);

-- Location: LCFF_X45_Y28_N17
\uart_unit|fifo_rx_unit|r_ptr_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|fifo_rx_unit|Add1~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|r_ptr_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|r_ptr_reg\(1));

-- Location: LCCOMB_X41_Y27_N28
\uart_unit|fifo_rx_unit|array_reg~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~48_combout\ = (\uart_unit|fifo_rx_unit|w_ptr_reg\(1) & (!\uart_unit|fifo_rx_unit|w_ptr_reg\(0) & (!\uart_unit|fifo_rx_unit|full_reg~regout\ & \uart_unit|uart_rx_unit|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|w_ptr_reg\(1),
	datab => \uart_unit|fifo_rx_unit|w_ptr_reg\(0),
	datac => \uart_unit|fifo_rx_unit|full_reg~regout\,
	datad => \uart_unit|uart_rx_unit|Selector1~0_combout\,
	combout => \uart_unit|fifo_rx_unit|array_reg~48_combout\);

-- Location: LCFF_X41_Y27_N5
\uart_unit|fifo_rx_unit|array_reg~16\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(0),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~16_regout\);

-- Location: LCCOMB_X43_Y27_N20
\uart_unit|fifo_rx_unit|array_reg~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~50_combout\ = (!\uart_unit|fifo_rx_unit|w_ptr_reg\(1) & (!\uart_unit|fifo_rx_unit|w_ptr_reg\(0) & (!\uart_unit|fifo_rx_unit|full_reg~regout\ & \uart_unit|uart_rx_unit|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|w_ptr_reg\(1),
	datab => \uart_unit|fifo_rx_unit|w_ptr_reg\(0),
	datac => \uart_unit|fifo_rx_unit|full_reg~regout\,
	datad => \uart_unit|uart_rx_unit|Selector1~0_combout\,
	combout => \uart_unit|fifo_rx_unit|array_reg~50_combout\);

-- Location: LCFF_X42_Y27_N3
\uart_unit|fifo_rx_unit|array_reg~0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(0),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~0_regout\);

-- Location: LCCOMB_X42_Y27_N2
\uart_unit|fifo_rx_unit|array_reg~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~32_combout\ = (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & (((\uart_unit|fifo_rx_unit|r_ptr_reg\(0))))) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & ((\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & 
-- (\uart_unit|fifo_rx_unit|array_reg~8_regout\)) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & ((\uart_unit|fifo_rx_unit|array_reg~0_regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~8_regout\,
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datac => \uart_unit|fifo_rx_unit|array_reg~0_regout\,
	datad => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	combout => \uart_unit|fifo_rx_unit|array_reg~32_combout\);

-- Location: LCCOMB_X41_Y27_N4
\uart_unit|fifo_rx_unit|array_reg~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~33_combout\ = (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & ((\uart_unit|fifo_rx_unit|array_reg~32_combout\ & (\uart_unit|fifo_rx_unit|array_reg~24_regout\)) # (!\uart_unit|fifo_rx_unit|array_reg~32_combout\ & 
-- ((\uart_unit|fifo_rx_unit|array_reg~16_regout\))))) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & (((\uart_unit|fifo_rx_unit|array_reg~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~24_regout\,
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datac => \uart_unit|fifo_rx_unit|array_reg~16_regout\,
	datad => \uart_unit|fifo_rx_unit|array_reg~32_combout\,
	combout => \uart_unit|fifo_rx_unit|array_reg~33_combout\);

-- Location: LCFF_X40_Y27_N25
\uart_unit|fifo_rx_unit|array_reg~17\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(1),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~17_regout\);

-- Location: LCFF_X41_Y27_N25
\uart_unit|fifo_rx_unit|array_reg~25\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(1),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~25_regout\);

-- Location: LCFF_X42_Y27_N23
\uart_unit|fifo_rx_unit|array_reg~1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(1),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~1_regout\);

-- Location: LCCOMB_X42_Y27_N22
\uart_unit|fifo_rx_unit|array_reg~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~34_combout\ = (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & (((\uart_unit|fifo_rx_unit|r_ptr_reg\(0))))) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & ((\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & 
-- (\uart_unit|fifo_rx_unit|array_reg~9_regout\)) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & ((\uart_unit|fifo_rx_unit|array_reg~1_regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~9_regout\,
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datac => \uart_unit|fifo_rx_unit|array_reg~1_regout\,
	datad => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	combout => \uart_unit|fifo_rx_unit|array_reg~34_combout\);

-- Location: LCCOMB_X41_Y27_N24
\uart_unit|fifo_rx_unit|array_reg~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~35_combout\ = (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & ((\uart_unit|fifo_rx_unit|array_reg~34_combout\ & ((\uart_unit|fifo_rx_unit|array_reg~25_regout\))) # (!\uart_unit|fifo_rx_unit|array_reg~34_combout\ & 
-- (\uart_unit|fifo_rx_unit|array_reg~17_regout\)))) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & (((\uart_unit|fifo_rx_unit|array_reg~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~17_regout\,
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datac => \uart_unit|fifo_rx_unit|array_reg~25_regout\,
	datad => \uart_unit|fifo_rx_unit|array_reg~34_combout\,
	combout => \uart_unit|fifo_rx_unit|array_reg~35_combout\);

-- Location: LCCOMB_X43_Y27_N30
\uart_unit|fifo_rx_unit|array_reg~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~49_combout\ = (!\uart_unit|fifo_rx_unit|w_ptr_reg\(1) & (\uart_unit|fifo_rx_unit|w_ptr_reg\(0) & (!\uart_unit|fifo_rx_unit|full_reg~regout\ & \uart_unit|uart_rx_unit|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|w_ptr_reg\(1),
	datab => \uart_unit|fifo_rx_unit|w_ptr_reg\(0),
	datac => \uart_unit|fifo_rx_unit|full_reg~regout\,
	datad => \uart_unit|uart_rx_unit|Selector1~0_combout\,
	combout => \uart_unit|fifo_rx_unit|array_reg~49_combout\);

-- Location: LCFF_X42_Y27_N9
\uart_unit|fifo_rx_unit|array_reg~10\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(2),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~10_regout\);

-- Location: LCFF_X43_Y27_N13
\uart_unit|fifo_rx_unit|array_reg~26\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(2),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~26_regout\);

-- Location: LCFF_X42_Y27_N15
\uart_unit|fifo_rx_unit|array_reg~2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(2),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~2_regout\);

-- Location: LCCOMB_X42_Y27_N14
\uart_unit|fifo_rx_unit|array_reg~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~36_combout\ = (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & ((\uart_unit|fifo_rx_unit|array_reg~18_regout\) # ((\uart_unit|fifo_rx_unit|r_ptr_reg\(0))))) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & 
-- (((\uart_unit|fifo_rx_unit|array_reg~2_regout\ & !\uart_unit|fifo_rx_unit|r_ptr_reg\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~18_regout\,
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datac => \uart_unit|fifo_rx_unit|array_reg~2_regout\,
	datad => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	combout => \uart_unit|fifo_rx_unit|array_reg~36_combout\);

-- Location: LCCOMB_X43_Y27_N12
\uart_unit|fifo_rx_unit|array_reg~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~37_combout\ = (\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & ((\uart_unit|fifo_rx_unit|array_reg~36_combout\ & ((\uart_unit|fifo_rx_unit|array_reg~26_regout\))) # (!\uart_unit|fifo_rx_unit|array_reg~36_combout\ & 
-- (\uart_unit|fifo_rx_unit|array_reg~10_regout\)))) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & (((\uart_unit|fifo_rx_unit|array_reg~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~10_regout\,
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	datac => \uart_unit|fifo_rx_unit|array_reg~26_regout\,
	datad => \uart_unit|fifo_rx_unit|array_reg~36_combout\,
	combout => \uart_unit|fifo_rx_unit|array_reg~37_combout\);

-- Location: LCFF_X42_Y27_N7
\uart_unit|fifo_rx_unit|array_reg~3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(3),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~3_regout\);

-- Location: LCCOMB_X42_Y27_N6
\uart_unit|fifo_rx_unit|array_reg~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~38_combout\ = (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & (((\uart_unit|fifo_rx_unit|r_ptr_reg\(0))))) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & ((\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & 
-- (\uart_unit|fifo_rx_unit|array_reg~11_regout\)) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & ((\uart_unit|fifo_rx_unit|array_reg~3_regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~11_regout\,
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datac => \uart_unit|fifo_rx_unit|array_reg~3_regout\,
	datad => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	combout => \uart_unit|fifo_rx_unit|array_reg~38_combout\);

-- Location: LCFF_X41_Y27_N1
\uart_unit|fifo_rx_unit|array_reg~19\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(3),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~19_regout\);

-- Location: LCFF_X41_Y27_N19
\uart_unit|fifo_rx_unit|array_reg~27\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(3),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~27_regout\);

-- Location: LCCOMB_X41_Y27_N0
\uart_unit|fifo_rx_unit|array_reg~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~39_combout\ = (\uart_unit|fifo_rx_unit|array_reg~38_combout\ & (((\uart_unit|fifo_rx_unit|array_reg~27_regout\)) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(1)))) # (!\uart_unit|fifo_rx_unit|array_reg~38_combout\ & 
-- (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & (\uart_unit|fifo_rx_unit|array_reg~19_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~38_combout\,
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datac => \uart_unit|fifo_rx_unit|array_reg~19_regout\,
	datad => \uart_unit|fifo_rx_unit|array_reg~27_regout\,
	combout => \uart_unit|fifo_rx_unit|array_reg~39_combout\);

-- Location: LCCOMB_X41_Y27_N22
\uart_unit|fifo_rx_unit|array_reg~28feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~28feeder_combout\ = \uart_unit|uart_rx_unit|b_reg\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_unit|uart_rx_unit|b_reg\(4),
	combout => \uart_unit|fifo_rx_unit|array_reg~28feeder_combout\);

-- Location: LCFF_X41_Y27_N23
\uart_unit|fifo_rx_unit|array_reg~28\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|fifo_rx_unit|array_reg~28feeder_combout\,
	ena => \uart_unit|fifo_rx_unit|array_reg~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~28_regout\);

-- Location: LCFF_X42_Y27_N29
\uart_unit|fifo_rx_unit|array_reg~12\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(4),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~12_regout\);

-- Location: LCFF_X42_Y27_N11
\uart_unit|fifo_rx_unit|array_reg~4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(4),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~4_regout\);

-- Location: LCCOMB_X41_Y27_N16
\uart_unit|fifo_rx_unit|array_reg~20feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~20feeder_combout\ = \uart_unit|uart_rx_unit|b_reg\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_unit|uart_rx_unit|b_reg\(4),
	combout => \uart_unit|fifo_rx_unit|array_reg~20feeder_combout\);

-- Location: LCFF_X41_Y27_N17
\uart_unit|fifo_rx_unit|array_reg~20\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|fifo_rx_unit|array_reg~20feeder_combout\,
	ena => \uart_unit|fifo_rx_unit|array_reg~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~20_regout\);

-- Location: LCCOMB_X42_Y27_N10
\uart_unit|fifo_rx_unit|array_reg~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~40_combout\ = (\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & (\uart_unit|fifo_rx_unit|r_ptr_reg\(1))) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & ((\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & 
-- ((\uart_unit|fifo_rx_unit|array_reg~20_regout\))) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & (\uart_unit|fifo_rx_unit|array_reg~4_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datac => \uart_unit|fifo_rx_unit|array_reg~4_regout\,
	datad => \uart_unit|fifo_rx_unit|array_reg~20_regout\,
	combout => \uart_unit|fifo_rx_unit|array_reg~40_combout\);

-- Location: LCCOMB_X42_Y27_N28
\uart_unit|fifo_rx_unit|array_reg~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~41_combout\ = (\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & ((\uart_unit|fifo_rx_unit|array_reg~40_combout\ & (\uart_unit|fifo_rx_unit|array_reg~28_regout\)) # (!\uart_unit|fifo_rx_unit|array_reg~40_combout\ & 
-- ((\uart_unit|fifo_rx_unit|array_reg~12_regout\))))) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & (((\uart_unit|fifo_rx_unit|array_reg~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	datab => \uart_unit|fifo_rx_unit|array_reg~28_regout\,
	datac => \uart_unit|fifo_rx_unit|array_reg~12_regout\,
	datad => \uart_unit|fifo_rx_unit|array_reg~40_combout\,
	combout => \uart_unit|fifo_rx_unit|array_reg~41_combout\);

-- Location: LCFF_X42_Y27_N27
\uart_unit|fifo_rx_unit|array_reg~5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(5),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~5_regout\);

-- Location: LCCOMB_X42_Y27_N26
\uart_unit|fifo_rx_unit|array_reg~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~42_combout\ = (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & (((\uart_unit|fifo_rx_unit|r_ptr_reg\(0))))) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & ((\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & 
-- (\uart_unit|fifo_rx_unit|array_reg~13_regout\)) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & ((\uart_unit|fifo_rx_unit|array_reg~5_regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~13_regout\,
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datac => \uart_unit|fifo_rx_unit|array_reg~5_regout\,
	datad => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	combout => \uart_unit|fifo_rx_unit|array_reg~42_combout\);

-- Location: LCFF_X41_Y27_N21
\uart_unit|fifo_rx_unit|array_reg~21\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(5),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~21_regout\);

-- Location: LCFF_X41_Y27_N3
\uart_unit|fifo_rx_unit|array_reg~29\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(5),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~29_regout\);

-- Location: LCCOMB_X41_Y27_N20
\uart_unit|fifo_rx_unit|array_reg~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~43_combout\ = (\uart_unit|fifo_rx_unit|array_reg~42_combout\ & (((\uart_unit|fifo_rx_unit|array_reg~29_regout\)) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(1)))) # (!\uart_unit|fifo_rx_unit|array_reg~42_combout\ & 
-- (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & (\uart_unit|fifo_rx_unit|array_reg~21_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~42_combout\,
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datac => \uart_unit|fifo_rx_unit|array_reg~21_regout\,
	datad => \uart_unit|fifo_rx_unit|array_reg~29_regout\,
	combout => \uart_unit|fifo_rx_unit|array_reg~43_combout\);

-- Location: LCCOMB_X41_Y27_N30
\uart_unit|fifo_rx_unit|array_reg~30feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~30feeder_combout\ = \uart_unit|uart_rx_unit|b_reg\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uart_unit|uart_rx_unit|b_reg\(6),
	combout => \uart_unit|fifo_rx_unit|array_reg~30feeder_combout\);

-- Location: LCFF_X41_Y27_N31
\uart_unit|fifo_rx_unit|array_reg~30\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|fifo_rx_unit|array_reg~30feeder_combout\,
	ena => \uart_unit|fifo_rx_unit|array_reg~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~30_regout\);

-- Location: LCFF_X42_Y27_N19
\uart_unit|fifo_rx_unit|array_reg~6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(6),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~6_regout\);

-- Location: LCCOMB_X42_Y27_N18
\uart_unit|fifo_rx_unit|array_reg~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~44_combout\ = (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & ((\uart_unit|fifo_rx_unit|array_reg~22_regout\) # ((\uart_unit|fifo_rx_unit|r_ptr_reg\(0))))) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & 
-- (((\uart_unit|fifo_rx_unit|array_reg~6_regout\ & !\uart_unit|fifo_rx_unit|r_ptr_reg\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~22_regout\,
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datac => \uart_unit|fifo_rx_unit|array_reg~6_regout\,
	datad => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	combout => \uart_unit|fifo_rx_unit|array_reg~44_combout\);

-- Location: LCFF_X42_Y27_N1
\uart_unit|fifo_rx_unit|array_reg~14\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(6),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~14_regout\);

-- Location: LCCOMB_X42_Y27_N0
\uart_unit|fifo_rx_unit|array_reg~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~45_combout\ = (\uart_unit|fifo_rx_unit|array_reg~44_combout\ & ((\uart_unit|fifo_rx_unit|array_reg~30_regout\) # ((!\uart_unit|fifo_rx_unit|r_ptr_reg\(0))))) # (!\uart_unit|fifo_rx_unit|array_reg~44_combout\ & 
-- (((\uart_unit|fifo_rx_unit|array_reg~14_regout\ & \uart_unit|fifo_rx_unit|r_ptr_reg\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~30_regout\,
	datab => \uart_unit|fifo_rx_unit|array_reg~44_combout\,
	datac => \uart_unit|fifo_rx_unit|array_reg~14_regout\,
	datad => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	combout => \uart_unit|fifo_rx_unit|array_reg~45_combout\);

-- Location: LCFF_X41_Y27_N11
\uart_unit|fifo_rx_unit|array_reg~31\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(7),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~31_regout\);

-- Location: LCFF_X41_Y27_N13
\uart_unit|fifo_rx_unit|array_reg~23\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(7),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~23_regout\);

-- Location: LCFF_X42_Y27_N31
\uart_unit|fifo_rx_unit|array_reg~7\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_rx_unit|b_reg\(7),
	sload => VCC,
	ena => \uart_unit|fifo_rx_unit|array_reg~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|fifo_rx_unit|array_reg~7_regout\);

-- Location: LCCOMB_X42_Y27_N30
\uart_unit|fifo_rx_unit|array_reg~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~46_combout\ = (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & (((\uart_unit|fifo_rx_unit|r_ptr_reg\(0))))) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & ((\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & 
-- (\uart_unit|fifo_rx_unit|array_reg~15_regout\)) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(0) & ((\uart_unit|fifo_rx_unit|array_reg~7_regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~15_regout\,
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datac => \uart_unit|fifo_rx_unit|array_reg~7_regout\,
	datad => \uart_unit|fifo_rx_unit|r_ptr_reg\(0),
	combout => \uart_unit|fifo_rx_unit|array_reg~46_combout\);

-- Location: LCCOMB_X41_Y27_N12
\uart_unit|fifo_rx_unit|array_reg~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|fifo_rx_unit|array_reg~47_combout\ = (\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & ((\uart_unit|fifo_rx_unit|array_reg~46_combout\ & (\uart_unit|fifo_rx_unit|array_reg~31_regout\)) # (!\uart_unit|fifo_rx_unit|array_reg~46_combout\ & 
-- ((\uart_unit|fifo_rx_unit|array_reg~23_regout\))))) # (!\uart_unit|fifo_rx_unit|r_ptr_reg\(1) & (((\uart_unit|fifo_rx_unit|array_reg~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~31_regout\,
	datab => \uart_unit|fifo_rx_unit|r_ptr_reg\(1),
	datac => \uart_unit|fifo_rx_unit|array_reg~23_regout\,
	datad => \uart_unit|fifo_rx_unit|array_reg~46_combout\,
	combout => \uart_unit|fifo_rx_unit|array_reg~47_combout\);

-- Location: PIN_AD15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G14
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: LCCOMB_X41_Y29_N2
\btn_db_unit|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|Equal0~1_combout\ = (!\btn_db_unit|Add0~8_combout\ & (!\btn_db_unit|Add0~10_combout\ & (!\btn_db_unit|Add0~12_combout\ & !\btn_db_unit|Add0~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Add0~8_combout\,
	datab => \btn_db_unit|Add0~10_combout\,
	datac => \btn_db_unit|Add0~12_combout\,
	datad => \btn_db_unit|Add0~14_combout\,
	combout => \btn_db_unit|Equal0~1_combout\);

-- Location: LCCOMB_X41_Y29_N6
\btn_db_unit|db_tick~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|db_tick~0_combout\ = (!\btn~combout\ & (\btn_db_unit|state_reg.WAIT0~regout\ & (\btn_db_unit|Equal0~0_combout\ & \btn_db_unit|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn~combout\,
	datab => \btn_db_unit|state_reg.WAIT0~regout\,
	datac => \btn_db_unit|Equal0~0_combout\,
	datad => \btn_db_unit|Equal0~1_combout\,
	combout => \btn_db_unit|db_tick~0_combout\);

-- Location: LCCOMB_X41_Y28_N30
\btn_db_unit|db_tick~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|db_tick~1_combout\ = (!\btn_db_unit|Add0~40_combout\ & (!\btn_db_unit|Add0~36_combout\ & (\btn_db_unit|Equal0~2_combout\ & !\btn_db_unit|Add0~38_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Add0~40_combout\,
	datab => \btn_db_unit|Add0~36_combout\,
	datac => \btn_db_unit|Equal0~2_combout\,
	datad => \btn_db_unit|Add0~38_combout\,
	combout => \btn_db_unit|db_tick~1_combout\);

-- Location: LCCOMB_X40_Y28_N10
\btn_db_unit|db_tick~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \btn_db_unit|db_tick~2_combout\ = (\btn_db_unit|Equal0~7_combout\ & (\btn_db_unit|Equal0~3_combout\ & (\btn_db_unit|db_tick~0_combout\ & \btn_db_unit|db_tick~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|Equal0~7_combout\,
	datab => \btn_db_unit|Equal0~3_combout\,
	datac => \btn_db_unit|db_tick~0_combout\,
	datad => \btn_db_unit|db_tick~1_combout\,
	combout => \btn_db_unit|db_tick~2_combout\);

-- Location: LCCOMB_X40_Y28_N26
\uart_unit|uart_tx_unit|n_reg[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|n_reg[2]~1_combout\ = (\uart_unit|uart_tx_unit|n_reg[2]~0_combout\ & (!\uart_unit|uart_tx_unit|Selector1~0_combout\ & ((\uart_unit|uart_tx_unit|state_reg.IDLE~regout\) # (!\btn_db_unit|db_tick~2_combout\)))) # 
-- (!\uart_unit|uart_tx_unit|n_reg[2]~0_combout\ & ((\uart_unit|uart_tx_unit|state_reg.IDLE~regout\) # ((!\btn_db_unit|db_tick~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|n_reg[2]~0_combout\,
	datab => \uart_unit|uart_tx_unit|state_reg.IDLE~regout\,
	datac => \uart_unit|uart_tx_unit|Selector1~0_combout\,
	datad => \btn_db_unit|db_tick~2_combout\,
	combout => \uart_unit|uart_tx_unit|n_reg[2]~1_combout\);

-- Location: LCCOMB_X40_Y28_N28
\uart_unit|uart_tx_unit|n_reg[0]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|n_reg[0]~4_combout\ = (\uart_unit|uart_tx_unit|n_reg\(0) & ((\uart_unit|uart_tx_unit|n_reg[2]~1_combout\))) # (!\uart_unit|uart_tx_unit|n_reg\(0) & (\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & 
-- !\uart_unit|uart_tx_unit|n_reg[2]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datac => \uart_unit|uart_tx_unit|n_reg\(0),
	datad => \uart_unit|uart_tx_unit|n_reg[2]~1_combout\,
	combout => \uart_unit|uart_tx_unit|n_reg[0]~4_combout\);

-- Location: LCFF_X40_Y28_N29
\uart_unit|uart_tx_unit|n_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|n_reg[0]~4_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|n_reg\(0));

-- Location: LCCOMB_X40_Y28_N14
\uart_unit|uart_tx_unit|n_reg[1]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|n_reg[1]~3_combout\ = (\uart_unit|uart_tx_unit|n_reg[2]~1_combout\ & (((\uart_unit|uart_tx_unit|n_reg\(1))))) # (!\uart_unit|uart_tx_unit|n_reg[2]~1_combout\ & (\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & 
-- (\uart_unit|uart_tx_unit|n_reg\(0) $ (\uart_unit|uart_tx_unit|n_reg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datab => \uart_unit|uart_tx_unit|n_reg\(0),
	datac => \uart_unit|uart_tx_unit|n_reg\(1),
	datad => \uart_unit|uart_tx_unit|n_reg[2]~1_combout\,
	combout => \uart_unit|uart_tx_unit|n_reg[1]~3_combout\);

-- Location: LCFF_X40_Y28_N15
\uart_unit|uart_tx_unit|n_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|n_reg[1]~3_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|n_reg\(1));

-- Location: LCCOMB_X39_Y28_N26
\uart_unit|uart_tx_unit|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Add1~0_combout\ = (\uart_unit|uart_tx_unit|n_reg\(1) & \uart_unit|uart_tx_unit|n_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_unit|uart_tx_unit|n_reg\(1),
	datad => \uart_unit|uart_tx_unit|n_reg\(0),
	combout => \uart_unit|uart_tx_unit|Add1~0_combout\);

-- Location: LCCOMB_X40_Y28_N16
\uart_unit|uart_tx_unit|n_reg[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|n_reg[2]~2_combout\ = (\uart_unit|uart_tx_unit|n_reg[2]~1_combout\ & (((\uart_unit|uart_tx_unit|n_reg\(2))))) # (!\uart_unit|uart_tx_unit|n_reg[2]~1_combout\ & (\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & 
-- (\uart_unit|uart_tx_unit|Add1~0_combout\ $ (\uart_unit|uart_tx_unit|n_reg\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datab => \uart_unit|uart_tx_unit|Add1~0_combout\,
	datac => \uart_unit|uart_tx_unit|n_reg\(2),
	datad => \uart_unit|uart_tx_unit|n_reg[2]~1_combout\,
	combout => \uart_unit|uart_tx_unit|n_reg[2]~2_combout\);

-- Location: LCFF_X40_Y28_N17
\uart_unit|uart_tx_unit|n_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|n_reg[2]~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|n_reg\(2));

-- Location: LCCOMB_X40_Y28_N2
\uart_unit|uart_tx_unit|n_reg[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|n_reg[2]~0_combout\ = (\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & (((!\uart_unit|uart_tx_unit|n_reg\(2)) # (!\uart_unit|uart_tx_unit|n_reg\(1))) # (!\uart_unit|uart_tx_unit|n_reg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datab => \uart_unit|uart_tx_unit|n_reg\(0),
	datac => \uart_unit|uart_tx_unit|n_reg\(1),
	datad => \uart_unit|uart_tx_unit|n_reg\(2),
	combout => \uart_unit|uart_tx_unit|n_reg[2]~0_combout\);

-- Location: LCCOMB_X40_Y28_N8
\uart_unit|uart_tx_unit|Selector1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector1~2_combout\ = (\uart_unit|uart_tx_unit|n_reg[2]~0_combout\) # ((\uart_unit|uart_tx_unit|state_reg.IDLE~regout\ & ((!\uart_unit|uart_tx_unit|Selector1~0_combout\) # (!\uart_unit|uart_tx_unit|state_reg.DATA~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datab => \uart_unit|uart_tx_unit|state_reg.IDLE~regout\,
	datac => \uart_unit|uart_tx_unit|Selector1~0_combout\,
	datad => \uart_unit|uart_tx_unit|n_reg[2]~0_combout\,
	combout => \uart_unit|uart_tx_unit|Selector1~2_combout\);

-- Location: LCCOMB_X40_Y28_N4
\uart_unit|uart_tx_unit|Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector1~1_combout\ = (\uart_unit|uart_tx_unit|Equal1~0_combout\) # (((!\uart_unit|uart_tx_unit|state_reg.START~regout\ & !\uart_unit|uart_tx_unit|state_reg.STOP~regout\)) # (!\uart_unit|baud_gen_unit|Equal0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|state_reg.START~regout\,
	datab => \uart_unit|uart_tx_unit|Equal1~0_combout\,
	datac => \uart_unit|uart_tx_unit|state_reg.STOP~regout\,
	datad => \uart_unit|baud_gen_unit|Equal0~2_combout\,
	combout => \uart_unit|uart_tx_unit|Selector1~1_combout\);

-- Location: LCCOMB_X40_Y28_N12
\uart_unit|uart_tx_unit|Selector1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector1~3_combout\ = (\uart_unit|uart_tx_unit|Selector1~1_combout\ & ((\uart_unit|uart_tx_unit|Selector1~2_combout\) # ((!\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & !\btn_db_unit|db_tick~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datab => \uart_unit|uart_tx_unit|Selector1~2_combout\,
	datac => \uart_unit|uart_tx_unit|Selector1~1_combout\,
	datad => \btn_db_unit|db_tick~2_combout\,
	combout => \uart_unit|uart_tx_unit|Selector1~3_combout\);

-- Location: LCCOMB_X40_Y28_N18
\uart_unit|uart_tx_unit|state_reg.IDLE~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|state_reg.IDLE~0_combout\ = (\uart_unit|uart_tx_unit|Selector1~3_combout\ & (((\uart_unit|uart_tx_unit|state_reg.IDLE~regout\)))) # (!\uart_unit|uart_tx_unit|Selector1~3_combout\ & 
-- (((!\uart_unit|uart_tx_unit|state_reg.STOP~regout\)) # (!\uart_unit|uart_tx_unit|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|Selector1~0_combout\,
	datab => \uart_unit|uart_tx_unit|state_reg.STOP~regout\,
	datac => \uart_unit|uart_tx_unit|state_reg.IDLE~regout\,
	datad => \uart_unit|uart_tx_unit|Selector1~3_combout\,
	combout => \uart_unit|uart_tx_unit|state_reg.IDLE~0_combout\);

-- Location: LCFF_X40_Y28_N19
\uart_unit|uart_tx_unit|state_reg.IDLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|state_reg.IDLE~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|state_reg.IDLE~regout\);

-- Location: LCCOMB_X39_Y28_N18
\uart_unit|uart_tx_unit|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector3~0_combout\ = (\uart_unit|uart_tx_unit|state_reg.STOP~regout\) # (!\uart_unit|uart_tx_unit|state_reg.START~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uart_unit|uart_tx_unit|state_reg.STOP~regout\,
	datad => \uart_unit|uart_tx_unit|state_reg.START~regout\,
	combout => \uart_unit|uart_tx_unit|Selector3~0_combout\);

-- Location: LCCOMB_X40_Y28_N20
\uart_unit|uart_tx_unit|Selector3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector3~1_combout\ = (\uart_unit|uart_tx_unit|Selector1~3_combout\ & (((\uart_unit|uart_tx_unit|state_reg.DATA~regout\)))) # (!\uart_unit|uart_tx_unit|Selector1~3_combout\ & (\uart_unit|uart_tx_unit|Selector1~0_combout\ & 
-- (!\uart_unit|uart_tx_unit|Selector3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|Selector1~0_combout\,
	datab => \uart_unit|uart_tx_unit|Selector3~0_combout\,
	datac => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datad => \uart_unit|uart_tx_unit|Selector1~3_combout\,
	combout => \uart_unit|uart_tx_unit|Selector3~1_combout\);

-- Location: LCFF_X40_Y28_N21
\uart_unit|uart_tx_unit|state_reg.DATA\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|Selector3~1_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|state_reg.DATA~regout\);

-- Location: LCCOMB_X39_Y28_N24
\uart_unit|uart_tx_unit|Selector4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector4~1_combout\ = (\uart_unit|uart_tx_unit|n_reg\(2) & (\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & (\uart_unit|uart_tx_unit|Add1~0_combout\ & \uart_unit|uart_tx_unit|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|n_reg\(2),
	datab => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datac => \uart_unit|uart_tx_unit|Add1~0_combout\,
	datad => \uart_unit|uart_tx_unit|Selector1~0_combout\,
	combout => \uart_unit|uart_tx_unit|Selector4~1_combout\);

-- Location: LCCOMB_X39_Y28_N30
\uart_unit|uart_tx_unit|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector2~0_combout\ = (\uart_unit|uart_tx_unit|state_reg.START~regout\ & (!\uart_unit|uart_tx_unit|Selector4~1_combout\ & !\uart_unit|uart_tx_unit|Selector1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|state_reg.START~regout\,
	datac => \uart_unit|uart_tx_unit|Selector4~1_combout\,
	datad => \uart_unit|uart_tx_unit|Selector1~0_combout\,
	combout => \uart_unit|uart_tx_unit|Selector2~0_combout\);

-- Location: LCCOMB_X40_Y28_N6
\uart_unit|uart_tx_unit|Selector2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector2~1_combout\ = (\uart_unit|uart_tx_unit|Selector2~0_combout\) # ((\btn_db_unit|db_tick~2_combout\ & (!\uart_unit|uart_tx_unit|state_reg.IDLE~regout\ & !\uart_unit|uart_tx_unit|Selector4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn_db_unit|db_tick~2_combout\,
	datab => \uart_unit|uart_tx_unit|state_reg.IDLE~regout\,
	datac => \uart_unit|uart_tx_unit|Selector2~0_combout\,
	datad => \uart_unit|uart_tx_unit|Selector4~1_combout\,
	combout => \uart_unit|uart_tx_unit|Selector2~1_combout\);

-- Location: LCFF_X40_Y28_N7
\uart_unit|uart_tx_unit|state_reg.START\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|Selector2~1_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|state_reg.START~regout\);

-- Location: LCCOMB_X42_Y28_N16
\uart_unit|uart_tx_unit|s_reg[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|s_reg[0]~0_combout\ = (\uart_unit|uart_tx_unit|state_reg.IDLE~regout\ & ((\uart_unit|uart_tx_unit|Equal1~0_combout\) # ((!\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & !\uart_unit|uart_tx_unit|state_reg.START~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datab => \uart_unit|uart_tx_unit|state_reg.START~regout\,
	datac => \uart_unit|uart_tx_unit|Equal1~0_combout\,
	datad => \uart_unit|uart_tx_unit|state_reg.IDLE~regout\,
	combout => \uart_unit|uart_tx_unit|s_reg[0]~0_combout\);

-- Location: LCCOMB_X43_Y28_N20
\uart_unit|uart_tx_unit|s_reg[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|s_reg[2]~1_combout\ = (\uart_unit|uart_tx_unit|state_reg.START~regout\) # ((\uart_unit|uart_tx_unit|state_reg.STOP~regout\) # (\uart_unit|uart_tx_unit|state_reg.DATA~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|state_reg.START~regout\,
	datab => \uart_unit|uart_tx_unit|state_reg.STOP~regout\,
	datad => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	combout => \uart_unit|uart_tx_unit|s_reg[2]~1_combout\);

-- Location: LCCOMB_X43_Y28_N14
\uart_unit|uart_tx_unit|s_reg[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|s_reg[2]~2_combout\ = (\uart_unit|uart_tx_unit|Equal1~0_combout\ & (((\uart_unit|uart_tx_unit|s_reg[2]~1_combout\ & !\uart_unit|baud_gen_unit|Equal0~2_combout\)))) # (!\uart_unit|uart_tx_unit|Equal1~0_combout\ & 
-- ((\uart_unit|uart_tx_unit|state_reg.STOP~regout\) # ((\uart_unit|uart_tx_unit|s_reg[2]~1_combout\ & !\uart_unit|baud_gen_unit|Equal0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|Equal1~0_combout\,
	datab => \uart_unit|uart_tx_unit|state_reg.STOP~regout\,
	datac => \uart_unit|uart_tx_unit|s_reg[2]~1_combout\,
	datad => \uart_unit|baud_gen_unit|Equal0~2_combout\,
	combout => \uart_unit|uart_tx_unit|s_reg[2]~2_combout\);

-- Location: LCCOMB_X43_Y28_N28
\uart_unit|uart_tx_unit|s_reg[2]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|s_reg[2]~3_combout\ = (\uart_unit|uart_tx_unit|s_reg[2]~2_combout\) # ((!\uart_unit|uart_tx_unit|state_reg.IDLE~regout\ & ((\btn~combout\) # (!\btn_db_unit|Selector2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|state_reg.IDLE~regout\,
	datab => \btn~combout\,
	datac => \uart_unit|uart_tx_unit|s_reg[2]~2_combout\,
	datad => \btn_db_unit|Selector2~0_combout\,
	combout => \uart_unit|uart_tx_unit|s_reg[2]~3_combout\);

-- Location: LCCOMB_X43_Y28_N6
\uart_unit|uart_tx_unit|s_reg[2]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|s_reg[2]~5_combout\ = (\uart_unit|uart_tx_unit|s_reg[2]~3_combout\ & (((\uart_unit|uart_tx_unit|s_reg\(2))))) # (!\uart_unit|uart_tx_unit|s_reg[2]~3_combout\ & (\uart_unit|uart_tx_unit|Add0~1_combout\ & 
-- (\uart_unit|uart_tx_unit|s_reg[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|Add0~1_combout\,
	datab => \uart_unit|uart_tx_unit|s_reg[0]~0_combout\,
	datac => \uart_unit|uart_tx_unit|s_reg\(2),
	datad => \uart_unit|uart_tx_unit|s_reg[2]~3_combout\,
	combout => \uart_unit|uart_tx_unit|s_reg[2]~5_combout\);

-- Location: LCFF_X43_Y28_N7
\uart_unit|uart_tx_unit|s_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|s_reg[2]~5_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|s_reg\(2));

-- Location: LCCOMB_X43_Y28_N0
\uart_unit|uart_tx_unit|s_reg[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|s_reg[3]~4_combout\ = (\uart_unit|uart_tx_unit|s_reg[2]~3_combout\ & (((\uart_unit|uart_tx_unit|s_reg\(3))))) # (!\uart_unit|uart_tx_unit|s_reg[2]~3_combout\ & (\uart_unit|uart_tx_unit|Add0~0_combout\ & 
-- (\uart_unit|uart_tx_unit|s_reg[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|Add0~0_combout\,
	datab => \uart_unit|uart_tx_unit|s_reg[0]~0_combout\,
	datac => \uart_unit|uart_tx_unit|s_reg\(3),
	datad => \uart_unit|uart_tx_unit|s_reg[2]~3_combout\,
	combout => \uart_unit|uart_tx_unit|s_reg[3]~4_combout\);

-- Location: LCFF_X43_Y28_N1
\uart_unit|uart_tx_unit|s_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|s_reg[3]~4_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|s_reg\(3));

-- Location: LCCOMB_X43_Y28_N16
\uart_unit|uart_tx_unit|s_reg[1]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|s_reg[1]~6_combout\ = (\uart_unit|uart_tx_unit|s_reg[2]~3_combout\ & (((\uart_unit|uart_tx_unit|s_reg\(1))))) # (!\uart_unit|uart_tx_unit|s_reg[2]~3_combout\ & (\uart_unit|uart_tx_unit|s_reg[0]~0_combout\ & 
-- (\uart_unit|uart_tx_unit|s_reg\(0) $ (\uart_unit|uart_tx_unit|s_reg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|s_reg\(0),
	datab => \uart_unit|uart_tx_unit|s_reg[0]~0_combout\,
	datac => \uart_unit|uart_tx_unit|s_reg\(1),
	datad => \uart_unit|uart_tx_unit|s_reg[2]~3_combout\,
	combout => \uart_unit|uart_tx_unit|s_reg[1]~6_combout\);

-- Location: LCFF_X43_Y28_N17
\uart_unit|uart_tx_unit|s_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|s_reg[1]~6_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|s_reg\(1));

-- Location: LCCOMB_X44_Y28_N4
\uart_unit|uart_tx_unit|Equal1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Equal1~0_combout\ = (((!\uart_unit|uart_tx_unit|s_reg\(1)) # (!\uart_unit|uart_tx_unit|s_reg\(3))) # (!\uart_unit|uart_tx_unit|s_reg\(2))) # (!\uart_unit|uart_tx_unit|s_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|s_reg\(0),
	datab => \uart_unit|uart_tx_unit|s_reg\(2),
	datac => \uart_unit|uart_tx_unit|s_reg\(3),
	datad => \uart_unit|uart_tx_unit|s_reg\(1),
	combout => \uart_unit|uart_tx_unit|Equal1~0_combout\);

-- Location: LCCOMB_X43_Y29_N22
\uart_unit|uart_tx_unit|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector1~0_combout\ = (\uart_unit|baud_gen_unit|Equal0~1_combout\ & (\uart_unit|baud_gen_unit|Equal0~0_combout\ & (!\uart_unit|uart_tx_unit|Equal1~0_combout\ & !\uart_unit|baud_gen_unit|r_reg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|baud_gen_unit|Equal0~1_combout\,
	datab => \uart_unit|baud_gen_unit|Equal0~0_combout\,
	datac => \uart_unit|uart_tx_unit|Equal1~0_combout\,
	datad => \uart_unit|baud_gen_unit|r_reg\(0),
	combout => \uart_unit|uart_tx_unit|Selector1~0_combout\);

-- Location: LCCOMB_X39_Y28_N4
\uart_unit|uart_tx_unit|Selector4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector4~2_combout\ = (\uart_unit|uart_tx_unit|Selector4~1_combout\) # ((\uart_unit|uart_tx_unit|state_reg.STOP~regout\ & !\uart_unit|uart_tx_unit|Selector1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|Selector4~1_combout\,
	datac => \uart_unit|uart_tx_unit|state_reg.STOP~regout\,
	datad => \uart_unit|uart_tx_unit|Selector1~0_combout\,
	combout => \uart_unit|uart_tx_unit|Selector4~2_combout\);

-- Location: LCFF_X39_Y28_N5
\uart_unit|uart_tx_unit|state_reg.STOP\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|Selector4~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|state_reg.STOP~regout\);

-- Location: LCCOMB_X43_Y28_N10
\uart_unit|uart_tx_unit|b_reg[3]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|b_reg[3]~0_combout\ = (\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & (\uart_unit|baud_gen_unit|Equal0~2_combout\ & !\uart_unit|uart_tx_unit|Equal1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datab => \uart_unit|baud_gen_unit|Equal0~2_combout\,
	datad => \uart_unit|uart_tx_unit|Equal1~0_combout\,
	combout => \uart_unit|uart_tx_unit|b_reg[3]~0_combout\);

-- Location: LCCOMB_X42_Y28_N2
\uart_unit|uart_tx_unit|Selector9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector9~0_combout\ = (\uart_unit|uart_tx_unit|state_reg.IDLE~regout\ & (((\uart_unit|uart_tx_unit|b_reg[3]~0_combout\)))) # (!\uart_unit|uart_tx_unit|state_reg.IDLE~regout\ & (!\btn~combout\ & 
-- ((\btn_db_unit|Selector2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \btn~combout\,
	datab => \uart_unit|uart_tx_unit|state_reg.IDLE~regout\,
	datac => \uart_unit|uart_tx_unit|b_reg[3]~0_combout\,
	datad => \btn_db_unit|Selector2~0_combout\,
	combout => \uart_unit|uart_tx_unit|Selector9~0_combout\);

-- Location: LCCOMB_X42_Y28_N30
\uart_unit|uart_tx_unit|b_reg[7]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|b_reg[7]~2_combout\ = (\uart_unit|uart_tx_unit|Selector9~0_combout\ & (\uart_unit|fifo_rx_unit|array_reg~47_combout\ & (!\uart_unit|uart_tx_unit|state_reg.IDLE~regout\))) # (!\uart_unit|uart_tx_unit|Selector9~0_combout\ & 
-- (((\uart_unit|uart_tx_unit|b_reg\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|fifo_rx_unit|array_reg~47_combout\,
	datab => \uart_unit|uart_tx_unit|state_reg.IDLE~regout\,
	datac => \uart_unit|uart_tx_unit|b_reg\(7),
	datad => \uart_unit|uart_tx_unit|Selector9~0_combout\,
	combout => \uart_unit|uart_tx_unit|b_reg[7]~2_combout\);

-- Location: LCFF_X42_Y28_N31
\uart_unit|uart_tx_unit|b_reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|b_reg[7]~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|b_reg\(7));

-- Location: LCCOMB_X42_Y28_N20
\uart_unit|uart_tx_unit|Selector10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector10~0_combout\ = (\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & (\uart_unit|uart_tx_unit|b_reg\(7))) # (!\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & ((\uart_unit|fifo_rx_unit|array_reg~45_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datab => \uart_unit|uart_tx_unit|b_reg\(7),
	datad => \uart_unit|fifo_rx_unit|array_reg~45_combout\,
	combout => \uart_unit|uart_tx_unit|Selector10~0_combout\);

-- Location: LCCOMB_X43_Y28_N8
\uart_unit|uart_tx_unit|b_reg[3]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|b_reg[3]~1_combout\ = (\uart_unit|uart_tx_unit|b_reg[3]~0_combout\) # ((!\btn~combout\ & (!\uart_unit|uart_tx_unit|state_reg.IDLE~regout\ & \btn_db_unit|Selector2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|b_reg[3]~0_combout\,
	datab => \btn~combout\,
	datac => \uart_unit|uart_tx_unit|state_reg.IDLE~regout\,
	datad => \btn_db_unit|Selector2~0_combout\,
	combout => \uart_unit|uart_tx_unit|b_reg[3]~1_combout\);

-- Location: LCFF_X43_Y28_N11
\uart_unit|uart_tx_unit|b_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_tx_unit|Selector10~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \uart_unit|uart_tx_unit|b_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|b_reg\(6));

-- Location: LCCOMB_X43_Y28_N2
\uart_unit|uart_tx_unit|Selector11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector11~0_combout\ = (\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & ((\uart_unit|uart_tx_unit|b_reg\(6)))) # (!\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & (\uart_unit|fifo_rx_unit|array_reg~43_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datac => \uart_unit|fifo_rx_unit|array_reg~43_combout\,
	datad => \uart_unit|uart_tx_unit|b_reg\(6),
	combout => \uart_unit|uart_tx_unit|Selector11~0_combout\);

-- Location: LCFF_X43_Y28_N3
\uart_unit|uart_tx_unit|b_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|Selector11~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \uart_unit|uart_tx_unit|b_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|b_reg\(5));

-- Location: LCCOMB_X43_Y28_N4
\uart_unit|uart_tx_unit|Selector12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector12~0_combout\ = (\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & (\uart_unit|uart_tx_unit|b_reg\(5))) # (!\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & ((\uart_unit|fifo_rx_unit|array_reg~41_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|uart_tx_unit|b_reg\(5),
	datac => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datad => \uart_unit|fifo_rx_unit|array_reg~41_combout\,
	combout => \uart_unit|uart_tx_unit|Selector12~0_combout\);

-- Location: LCFF_X43_Y28_N5
\uart_unit|uart_tx_unit|b_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|Selector12~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \uart_unit|uart_tx_unit|b_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|b_reg\(4));

-- Location: LCCOMB_X43_Y28_N18
\uart_unit|uart_tx_unit|Selector13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector13~0_combout\ = (\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & (\uart_unit|uart_tx_unit|b_reg\(4))) # (!\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & ((\uart_unit|fifo_rx_unit|array_reg~39_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|uart_tx_unit|b_reg\(4),
	datac => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datad => \uart_unit|fifo_rx_unit|array_reg~39_combout\,
	combout => \uart_unit|uart_tx_unit|Selector13~0_combout\);

-- Location: LCFF_X43_Y28_N19
\uart_unit|uart_tx_unit|b_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|Selector13~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \uart_unit|uart_tx_unit|b_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|b_reg\(3));

-- Location: LCCOMB_X43_Y27_N4
\uart_unit|uart_tx_unit|Selector14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector14~0_combout\ = (\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & (\uart_unit|uart_tx_unit|b_reg\(3))) # (!\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & ((\uart_unit|fifo_rx_unit|array_reg~37_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datac => \uart_unit|uart_tx_unit|b_reg\(3),
	datad => \uart_unit|fifo_rx_unit|array_reg~37_combout\,
	combout => \uart_unit|uart_tx_unit|Selector14~0_combout\);

-- Location: LCFF_X43_Y28_N27
\uart_unit|uart_tx_unit|b_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \uart_unit|uart_tx_unit|Selector14~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	ena => \uart_unit|uart_tx_unit|b_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|b_reg\(2));

-- Location: LCCOMB_X43_Y28_N12
\uart_unit|uart_tx_unit|Selector15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector15~0_combout\ = (\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & ((\uart_unit|uart_tx_unit|b_reg\(2)))) # (!\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & (\uart_unit|fifo_rx_unit|array_reg~35_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datac => \uart_unit|fifo_rx_unit|array_reg~35_combout\,
	datad => \uart_unit|uart_tx_unit|b_reg\(2),
	combout => \uart_unit|uart_tx_unit|Selector15~0_combout\);

-- Location: LCFF_X43_Y28_N13
\uart_unit|uart_tx_unit|b_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|Selector15~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \uart_unit|uart_tx_unit|b_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|b_reg\(1));

-- Location: LCCOMB_X43_Y28_N22
\uart_unit|uart_tx_unit|Selector16~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector16~0_combout\ = (\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & ((\uart_unit|uart_tx_unit|b_reg\(1)))) # (!\uart_unit|uart_tx_unit|state_reg.DATA~regout\ & (\uart_unit|fifo_rx_unit|array_reg~33_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datac => \uart_unit|fifo_rx_unit|array_reg~33_combout\,
	datad => \uart_unit|uart_tx_unit|b_reg\(1),
	combout => \uart_unit|uart_tx_unit|Selector16~0_combout\);

-- Location: LCFF_X43_Y28_N23
\uart_unit|uart_tx_unit|b_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|Selector16~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	ena => \uart_unit|uart_tx_unit|b_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|b_reg\(0));

-- Location: LCCOMB_X43_Y28_N24
\uart_unit|uart_tx_unit|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \uart_unit|uart_tx_unit|Selector0~0_combout\ = (!\uart_unit|uart_tx_unit|state_reg.STOP~regout\ & (\uart_unit|uart_tx_unit|state_reg.IDLE~regout\ & ((!\uart_unit|uart_tx_unit|b_reg\(0)) # (!\uart_unit|uart_tx_unit|state_reg.DATA~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uart_unit|uart_tx_unit|state_reg.DATA~regout\,
	datab => \uart_unit|uart_tx_unit|state_reg.STOP~regout\,
	datac => \uart_unit|uart_tx_unit|state_reg.IDLE~regout\,
	datad => \uart_unit|uart_tx_unit|b_reg\(0),
	combout => \uart_unit|uart_tx_unit|Selector0~0_combout\);

-- Location: LCFF_X43_Y28_N25
\uart_unit|uart_tx_unit|tx_reg\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \uart_unit|uart_tx_unit|Selector0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \uart_unit|uart_tx_unit|tx_reg~regout\);

-- Location: PIN_AJ6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \uart_unit|fifo_rx_unit|array_reg~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(0));

-- Location: PIN_AK5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \uart_unit|fifo_rx_unit|array_reg~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(1));

-- Location: PIN_AJ5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \uart_unit|fifo_rx_unit|array_reg~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(2));

-- Location: PIN_AJ4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \uart_unit|fifo_rx_unit|array_reg~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(3));

-- Location: PIN_AK3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \uart_unit|fifo_rx_unit|array_reg~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(4));

-- Location: PIN_AH4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \uart_unit|fifo_rx_unit|array_reg~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(5));

-- Location: PIN_AJ3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \uart_unit|fifo_rx_unit|array_reg~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(6));

-- Location: PIN_AJ2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \uart_unit|fifo_rx_unit|array_reg~47_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(7));

-- Location: PIN_E21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\tx~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \uart_unit|uart_tx_unit|ALT_INV_tx_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_tx);

-- Location: PIN_AD8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\tx_full~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \uart_unit|fifo_rx_unit|full_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_tx_full);

-- Location: PIN_AJ17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\rx_empty~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \uart_unit|fifo_rx_unit|ALT_INV_empty_reg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_rx_empty);
END structure;


