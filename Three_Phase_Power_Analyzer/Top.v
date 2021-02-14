/***************************************/
//	Author: Ahmad Alastal 				   //
//												   //
//	Completion date: 22/2/2020 4.15PM   //
//												   //
//	Title: Three Phase Power Analyzer   //
//												   //
//	Main function:								// 							
// 1. FPGA reads three phase voltages  //
//    and currents and save these data //
//    to host machine.						//
// 2. FPGA generates PWM according to  //
//    injected three phase harmonics   // 
/***************************************/
module Top(
	//Main clk and reset
	input clk,reset,
	//Pushs and Switches
	input Push_0, Push_1, Push_2, Push_3,
	input SW0, SW1, SW2, SW3, SW4, SW5, SW7, SW8, SW9 ,SW10, SW12, SW13, SW14, SW15, SW16,
	//Seven Segment Display
	output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,
	//GPIO
	output Phase_A,Phase_A_Neg,Phase_B,Phase_B_Neg,Phase_C,Phase_C_Neg,
	//LEDG
	output [2:0] LEDG,
	//SRAM Signals
	inout [15:0] SRAM_DQ,
	output [19:0] SRAM_Address,
	output SRAM_LB_N,SRAM_UB_N,SRAM_CE_N,SRAM_OE_N,SRAM_WE_N,
	//VGA Signals
	output VGA_CLK,Hsync,Vsync,Blank_n,Sync_n,
	output [7:0] Red,Green,Blue,
	//ADC Channels
	output ADC_clk_V, ADC_clk_I, CS_V, CS_I,
	input PhaseA_DATA_In_V, PhaseB_DATA_In_V, PhaseC_DATA_In_V, PhaseA_DATA_In_I, PhaseB_DATA_In_I, PhaseC_DATA_In_I
	//Test signals
);

wire [10:1] H_counter, V_counter;

//Analog signals coming from trunk line
wire[9:0]PhaseA_Analog, PhaseA_Analog_Stored;
wire[9:0]PhaseB_Analog, PhaseB_Analog_Stored;
wire[9:0]PhaseC_Tri_Analog, PhaseC_Tri_Analog_Stored;

//PWM signals coming from trunk line
wire PhaseA_PWM, PhaseA_PWM_Stored;
wire PhaseB_PWM, PhaseB_PWM_Stored;
wire PhaseC_PWM, PhaseC_PWM_Stored;

//PWM Correction
wire PhaseA_PWM_Correction_Stored, PhaseB_PWM_Correction_Stored, PhaseC_PWM_Correction_Stored;

//Harmonics values
wire [15:0] Original_Signal;
wire [15:0] Third_Harmonic;
wire [15:0] Nineth_Harmonic;
wire [15:0] Fiftenth_Harmonic;

wire Sample_Pulse;

wire [7:0] nios_Red, nios_Green, nios_Blue, myRed, myGreen, myBlue;

//reading range
wire PhaseA_Analog_Read_Enable , PhaseB_Analog_Read_Enable, PhaseC_Tri_Analog_Read_Enable;

//ADC section
wire [7:0] PhaseA_DATA_Out_V, PhaseB_DATA_Out_V, PhaseC_DATA_Out_V, PhaseA_DATA_Out_I, PhaseB_DATA_Out_I, PhaseC_DATA_Out_I;

//Nios read address
wire [11:0] Nios_Read_Address;

//Finish writing a whole sample from load circuit
wire Writing_Finish_Flag;

//Phase A voltage (Nios & GUI)
wire [7:0] PhaseA_Voltage_Nios_Out, PhaseA_Voltage_GUI_Out;
//Phase B voltage (Nios & GUI)
wire [7:0] PhaseB_Voltage_Nios_Out, PhaseB_Voltage_GUI_Out;
//Phase C voltage (Nios & GUI)
wire [7:0] PhaseC_Voltage_Nios_Out, PhaseC_Voltage_GUI_Out;
//Phase A current (Nios & GUI)
wire [7:0] PhaseA_Current_Nios_Out, PhaseA_Current_GUI_Out;
//Phase B current (Nios & GUI)
wire [7:0] PhaseB_Current_Nios_Out, PhaseB_Current_GUI_Out;
//Phase C current (Nios & GUI)
wire [7:0] PhaseC_Current_Nios_Out, PhaseC_Current_GUI_Out;

wire DeSW0, DeSW1, DeSW2, DeSW3, DeSW4, DeSW5, DeSW6, DeSW7, DeSW8, DeSW9, DeSW10, DeSW12, DeSW13, DeSW14, DeSW15, DeSW16;
wire DePush_0, DePush_1, DePush_2, DePush_3;
wire DeReset;

assign Red = myRed;
assign Green = myGreen;
assign Blue = myBlue;

