-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\ThreeSines_DrSaher\Sines_topde2_clock_module.vhd
-- Created: 2020-02-04 20:32:39
-- 
-- Generated by MATLAB 9.4 and HDL Coder 3.12
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Sines_topde2_clock_module
-- Source Path: Sines_topde2/Sines_topde2_clock_module
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.ALL;

ENTITY Sines_topde2_clock_module IS
  PORT( inclk                             :   IN    std_logic;  -- ufix1
        areset                            :   IN    std_logic;  -- ufix1
        clk_1                             :   OUT   std_logic;  -- ufix1
        sysreset                          :   OUT   std_logic  -- ufix1
        );
END Sines_topde2_clock_module;


ARCHITECTURE rtl OF Sines_topde2_clock_module IS

  -- Component Declarations
  COMPONENT altpll
    GENERIC( clk0_multiply_by             : integer;
             clk0_divide_by               : integer;
             inclk0_input_frequency       : integer;
             width_clock                  : integer;
             operation_mode               : string
             );
    PORT( INCLK                           :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          ARESET                          :   IN    std_logic;  -- ufix1
          CLK                             :   OUT   std_logic_vector(4 DOWNTO 0);  -- ufix5
          LOCKED                          :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Signals
  SIGNAL const_0                          : std_logic;  -- ufix1
  SIGNAL inclk_tmp                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL inclk_tmp_1                      : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL clk_tmp                          : std_logic_vector(4 DOWNTO 0);  -- ufix5
  SIGNAL locked                           : std_logic;  -- ufix1
  SIGNAL clk_tmp_unsigned                 : unsigned(4 DOWNTO 0);  -- ufix5

BEGIN
  u_altpll : altpll
    GENERIC MAP( clk0_multiply_by => 1,
                 clk0_divide_by => 1,
                 inclk0_input_frequency => 20000,
                 width_clock => 5,
                 operation_mode => "NORMAL"
                 )
    PORT MAP( INCLK => inclk_tmp_1,  -- ufix2
              ARESET => areset,  -- ufix1
              CLK => clk_tmp,  -- ufix5
              LOCKED => locked  -- ufix1
              );

  const_0 <= '0';

  inclk_tmp <= unsigned'(const_0 & inclk);

  inclk_tmp_1 <= std_logic_vector(inclk_tmp);

  clk_tmp_unsigned <= unsigned(clk_tmp);

  clk_1 <= clk_tmp_unsigned(0);

  sysreset <=  NOT locked;

END rtl;

