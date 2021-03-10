-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\ThreeSines_DrSaher\Subsystem9_block1.vhd
-- Created: 2021-03-10 22:43:26
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem9_block1
-- Source Path: ThreeSines_DrSaher/Sines /HEX2/Subsystem9
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Subsystem9_block1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Enable                            :   IN    std_logic;
        alpha0                            :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En10
        );
END Subsystem9_block1;


ARCHITECTURE rtl OF Subsystem9_block1 IS

  -- Signals
  SIGNAL enb_gated                        : std_logic;
  SIGNAL Constant9_out1                   : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Constant9_out1_hold              : signed(15 DOWNTO 0);  -- sfix16_En10

BEGIN
  Constant9_out1 <= to_signed(16#0000#, 16);

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