Debouncer Debouncer_inst(
	.clk(clk),
	//input switches
	.SW0(SW0),
	.SW1(SW1),
	.SW2(SW2),
	.SW3(SW3),
	.SW4(SW4),
	.SW5(SW5),
	.SW6(SW6),
	.SW7(SW7),
	.SW8(SW8),
	.SW9(SW9),
	.SW10(SW10),
	.SW12(SW12),
	.SW13(SW13),
	.SW14(SW14),
	.SW15(SW15),
	.SW16(SW16),
	.reset(reset),
	//input push buttons
	.Push_0(Push_0),
	.Push_1(Push_1),
	.Push_2(Push_2),
	.Push_3(Push_3),
	//output debounced switches
	.DeSW0(DeSW0),
	.DeSW1(DeSW1),
	.DeSW2(DeSW2),
	.DeSW3(DeSW3),
	.DeSW4(DeSW4),
	.DeSW5(DeSW5),
	.DeSW6(DeSW6),
	.DeSW7(DeSW7),
	.DeSW8(DeSW8),
	.DeSW9(DeSW9),
	.DeSW10(DeSW10),
	.DeSW12(DeSW12),
	.DeSW13(DeSW13),
	.DeSW14(DeSW14),
	.DeSW15(DeSW15),
	.DeSW16(DeSW16),
	.DeReset(DeReset),
	//output debounced push buttons
	.DePush_0(DePush_0),
	.DePush_1(DePush_1),
	.DePush_2(DePush_2),
	.DePush_3(DePush_3)
);

NiosII_Controlled_SectionBAK u0 (
		.channel1_analog_export     (PhaseA_Voltage_Nios_Out), //     channel1_analog.export
		.channel2_analog_export     (PhaseB_Voltage_Nios_Out), //     channel2_analog.export
		.channel3_analog_export     (PhaseC_Voltage_Nios_Out), //     channel3_analog.export
		.channel4_analog_export     (PhaseA_Current_Nios_Out), //     channel4_analog.export
		.channel5_analog_export     (PhaseB_Current_Nios_Out), //     channel5_analog.export
		.channel6_analog_export     (PhaseC_Current_Nios_Out), //     channel6_analog.export
		.clk_clk                    (clk),                     //                 clk.clk
		.read_new_sample_export     (DeSW5),     					 //     read_new_sample.export
		.writing_finish_flag_export (Writing_Finish_Flag),     //     writing_finish_flag.export
		.read_address_export        (Nios_Read_Address),       //        read_address.export
		.reset_reset_n              (DeReset),            		 //               reset.reset_n
		.sram_DQ                    (SRAM_DQ),                 //                sram.DQ
		.sram_ADDR                  (SRAM_Address),            //                    .ADDR
		.sram_LB_N                  (SRAM_LB_N),               //                    .LB_N
		.sram_UB_N                  (SRAM_UB_N),               //                    .UB_N
		.sram_CE_N                  (SRAM_CE_N),               //                    .CE_N
		.sram_OE_N                  (SRAM_OE_N),               //                    .OE_N
		.sram_WE_N                  (SRAM_WE_N),               //                    .WE_N
		.vga_CLK                    (VGA_CLK),                 //                 vga.CLK
		.vga_HS                     (Hsync),                   //                    .HS
		.vga_VS                     (Vsync),                   //                    .VS
		.vga_BLANK                  (Blank_n),                 //                    .BLANK
		.vga_SYNC                   (Sync_n),                  //                    .SYNC
		.H_counter						 (H_counter),
		.V_counter						 (V_counter),
		.vga_R                      (nios_Red),                //                    .R
		.vga_G                      (nios_Green),              //                    .G
		.vga_B                      (nios_Blue)                //                    .B
	);

Sines_topde2 Sines_topde2_inst(
	.CLKIN(clk),
	.reset_1(DeReset),
	//controls 
	.Push_3(DePush_3),
	.Push_2(DePush_2),
	.Push_0(DePush_0),
	.SW1(DeSW1),
	.SW0(DeSW0),
	.Push_1(DePush_1),
	.SW2(DeSW2),
	.Reload(DeSW3),
	.SW7(DeSW7),
	.SW8(DeSW8),
	.SW9(DeSW9),
	.SW10(DeSW10),
	//Harmonic number HEXs
	.HEX0_O(HEX0),
	.HEX1_O(HEX1),
	.HEX2_O(HEX2),
	.HEX3_O(HEX3),
	//PWM outputs
	.Phase_A(Phase_A),
	.Phase_A_1(Phase_A_Neg),
	.Phase_B(Phase_B),
	.Phase_B_1(Phase_B_Neg),
	.Phase_C(Phase_C),
	.Phase_C_1(Phase_C_Neg),
	//Harmonic indicator
	.HEX5(HEX5),
	.HEX4(HEX4),
	//Signals coming from trunk line 
	.PhaseA_Analog(PhaseA_Analog),
	.PhaseB_Analog(PhaseB_Analog),
	.PhaseC_Tri_Analog(PhaseC_Tri_Analog),
	.PhaseA_PWM(PhaseA_PWM),
	.PhaseB_PWM(PhaseB_PWM),
	.PhaseC_PWM(PhaseC_PWM),
	.Sample_Pulse(Sample_Pulse)
);

