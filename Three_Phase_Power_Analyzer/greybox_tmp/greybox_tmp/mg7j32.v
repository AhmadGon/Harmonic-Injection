//altsyncram ADDRESS_REG_B="CLOCK0" CBX_SINGLE_OUTPUT_FILE="ON" CLOCK_ENABLE_INPUT_A="BYPASS" CLOCK_ENABLE_INPUT_B="BYPASS" CLOCK_ENABLE_OUTPUT_A="BYPASS" CLOCK_ENABLE_OUTPUT_B="BYPASS" INDATA_REG_B="CLOCK0" INIT_FILE="UNUSED" INIT_FILE_LAYOUT="PORT_A" INTENDED_DEVICE_FAMILY=""Cyclone IV E"" LPM_TYPE="altsyncram" NUMWORDS_A=318400 NUMWORDS_B=106134 OPERATION_MODE="BIDIR_DUAL_PORT" OUTDATA_ACLR_A="NONE" OUTDATA_ACLR_B="NONE" OUTDATA_REG_A="UNREGISTERED" OUTDATA_REG_B="UNREGISTERED" POWER_UP_UNINITIALIZED="FALSE" RAM_BLOCK_TYPE="M9K" WIDTH_A=8 WIDTH_B=24 WIDTH_BYTEENA_A=1 WIDTH_BYTEENA_B=1 WIDTH_ECCSTATUS=3 WIDTHAD_A=19 WIDTHAD_B=17 WRCONTROL_WRADDRESS_REG_B="CLOCK0" address_a address_b clock0 data_a data_b q_a q_b wren_a wren_b
//VERSION_BEGIN 17.0 cbx_mgl 2017:04:25:18:09:28:SJ cbx_stratixii 2017:04:25:18:06:30:SJ cbx_util_mgl 2017:04:25:18:06:30:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2017  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel MegaCore Function License Agreement, or other 
//  applicable license agreement, including, without limitation, 
//  that your use is for the sole purpose of programming logic 
//  devices manufactured by Intel and sold by Intel or its 
//  authorized distributors.  Please refer to the applicable 
//  agreement for further details.



//synthesis_resources = altsyncram 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mg7j32
	( 
	address_a,
	address_b,
	clock0,
	data_a,
	data_b,
	q_a,
	q_b,
	wren_a,
	wren_b) /* synthesis synthesis_clearbox=1 */;
	input   [18:0]  address_a;
	input   [16:0]  address_b;
	input   clock0;
	input   [7:0]  data_a;
	input   [23:0]  data_b;
	output   [7:0]  q_a;
	output   [23:0]  q_b;
	input   wren_a;
	input   wren_b;

	wire  [7:0]   wire_mgl_prim1_q_a;
	wire  [23:0]   wire_mgl_prim1_q_b;

	altsyncram   mgl_prim1
	( 
	.address_a(address_a),
	.address_b(address_b),
	.clock0(clock0),
	.data_a(data_a),
	.data_b(data_b),
	.q_a(wire_mgl_prim1_q_a),
	.q_b(wire_mgl_prim1_q_b),
	.wren_a(wren_a),
	.wren_b(wren_b));
	defparam
		mgl_prim1.address_reg_b = "CLOCK0",
		mgl_prim1.clock_enable_input_a = "BYPASS",
		mgl_prim1.clock_enable_input_b = "BYPASS",
		mgl_prim1.clock_enable_output_a = "BYPASS",
		mgl_prim1.clock_enable_output_b = "BYPASS",
		mgl_prim1.indata_reg_b = "CLOCK0",
		mgl_prim1.init_file_layout = "PORT_A",
		mgl_prim1.intended_device_family = ""Cyclone IV E"",
		mgl_prim1.lpm_type = "altsyncram",
		mgl_prim1.numwords_a = 318400,
		mgl_prim1.numwords_b = 106134,
		mgl_prim1.operation_mode = "BIDIR_DUAL_PORT",
		mgl_prim1.outdata_aclr_a = "NONE",
		mgl_prim1.outdata_aclr_b = "NONE",
		mgl_prim1.outdata_reg_a = "UNREGISTERED",
		mgl_prim1.outdata_reg_b = "UNREGISTERED",
		mgl_prim1.power_up_uninitialized = "FALSE",
		mgl_prim1.ram_block_type = "M9K",
		mgl_prim1.width_a = 8,
		mgl_prim1.width_b = 24,
		mgl_prim1.width_byteena_a = 1,
		mgl_prim1.width_byteena_b = 1,
		mgl_prim1.width_eccstatus = 3,
		mgl_prim1.widthad_a = 19,
		mgl_prim1.widthad_b = 17,
		mgl_prim1.wrcontrol_wraddress_reg_b = "CLOCK0";
	assign
		q_a = wire_mgl_prim1_q_a,
		q_b = wire_mgl_prim1_q_b;
endmodule //mg7j32
//VALID FILE
