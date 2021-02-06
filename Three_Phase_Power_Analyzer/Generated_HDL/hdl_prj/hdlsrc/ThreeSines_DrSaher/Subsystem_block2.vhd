-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\ThreeSines_DrSaher\Subsystem_block2.vhd
-- Created: 2020-02-04 20:32:36
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem_block2
-- Source Path: ThreeSines_DrSaher/Sines /HEX3/Subsystem
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Subsystem_block2 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Enable                            :   IN    std_logic;
        alpha0                            :   OUT   std_logic_vector(6 DOWNTO 0)  -- ufix7
        );
END Subsystem_block2;


ARCHITECTURE rtl OF Subsystem_block2 IS

  -- Signals
  SIGNAL enb_gated                        : std_logic;
  SIGNAL Enable_out1                      : std_logic;
  SIGNAL Constant9_out1                   : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Constant9_out1_bypass            : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Constant9_out1_last_value        : unsigned(6 DOWNTO 0);  -- ufix7

BEGIN
  Enable_out1 <= Enable;

  enb_gated <= Enable_out1 AND enb;

  Constant9_out1 <= to_unsigned(16#40#, 7);

  alpha0_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Constant9_out1_last_value <= to_unsigned(16#00#, 7);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_gated = '1' THEN
        Constant9_out1_last_value <= Constant9_out1_bypass;
      END IF;
    END IF;
  END PROCESS alpha0_bypass_process;


  
  Constant9_out1_bypass <= Constant9_out1_last_value WHEN Enable_out1 = '0' ELSE
      Constant9_out1;

  alpha0 <= std_logic_vector(Constant9_out1_bypass);

END rtl;