DATA_Store DATA_Store_inst(
	.clk(clk),
	.VGA_CLK(VGA_CLK),
	.reset(DeReset),
	//Get new value signals
	.Push_0(DePush_0),
	.Push_1(DePush_1),
	.Push_2(DePush_2),
	.Push_3(DePush_3),
	//DATA input signals
	.Sample_Pulse(Sample_Pulse),
	.PhaseA_Analog(PhaseA_Analog),
	.PhaseB_Analog(PhaseB_Analog),
	.PhaseC_Tri_Analog(PhaseC_Tri_Analog),
	.PhaseA_PWM(PhaseA_PWM),
	.PhaseB_PWM(PhaseB_PWM),
	.PhaseC_PWM(PhaseC_PWM),
	//RAM outputs
	//Analog 
	.PhaseA_Analog_Stored(PhaseA_Analog_Stored),
	.PhaseB_Analog_Stored(PhaseB_Analog_Stored),
	.PhaseC_Tri_Analog_Stored(PhaseC_Tri_Analog_Stored),
	//PWM
	.PhaseA_PWM_Stored(PhaseA_PWM_Stored),
	.PhaseB_PWM_Stored(PhaseB_PWM_Stored),
	.PhaseC_PWM_Stored(PhaseC_PWM_Stored),
	//PWM Correction 
	.PhaseA_PWM_Correction_Stored(PhaseA_PWM_Correction_Stored),
	.PhaseB_PWM_Correction_Stored(PhaseB_PWM_Correction_Stored),
	.PhaseC_PWM_Correction_Stored(PhaseC_PWM_Correction_Stored),
	//Reading input enable signals
	.PhaseA_Analog_Read_Enable(PhaseA_Analog_Read_Enable),
	.PhaseB_Analog_Read_Enable(PhaseB_Analog_Read_Enable),
	.PhaseC_Tri_Analog_Read_Enable(PhaseC_Tri_Analog_Read_Enable),
	//Storing harmonic values 
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2),
	.HEX3(HEX3),
	.SW0(DeSW0),
	.SW1(DeSW1),
	.SW2(DeSW2),
	.SW3(DeSW3),
	//Exporting harmonic values after data processing
	.Original_Signal(Original_Signal),
	.Third_Harmonic(Third_Harmonic),
	.Nineth_Harmonic(Nineth_Harmonic),
	.Fiftenth_Harmonic(Fiftenth_Harmonic),
	//Storing ADC data coming from load circuit
	//Voltages
	.PhaseA_DATA_Out_V(PhaseA_DATA_Out_V),
	.PhaseB_DATA_Out_V(PhaseB_DATA_Out_V),
	.PhaseC_DATA_Out_V(PhaseC_DATA_Out_V),
	//Currents
	.PhaseA_DATA_Out_I(PhaseA_DATA_Out_I),
	.PhaseB_DATA_Out_I(PhaseB_DATA_Out_I),
	.PhaseC_DATA_Out_I(PhaseC_DATA_Out_I),
	//CS input, don't care if it is CS_I or CS_V both are the same, seperated to avoid possible fanout limit
	.CS_I(CS_I),
	//Nios read address
	.Nios_Read_Address(Nios_Read_Address),
	.User_Take_Sample(DeSW4),
	//Writing Finish Flag, finish writing a whole sample from load circuit
	.Writing_Finish_Flag(Writing_Finish_Flag),
	//Phase A voltage (Nios & GUI)
	.PhaseA_Voltage_Nios_Out(PhaseA_Voltage_Nios_Out),
	.PhaseA_Voltage_GUI_Out (PhaseA_Voltage_GUI_Out),
	//Phase B voltage (Nios & GUI)
	.PhaseB_Voltage_Nios_Out(PhaseB_Voltage_Nios_Out),
	.PhaseB_Voltage_GUI_Out (PhaseB_Voltage_GUI_Out),
	//Phase C voltage (Nios & GUI)
	.PhaseC_Voltage_Nios_Out(PhaseC_Voltage_Nios_Out),
	.PhaseC_Voltage_GUI_Out (PhaseC_Voltage_GUI_Out),
	//Phase A current (Nios & GUI)
	.PhaseA_Current_Nios_Out(PhaseA_Current_Nios_Out),
	.PhaseA_Current_GUI_Out (PhaseA_Current_GUI_Out),
	//Phase B current (Nios & GUI)
	.PhaseB_Current_Nios_Out(PhaseB_Current_Nios_Out),
	.PhaseB_Current_GUI_Out (PhaseB_Current_GUI_Out),
	//Phase C current (Nios & GUI)
	.PhaseC_Current_Nios_Out(PhaseC_Current_Nios_Out),
	.PhaseC_Current_GUI_Out (PhaseC_Current_GUI_Out),
	
);

