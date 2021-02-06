
module NiosII_Controlled_Section (
	channel1_analog_export,
	channel2_analog_export,
	channel3_analog_export,
	channel4_analog_export,
	channel5_analog_export,
	channel6_analog_export,
	clk_clk,
	read_new_sample_export,
	writing_finish_flag_export,
	read_address_export,
	reset_reset_n,
	sram_DQ,
	sram_ADDR,
	sram_LB_N,
	sram_UB_N,
	sram_CE_N,
	sram_OE_N,
	sram_WE_N,
	vga_CLK,
	vga_HS,
	vga_VS,
	vga_BLANK,
	vga_SYNC,
	vga_R,
	vga_G,
	vga_B);	

	input	[7:0]	channel1_analog_export;
	input	[7:0]	channel2_analog_export;
	input	[7:0]	channel3_analog_export;
	input	[7:0]	channel4_analog_export;
	input	[7:0]	channel5_analog_export;
	input	[7:0]	channel6_analog_export;
	input		clk_clk;
	input		read_new_sample_export;
	input		writing_finish_flag_export;
	output	[11:0]	read_address_export;
	input		reset_reset_n;
	inout	[15:0]	sram_DQ;
	output	[19:0]	sram_ADDR;
	output		sram_LB_N;
	output		sram_UB_N;
	output		sram_CE_N;
	output		sram_OE_N;
	output		sram_WE_N;
	output		vga_CLK;
	output		vga_HS;
	output		vga_VS;
	output		vga_BLANK;
	output		vga_SYNC;
	output	[7:0]	vga_R;
	output	[7:0]	vga_G;
	output	[7:0]	vga_B;
endmodule
