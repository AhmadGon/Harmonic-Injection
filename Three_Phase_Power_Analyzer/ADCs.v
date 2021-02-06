module ADCs(
	input clk, reset, 
	//DATA_In: this means input data to digital FPGA pin (serial output from ADC)
	/*************Voltages*************/
	input PhaseA_DATA_In_V, PhaseB_DATA_In_V, PhaseC_DATA_In_V,
	/*************Currents*************/
	input PhaseA_DATA_In_I, PhaseB_DATA_In_I, PhaseC_DATA_In_I,
	//ADC output clks and chip select (ADC_clk, CS)
	//Voltages and currents clks and CSs are seperated to avoid fan out limit (to be more safe)
	output ADC_clk_V, CS_V, 
	output ADC_clk_I, CS_I,
	//Making the serial data as parrallel data inside FPGA
	/*************Voltages*************/
	output [7:0] PhaseA_DATA_Out_V, PhaseB_DATA_Out_V, PhaseC_DATA_Out_V,
	/*************Currents*************/
	output [7:0] PhaseA_DATA_Out_I, PhaseB_DATA_Out_I, PhaseC_DATA_Out_I
);
//=====================================================
/********Voltages*********/
//Phase A
TLC549_Control_Logic TLC549_Control_Logic_inst_VA(
	.clk_in(clk),
	.reset(reset),
	.data_in(PhaseA_DATA_In_V),
	.ADC_clk(ADC_clk_V),
	.CS(CS_V),
	.ADC_value(PhaseA_DATA_Out_V)
);

//Phase B
TLC549_Control_Logic TLC549_Control_Logic_inst_VB(
	.clk_in(clk),
	.reset(reset),
	.data_in(PhaseB_DATA_In_V),
//	.ADC_clk(ADC_clk_V),
//	.CS(CS_V),
	.ADC_value(PhaseB_DATA_Out_V)
);

//Phase C
TLC549_Control_Logic TLC549_Control_Logic_inst_VC(
	.clk_in(clk),
	.reset(reset),
	.data_in(PhaseC_DATA_In_V),
//	.ADC_clk(ADC_clk_V),
//	.CS(CS_V),
	.ADC_value(PhaseC_DATA_Out_V)
);
//=====================================================
/********Currents*********/
//Phase A
TLC549_Control_Logic TLC549_Control_Logic_inst_IA(
	.clk_in(clk),
	.reset(reset),
	.data_in(PhaseA_DATA_In_I),
	.ADC_clk(ADC_clk_I),
	.CS(CS_I),
	.ADC_value(PhaseA_DATA_Out_I)
);

//Phase B
TLC549_Control_Logic TLC549_Control_Logic_inst_IB(
	.clk_in(clk),
	.reset(reset),
	.data_in(PhaseB_DATA_In_I),
//	.ADC_clk(ADC_clk_V),
//	.CS(CS_V),
	.ADC_value(PhaseB_DATA_Out_I)
);

//Phase C
TLC549_Control_Logic TLC549_Control_Logic_inst_IC(
	.clk_in(clk),
	.reset(reset),
	.data_in(PhaseC_DATA_In_I),
//	.ADC_clk(ADC_clk_V),
//	.CS(CS_V),
	.ADC_value(PhaseC_DATA_Out_I)
);
endmodule 