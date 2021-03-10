-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\ThreeSines_DrSaher\aPA_Save.vhd
-- Created: 2021-03-10 22:43:26
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: aPA_Save
-- Source Path: ThreeSines_DrSaher/Sines /aPA_Save
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY aPA_Save IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        MulNumber                         :   IN    std_logic_vector(21 DOWNTO 0);  -- sfix22_En15
        Enable                            :   IN    std_logic;
        MulResult                         :   OUT   std_logic_vector(21 DOWNTO 0)  -- sfix22_En15
        );
END aPA_Save;


ARCHITECTURE rtl OF aPA_Save IS

  -- Signals
  SIGNAL enb_gated                        : std_logic;
  SIGNAL Enable_out2                      : std_logic;
  SIGNAL MulNumber_signed                 : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL MulNumber_bypass                 : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL MulNumber_last_value             : signed(21 DOWNTO 0);  -- sfix22_En15

BEGIN
  Enable_out2 <= Enable;

  enb_gated <= Enable_out2 AND enb;

  MulNumber_signed <= signed(MulNumber);

  MulResult_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      MulNumber_last_value <= to_signed(16#000000#, 22);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_gated = '1' THEN
        MulNumber_last_value <= MulNumber_bypass;
      END IF;
    END IF;
  END PROCESS MulResult_bypass_process;


  
  MulNumber_bypass <= MulNumber_last_value WHEN Enable_out2 = '0' ELSE
      MulNumber_signed;

  MulResult <= std_logic_vector(MulNumber_bypass);

END rtl;
