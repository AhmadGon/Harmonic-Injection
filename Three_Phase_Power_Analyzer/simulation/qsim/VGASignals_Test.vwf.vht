-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "01/12/2020 21:07:04"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Top
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Top_vhd_vec_tst IS
END Top_vhd_vec_tst;
ARCHITECTURE Top_arch OF Top_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Blank_n : STD_LOGIC;
SIGNAL Blue : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL CH1 : STD_LOGIC;
SIGNAL CH2 : STD_LOGIC;
SIGNAL CH3 : STD_LOGIC;
SIGNAL CH4 : STD_LOGIC;
SIGNAL CH5 : STD_LOGIC;
SIGNAL CH6 : STD_LOGIC;
SIGNAL CH7 : STD_LOGIC;
SIGNAL CH8 : STD_LOGIC;
SIGNAL Green : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL Hsync : STD_LOGIC;
SIGNAL LEDG : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Phase_A : STD_LOGIC;
SIGNAL Phase_A_Neg : STD_LOGIC;
SIGNAL Phase_B : STD_LOGIC;
SIGNAL Phase_B_Neg : STD_LOGIC;
SIGNAL Phase_C : STD_LOGIC;
SIGNAL Phase_C_Neg : STD_LOGIC;
SIGNAL Push : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Red : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SRAM_Address : STD_LOGIC_VECTOR(19 DOWNTO 0);
SIGNAL SRAM_CE_N : STD_LOGIC;
SIGNAL SRAM_DQ : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL SRAM_LB_N : STD_LOGIC;
SIGNAL SRAM_OE_N : STD_LOGIC;
SIGNAL SRAM_UB_N : STD_LOGIC;
SIGNAL SRAM_WE_N : STD_LOGIC;
SIGNAL SW : STD_LOGIC_VECTOR(16 DOWNTO 0);
SIGNAL Sync_n : STD_LOGIC;
SIGNAL VGA_CLK : STD_LOGIC;
SIGNAL Vsync : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT Top
	PORT (
	Blank_n : OUT STD_LOGIC;
	Blue : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	CH1 : IN STD_LOGIC;
	CH2 : IN STD_LOGIC;
	CH3 : IN STD_LOGIC;
	CH4 : IN STD_LOGIC;
	CH5 : IN STD_LOGIC;
	CH6 : IN STD_LOGIC;
	CH7 : IN STD_LOGIC;
	CH8 : IN STD_LOGIC;
	Green : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	Hsync : OUT STD_LOGIC;
	LEDG : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	Phase_A : OUT STD_LOGIC;
	Phase_A_Neg : OUT STD_LOGIC;
	Phase_B : OUT STD_LOGIC;
	Phase_B_Neg : OUT STD_LOGIC;
	Phase_C : OUT STD_LOGIC;
	Phase_C_Neg : OUT STD_LOGIC;
	Push : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Red : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SRAM_Address : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
	SRAM_CE_N : OUT STD_LOGIC;
	SRAM_DQ : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	SRAM_LB_N : OUT STD_LOGIC;
	SRAM_OE_N : OUT STD_LOGIC;
	SRAM_UB_N : OUT STD_LOGIC;
	SRAM_WE_N : OUT STD_LOGIC;
	SW : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
	Sync_n : OUT STD_LOGIC;
	VGA_CLK : OUT STD_LOGIC;
	Vsync : OUT STD_LOGIC;
	clk : IN STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Top
	PORT MAP (
-- list connections between master ports and signals
	Blank_n => Blank_n,
	Blue => Blue,
	CH1 => CH1,
	CH2 => CH2,
	CH3 => CH3,
	CH4 => CH4,
	CH5 => CH5,
	CH6 => CH6,
	CH7 => CH7,
	CH8 => CH8,
	Green => Green,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
	Hsync => Hsync,
	LEDG => LEDG,
	Phase_A => Phase_A,
	Phase_A_Neg => Phase_A_Neg,
	Phase_B => Phase_B,
	Phase_B_Neg => Phase_B_Neg,
	Phase_C => Phase_C,
	Phase_C_Neg => Phase_C_Neg,
	Push => Push,
	Red => Red,
	SRAM_Address => SRAM_Address,
	SRAM_CE_N => SRAM_CE_N,
	SRAM_DQ => SRAM_DQ,
	SRAM_LB_N => SRAM_LB_N,
	SRAM_OE_N => SRAM_OE_N,
	SRAM_UB_N => SRAM_UB_N,
	SRAM_WE_N => SRAM_WE_N,
	SW => SW,
	Sync_n => Sync_n,
	VGA_CLK => VGA_CLK,
	Vsync => Vsync,
	clk => clk,
	reset => reset
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 5000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
WAIT;
END PROCESS t_prcs_reset;
END Top_arch;
