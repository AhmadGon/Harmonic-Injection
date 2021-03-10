-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\ThreeSines_DrSaher\DAC_Control.vhd
-- Created: 2021-03-10 22:43:26
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: DAC_Control
-- Source Path: ThreeSines_DrSaher/Sines /DAC Control
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY DAC_Control IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        CLK_1                             :   OUT   std_logic;
        Sync_n                            :   OUT   std_logic;
        Blank_n                           :   OUT   std_logic
        );
END DAC_Control;


ARCHITECTURE rtl OF DAC_Control IS

  -- Signals
  SIGNAL Counter_Limited1_out1            : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Constant5_out1                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Relational_Operator1_relop1      : std_logic;
  SIGNAL Constant4_out1                   : std_logic;
  SIGNAL Constant3_out1                   : std_logic;

BEGIN
  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 1
  Counter_Limited1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Counter_Limited1_out1 <= to_unsigned(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        IF Counter_Limited1_out1 >= to_unsigned(16#01#, 8) THEN 
          Counter_Limited1_out1 <= to_unsigned(16#00#, 8);
        ELSE 
          Counter_Limited1_out1 <= Counter_Limited1_out1 + to_unsigned(16#01#, 8);
        END IF;
      END IF;
    END IF;
  END PROCESS Counter_Limited1_process;


  Constant5_out1 <= to_unsigned(16#01#, 8);

  
  Relational_Operator1_relop1 <= '1' WHEN Counter_Limited1_out1 < Constant5_out1 ELSE
      '0';

  Constant4_out1 <= '0';

  Constant3_out1 <= '1';

  CLK_1 <= Relational_Operator1_relop1;

  Sync_n <= Constant4_out1;

  Blank_n <= Constant3_out1;

END rtl;
