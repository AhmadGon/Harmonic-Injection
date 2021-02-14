	component NiosII_Controlled_SectionBAK is
		port (
			channel1_analog_export     : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			channel2_analog_export     : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			channel3_analog_export     : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			channel4_analog_export     : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			channel5_analog_export     : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			channel6_analog_export     : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			clk_clk                    : in    std_logic                     := 'X';             -- clk
			read_address_export        : out   std_logic_vector(11 downto 0);                    -- export
			read_new_sample_export     : in    std_logic                     := 'X';             -- export
			reset_reset_n              : in    std_logic                     := 'X';             -- reset_n
			sram_DQ                    : inout std_logic_vector(15 downto 0) := (others => 'X'); -- DQ
			sram_ADDR                  : out   std_logic_vector(19 downto 0);                    -- ADDR
			sram_LB_N                  : out   std_logic;                                        -- LB_N
			sram_UB_N                  : out   std_logic;                                        -- UB_N
			sram_CE_N                  : out   std_logic;                                        -- CE_N
			sram_OE_N                  : out   std_logic;                                        -- OE_N
			sram_WE_N                  : out   std_logic;                                        -- WE_N
			vga_CLK                    : out   std_logic;                                        -- CLK
			vga_HS                     : out   std_logic;                                        -- HS
			vga_VS                     : out   std_logic;                                        -- VS
			vga_BLANK                  : out   std_logic;                                        -- BLANK
			vga_SYNC                   : out   std_logic;                                        -- SYNC
			vga_R                      : out   std_logic_vector(7 downto 0);                     -- R
			vga_G                      : out   std_logic_vector(7 downto 0);                     -- G
			vga_B                      : out   std_logic_vector(7 downto 0);                     -- B
			writing_finish_flag_export : in    std_logic                     := 'X'              -- export
		);
	end component NiosII_Controlled_SectionBAK;

	u0 : component NiosII_Controlled_SectionBAK
		port map (
			channel1_analog_export     => CONNECTED_TO_channel1_analog_export,     --     channel1_analog.export
			channel2_analog_export     => CONNECTED_TO_channel2_analog_export,     --     channel2_analog.export
			channel3_analog_export     => CONNECTED_TO_channel3_analog_export,     --     channel3_analog.export
			channel4_analog_export     => CONNECTED_TO_channel4_analog_export,     --     channel4_analog.export
			channel5_analog_export     => CONNECTED_TO_channel5_analog_export,     --     channel5_analog.export
			channel6_analog_export     => CONNECTED_TO_channel6_analog_export,     --     channel6_analog.export
			clk_clk                    => CONNECTED_TO_clk_clk,                    --                 clk.clk
			read_address_export        => CONNECTED_TO_read_address_export,        --        read_address.export
			read_new_sample_export     => CONNECTED_TO_read_new_sample_export,     --     read_new_sample.export
			reset_reset_n              => CONNECTED_TO_reset_reset_n,              --               reset.reset_n
			sram_DQ                    => CONNECTED_TO_sram_DQ,                    --                sram.DQ
			sram_ADDR                  => CONNECTED_TO_sram_ADDR,                  --                    .ADDR
			sram_LB_N                  => CONNECTED_TO_sram_LB_N,                  --                    .LB_N
			sram_UB_N                  => CONNECTED_TO_sram_UB_N,                  --                    .UB_N
			sram_CE_N                  => CONNECTED_TO_sram_CE_N,                  --                    .CE_N
			sram_OE_N                  => CONNECTED_TO_sram_OE_N,                  --                    .OE_N
			sram_WE_N                  => CONNECTED_TO_sram_WE_N,                  --                    .WE_N
			vga_CLK                    => CONNECTED_TO_vga_CLK,                    --                 vga.CLK
			vga_HS                     => CONNECTED_TO_vga_HS,                     --                    .HS
			vga_VS                     => CONNECTED_TO_vga_VS,                     --                    .VS
			vga_BLANK                  => CONNECTED_TO_vga_BLANK,                  --                    .BLANK
			vga_SYNC                   => CONNECTED_TO_vga_SYNC,                   --                    .SYNC
			vga_R                      => CONNECTED_TO_vga_R,                      --                    .R
			vga_G                      => CONNECTED_TO_vga_G,                      --                    .G
			vga_B                      => CONNECTED_TO_vga_B,                      --                    .B
			writing_finish_flag_export => CONNECTED_TO_writing_finish_flag_export  -- writing_finish_flag.export
		);