GUI GUI_inst(
	.VGA_CLK(VGA_CLK),
	.reset(DeReset),
	.Hsync(Hsync),
	//Harmonic counter
	.SW0(DeSW0),
	.SW1(DeSW1),
	.SW2(DeSW2),
	//Harmonic negation
	.SW7(DeSW7),
	.SW8(DeSW8),
	.SW9(DeSW9),
	.SW10(DeSW10),
	//Page control
	.SW12(DeSW12), //This decides whether to display voltage or current from load circuit
	.SW14(DeSW14),
	.SW15(DeSW15),
	.SW16(DeSW16),
	//Input counters
	.H_counter(H_counter),
	.V_counter(V_counter),
	//Input data coming from DATA_Store module
	//Analog
	.PhaseA_Analog_Stored(PhaseA_Analog_Stored),
	.PhaseB_Analog_Stored(PhaseB_Analog_Stored),
	.PhaseC_Tri_Analog_Stored(PhaseC_Tri_Analog_Stored),
	//PWM
	.PhaseA_PWM_Stored(PhaseA_PWM_Stored),
	.PhaseB_PWM_Stored(PhaseB_PWM_Stored),
	.PhaseC_PWM_Stored(PhaseC_PWM_Stored),
	//PWM Correction 
	.PhaseA_PWM_Correction_Stored(PhaseA_PWM_Correction_Stored),
	.PhaseB_PWM_Correction_Stored(PhaseB_PWM_Correction_Stored),
	.PhaseC_PWM_Correction_Stored(PhaseC_PWM_Correction_Stored),
	.PWM_Correction_Enable_Switch(DeSW13),
	//Reading output enable signals going to DATA_Store module
	.PhaseA_Analog_Read_Enable(PhaseA_Analog_Read_Enable),
	.PhaseB_Analog_Read_Enable(PhaseB_Analog_Read_Enable),
	.PhaseC_Tri_Analog_Read_Enable(PhaseC_Tri_Analog_Read_Enable),
	//Input Harmonics
	.Original_Signal(Original_Signal),
	.Third_Harmonic(Third_Harmonic),
	.Nineth_Harmonic(Nineth_Harmonic),
	.Fiftenth_Harmonic(Fiftenth_Harmonic),
	//Load circuit voltages 
	.PhaseA_Voltage_GUI(PhaseA_Voltage_GUI_Out),
	.PhaseB_Voltage_GUI(PhaseB_Voltage_GUI_Out),
	.PhaseC_Voltage_GUI(PhaseC_Voltage_GUI_Out),
	//Load circuit currents
	.PhaseA_Current_GUI(PhaseA_Current_GUI_Out),
	.PhaseB_Current_GUI(PhaseB_Current_GUI_Out),
	.PhaseC_Current_GUI(PhaseC_Current_GUI_Out),
	//Red, Green and Blue output signals, to be multiplexed with nios_Red, nios_Green and nios_Blue
	.Red(myRed),
	.Green(myGreen),
	.Blue(myBlue)
);

ADCs ADCs_Inst(
	.clk(clk),
	.reset(DeReset),
	//ADC clks and CSs
	/********************/
	//Voltages clks and CSs
	.ADC_clk_V(ADC_clk_V),
	.CS_V(CS_V),
	/********************/
	//Currents clks and CSs
	.ADC_clk_I(ADC_clk_I),
	.CS_I(CS_I),	
	//Input Voltages
	.PhaseA_DATA_In_V(PhaseA_DATA_In_V),
	.PhaseB_DATA_In_V(PhaseB_DATA_In_V),
	.PhaseC_DATA_In_V(PhaseC_DATA_In_V),
	//Input Currents
	.PhaseA_DATA_In_I(PhaseA_DATA_In_I),
	.PhaseB_DATA_In_I(PhaseB_DATA_In_I),
	.PhaseC_DATA_In_I(PhaseC_DATA_In_I),
	//Output Voltages
	.PhaseA_DATA_Out_V(PhaseA_DATA_Out_V),
	.PhaseB_DATA_Out_V(PhaseB_DATA_Out_V),
	.PhaseC_DATA_Out_V(PhaseC_DATA_Out_V),
	//Output Currents
	.PhaseA_DATA_Out_I(PhaseA_DATA_Out_I),
	.PhaseB_DATA_Out_I(PhaseB_DATA_Out_I),
	.PhaseC_DATA_Out_I(PhaseC_DATA_Out_I),
);
endmodule 