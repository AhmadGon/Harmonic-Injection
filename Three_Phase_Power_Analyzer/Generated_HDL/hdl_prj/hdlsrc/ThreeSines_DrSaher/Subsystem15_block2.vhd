-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\ThreeSines_DrSaher\Subsystem15_block2.vhd
-- Created: 2020-02-04 20:32:36
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem15_block2
-- Source Path: ThreeSines_DrSaher/Sines /HEX3/Subsystem15
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Subsystem15_block2 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Enable                            :   IN    std_logic;
        alpha0                            :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En12
        );
END Subsystem15_block2;


ARCHITECTURE rtl OF Subsystem15_block2 IS

  -- Signals
  SIGNAL enb_gated                        : std_logic;
  SIGNAL Constant9_out1                   : signed(15 DOWNTO 0);  -- sfix16_En12
  SIGNAL Constant9_out1_hold              : signed(15 DOWNTO 0);  -- sfix16_En12

BEGIN
  Constant9_out1 <= to_signed(16#6000#, 16);

  enb_gated <= Enable AND enb;

  alpha0_hold_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Constant9_out1_hold <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_gated = '1' THEN
        Constant9_out1_hold <= Constant9_out1;
      END IF;
    END IF;
  END PROCESS alpha0_hold_process;


  alpha0 <= std_logic_vector(Constant9_out1_hold);

END rtl;
