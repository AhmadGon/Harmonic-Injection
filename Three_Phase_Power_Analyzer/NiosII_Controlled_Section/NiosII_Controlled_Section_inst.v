	NiosII_Controlled_Section u0 (
		.channel1_analog_export     (<connected-to-channel1_analog_export>),     //     channel1_analog.export
		.channel2_analog_export     (<connected-to-channel2_analog_export>),     //     channel2_analog.export
		.channel3_analog_export     (<connected-to-channel3_analog_export>),     //     channel3_analog.export
		.channel4_analog_export     (<connected-to-channel4_analog_export>),     //     channel4_analog.export
		.channel5_analog_export     (<connected-to-channel5_analog_export>),     //     channel5_analog.export
		.channel6_analog_export     (<connected-to-channel6_analog_export>),     //     channel6_analog.export
		.clk_clk                    (<connected-to-clk_clk>),                    //                 clk.clk
		.read_new_sample_export     (<connected-to-read_new_sample_export>),     //     read_new_sample.export
		.writing_finish_flag_export (<connected-to-writing_finish_flag_export>), // writing_finish_flag.export
		.read_address_export        (<connected-to-read_address_export>),        //        read_address.export
		.reset_reset_n              (<connected-to-reset_reset_n>),              //               reset.reset_n
		.sram_DQ                    (<connected-to-sram_DQ>),                    //                sram.DQ
		.sram_ADDR                  (<connected-to-sram_ADDR>),                  //                    .ADDR
		.sram_LB_N                  (<connected-to-sram_LB_N>),                  //                    .LB_N
		.sram_UB_N                  (<connected-to-sram_UB_N>),                  //                    .UB_N
		.sram_CE_N                  (<connected-to-sram_CE_N>),                  //                    .CE_N
		.sram_OE_N                  (<connected-to-sram_OE_N>),                  //                    .OE_N
		.sram_WE_N                  (<connected-to-sram_WE_N>),                  //                    .WE_N
		.vga_CLK                    (<connected-to-vga_CLK>),                    //                 vga.CLK
		.vga_HS                     (<connected-to-vga_HS>),                     //                    .HS
		.vga_VS                     (<connected-to-vga_VS>),                     //                    .VS
		.vga_BLANK                  (<connected-to-vga_BLANK>),                  //                    .BLANK
		.vga_SYNC                   (<connected-to-vga_SYNC>),                   //                    .SYNC
		.vga_R                      (<connected-to-vga_R>),                      //                    .R
		.vga_G                      (<connected-to-vga_G>),                      //                    .G
		.vga_B                      (<connected-to-vga_B>)                       //                    .B
	);

