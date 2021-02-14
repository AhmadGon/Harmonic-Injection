module DATA_Store(
	input clk, reset, Sample_Pulse, VGA_CLK, Push_0, Push_1, Push_2, Push_3,
	//Analog Signals going to RAM and coming out of RAM
	input [9:0] PhaseA_Analog, PhaseB_Analog, PhaseC_Tri_Analog,
	output [9:0] PhaseA_Analog_Stored, PhaseB_Analog_Stored, PhaseC_Tri_Analog_Stored,
	//PWM signals going to RAM and coming out of RAM
	input PhaseA_PWM, PhaseB_PWM, PhaseC_PWM,
	output PhaseA_PWM_Stored, PhaseB_PWM_Stored, PhaseC_PWM_Stored,
	//PWM Correction
	output PhaseA_PWM_Correction_Stored, PhaseB_PWM_Correction_Stored, PhaseC_PWM_Correction_Stored,
	//Read enable signals
	input PhaseA_Analog_Read_Enable, PhaseB_Analog_Read_Enable, PhaseC_Tri_Analog_Read_Enable,
	//Inputs related to harmonics
	input SW0, SW1, SW2, SW3,
	input [6:0] HEX0, HEX1, HEX2, HEX3,
	//output harmonic registers
	output reg [15:0] Original_Signal, Third_Harmonic, Nineth_Harmonic, Fiftenth_Harmonic,
	//syntax structure: [15:12] : Ones, [11:8] OneTenth, [7:4] OneHundredth, [3:0] OneThousandth
	//ADC input values (these values are coming from load circuit)
	input [7:0] PhaseA_DATA_Out_V, PhaseB_DATA_Out_V, PhaseC_DATA_Out_V, PhaseA_DATA_Out_I, PhaseB_DATA_Out_I, PhaseC_DATA_Out_I,
	//CS is used as a clock for the write counter that counts the samples coming from load circuit and write these values inside M9K
	input CS_I,
	//Nios read address
	input [11:0] Nios_Read_Address,
	//User take sample signal is a user controlled switch that allows the user to decide when to start taking samples from load 
	//circuit the rest is automatically handled
	input User_Take_Sample,
	//Flag indicates finish writing a sample from load circuit
	output reg Writing_Finish_Flag,
	//Phase voltages outputs for both nios and GUI 
	output [7:0] PhaseA_Voltage_Nios_Out, PhaseA_Voltage_GUI_Out,
	output [7:0] PhaseB_Voltage_Nios_Out, PhaseB_Voltage_GUI_Out,
	output [7:0] PhaseC_Voltage_Nios_Out, PhaseC_Voltage_GUI_Out,
	//Phase Currents outputs for both nios and GUI
	output [7:0] PhaseA_Current_Nios_Out, PhaseA_Current_GUI_Out,
	output [7:0] PhaseB_Current_Nios_Out, PhaseB_Current_GUI_Out,
	output [7:0] PhaseC_Current_Nios_Out, PhaseC_Current_GUI_Out
);

//Writing address is mutual between all RAMs
reg [8:0] write_address;
//Read addresses for analog signals
reg [8:0] PhaseA_Analog_Read_Address;
reg [8:0] PhaseB_Analog_Read_Address;
reg [8:0] PhaseC_Tri_Analog_Read_Address;
//Signal to change between reading and writing signals
reg write_read_Switch;
//Clocks to tick the entire memory body
wire CLOCKS;
//Address for analog signals
wire[8:0] PhaseA_Analog_Addresses;
wire[8:0] PhaseB_Analog_Addresses;
wire[8:0] PhaseC_Tri_Analog_Addresses;

assign CLOCKS = (write_read_Switch)? Sample_Pulse : VGA_CLK;

//Addresses multiplexiers for analog signals
assign PhaseA_Analog_Addresses = (write_read_Switch)? write_address : PhaseA_Analog_Read_Address;
assign PhaseB_Analog_Addresses = (write_read_Switch)? write_address : PhaseB_Analog_Read_Address;
assign PhaseC_Tri_Analog_Addresses = (write_read_Switch)? write_address : PhaseC_Tri_Analog_Read_Address;

// Synchronizing incoming harmonic data
reg[9:0] PhaseA_Analog_Sync, PhaseB_Analog_Sync, PhaseC_Tri_Analog_Sync;
reg PhaseA_PWM_Sync, PhaseB_PWM_Sync, PhaseC_PWM_Sync;
always @(posedge clk)
	begin
	PhaseA_Analog_Sync <= PhaseA_Analog;
	PhaseB_Analog_Sync <= PhaseB_Analog;
	PhaseC_Tri_Analog_Sync <= PhaseC_Tri_Analog;
	PhaseA_PWM_Sync <= PhaseA_PWM;
	PhaseB_PWM_Sync <= PhaseB_PWM;
	PhaseC_PWM_Sync <= PhaseC_PWM;
	end
// Synchronizing incoming load data	
reg[7:0] PhaseA_DATA_Out_V_Sync, PhaseB_DATA_Out_V_Sync, PhaseC_DATA_Out_V_Sync;
reg[7:0] PhaseA_DATA_Out_I_Sync, PhaseB_DATA_Out_I_Sync, PhaseC_DATA_Out_I_Sync;
always @(posedge VGA_CLK)
	begin
	PhaseA_DATA_Out_V_Sync <= PhaseA_DATA_Out_V;
	PhaseB_DATA_Out_V_Sync <= PhaseB_DATA_Out_V;
	PhaseC_DATA_Out_V_Sync <= PhaseC_DATA_Out_V;
	PhaseA_DATA_Out_I_Sync <= PhaseA_DATA_Out_I;
	PhaseB_DATA_Out_I_Sync <= PhaseB_DATA_Out_I;
	PhaseC_DATA_Out_I_Sync <= PhaseC_DATA_Out_I;
	end
//========================================================================================
/*****************FPGA Generated Signals***********************/
// Phase A
PhaseA	PhaseA_inst (
	.address ( PhaseA_Analog_Addresses ),
	.clock ( CLOCKS ),
	.data ( PhaseA_Analog_Sync ),
	.wren ( write_read_Switch ),
	.q ( PhaseA_Analog_Stored )
	);
PhaseA_PWM	PhaseA_PWM_inst (
	.address ( PhaseA_Analog_Addresses ),
	.clock ( CLOCKS ),
	.data ( PhaseA_PWM_Sync ),
	.wren ( write_read_Switch ),
	.q ( PhaseA_PWM_Stored )
	);
// Phase B
PhaseB_Analog	PhaseB_Analog_inst (
	.address ( PhaseB_Analog_Addresses ),
	.clock ( CLOCKS ),
	.data ( PhaseB_Analog_Sync ),
	.wren ( write_read_Switch ),
	.q ( PhaseB_Analog_Stored )
	);
PhaseB_PWM	PhaseB_PWM_inst (
	.address ( PhaseB_Analog_Addresses ),
	.clock ( CLOCKS ),
	.data ( PhaseB_PWM_Sync ),
	.wren ( write_read_Switch ),
	.q ( PhaseB_PWM_Stored )
	);

// Phase C
PhaseC_Tri_Analog	PhaseC_Tri_Analog_inst (
	.address ( PhaseC_Tri_Analog_Addresses ),
	.clock ( CLOCKS ),
	.data ( PhaseC_Tri_Analog_Sync ),
	.wren ( write_read_Switch ),
	.q ( PhaseC_Tri_Analog_Stored )
	);
PhaseC_PWM	PhaseC_PWM_inst (
	.address ( PhaseC_Tri_Analog_Addresses ),
	.clock ( CLOCKS ),
	.data ( PhaseC_PWM_Sync ),
	.wren ( write_read_Switch ),
	.q ( PhaseC_PWM_Stored )
	);
/*****************FPGA Read Signals from load circuit***********************/
// Phase A Voltage 	
GUI_Nios_PhaseA_Voltage	GUI_Nios_PhaseA_Voltage_inst (
	.address_a ( Nios_Read_Write ),
	.address_b ( GUI_Read_Write ),
	.clock_a ( VGA_CLK ),
	.clock_b ( VGA_CLK ),
	.data_a ( PhaseA_DATA_Out_V_Sync ), //Data input to FPGA
	.data_b ( PhaseA_DATA_Out_V_Sync ), //Data input to FPGA
	.wren_a ( Write_Read_Enable ),
	.wren_b ( Write_Read_Enable ),
	.q_a ( PhaseA_Voltage_Nios_Out ),
	.q_b ( PhaseA_Voltage_GUI_Out )
	);
// Phase B Voltage
GUI_Nios_PhaseB_Voltage	GUI_Nios_PhaseB_Voltage_inst (
	.address_a ( Nios_Read_Write ),
	.address_b ( GUI_Read_Write ),
	.clock_a ( VGA_CLK ),
	.clock_b ( VGA_CLK ),
	.data_a ( PhaseB_DATA_Out_V_Sync ),
	.data_b ( PhaseB_DATA_Out_V_Sync ),
	.wren_a ( Write_Read_Enable ),
	.wren_b ( Write_Read_Enable ),
	.q_a ( PhaseB_Voltage_Nios_Out ),
	.q_b ( PhaseB_Voltage_GUI_Out )
	);
// Phase C Voltage
GUI_Nios_PhaseC_Voltage	GUI_Nios_PhaseC_Voltage_inst (
	.address_a ( Nios_Read_Write ),
	.address_b ( GUI_Read_Write ),
	.clock_a ( VGA_CLK ),
	.clock_b ( VGA_CLK ),
	.data_a ( PhaseC_DATA_Out_V_Sync ),
	.data_b ( PhaseC_DATA_Out_V_Sync ),
	.wren_a ( Write_Read_Enable ),
	.wren_b ( Write_Read_Enable ),
	.q_a ( PhaseC_Voltage_Nios_Out ),
	.q_b ( PhaseC_Voltage_GUI_Out )
	);
// Phase A Current
GUI_Nios_PhaseA_Current	GUI_Nios_PhaseA_Current_inst (
	.address_a ( Nios_Read_Write ),
	.address_b ( GUI_Read_Write ),
	.clock_a ( VGA_CLK ),
	.clock_b ( VGA_CLK ),
	.data_a ( PhaseA_DATA_Out_I_Sync ),
	.data_b ( PhaseA_DATA_Out_I_Sync ),
	.wren_a ( Write_Read_Enable ),
	.wren_b ( Write_Read_Enable ),
	.q_a ( PhaseA_Current_Nios_Out ),
	.q_b ( PhaseA_Current_GUI_Out )
	);
// Phase B Current
GUI_Nios_PhaseB_Current	GUI_Nios_PhaseB_Current_inst (
	.address_a ( Nios_Read_Write ),
	.address_b ( GUI_Read_Write ),
	.clock_a ( VGA_CLK ),
	.clock_b ( VGA_CLK ),
	.data_a ( PhaseB_DATA_Out_I_Sync ),
	.data_b ( PhaseB_DATA_Out_I_Sync ),
	.wren_a ( Write_Read_Enable ),
	.wren_b ( Write_Read_Enable ),
	.q_a ( PhaseB_Current_Nios_Out ),
	.q_b ( PhaseB_Current_GUI_Out )
	);
// Phase C Current
GUI_Nios_PhaseC_Current	GUI_Nios_PhaseC_Current_inst (
	.address_a ( Nios_Read_Write ),
	.address_b ( GUI_Read_Write ),
	.clock_a ( VGA_CLK ),
	.clock_b ( VGA_CLK ),
	.data_a ( PhaseC_DATA_Out_I_Sync ),
	.data_b ( PhaseC_DATA_Out_I_Sync ),
	.wren_a ( Write_Read_Enable ),
	.wren_b ( Write_Read_Enable ),
	.q_a ( PhaseC_Current_Nios_Out ),
	.q_b ( PhaseC_Current_GUI_Out )
	);

//========================================================================================
//Control logic for storing load voltages and currents coming from load circuit, these
//Dual port RAMs interacte with Nios for file streaming
wire [11:0] Nios_Read_Write, GUI_Read_Write;
	
assign Nios_Read_Write = (Write_Read_Enable)? Sample_Counter : Nios_Read_Address;//Nios_Read_Address this is software written address
assign GUI_Read_Write = (Write_Read_Enable)? Sample_Counter : PhaseA_GUI_Read_Address;

assign Write_Read_Enable = (!Writing_Finish_Flag)? 1 : 0;

reg [10:0] PhaseA_GUI_Read_Address;
reg [11:0] Sample_Counter;

always @(posedge CS_I)
	begin
	if (!User_Take_Sample) Writing_Finish_Flag <= 0;
	else
		begin
		if (!Writing_Finish_Flag && User_Take_Sample)
			begin
			Sample_Counter <= Sample_Counter + 1;
			if (Sample_Counter == 4095) Writing_Finish_Flag <= 1;
			else Writing_Finish_Flag <= 0;
			end
		end
	end
	
always @(posedge VGA_CLK)
	begin
	if (!reset ) PhaseA_GUI_Read_Address <= 0;
	else
		begin
		if (PhaseA_Analog_Read_Enable) //reading area flag
			begin
			PhaseA_GUI_Read_Address <= PhaseA_GUI_Read_Address + 4;
			if (PhaseA_GUI_Read_Address >= 1615) PhaseA_GUI_Read_Address <= 0;
			end
		else if (!PhaseA_Analog_Read_Enable) PhaseA_GUI_Read_Address <= 0;
		else PhaseA_GUI_Read_Address <= 0;
		end
	end
//========================================================================================
//Harmonic values output registers (harmonic values store)
/*********temporary registers*******/
reg [3:0] Ones;
reg [3:0] OneTenth;
reg [3:0] OneHundredth;
reg [3:0] OneThousandth;
/***********************************/
wire [2:0] Harmonic_Value;
assign Harmonic_Value = SW0 + SW1 + SW2;   //Find the selected harmonic

always @(posedge VGA_CLK)
	begin
	case(HEX0)
	7'b1000000: OneThousandth <= 0;
	7'b1111001: OneThousandth <= 1;
	7'b0100100: OneThousandth <= 2;
	7'b0110000: OneThousandth <= 3;
	7'b0011001: OneThousandth <= 4;
	7'b0010010: OneThousandth <= 5;
	7'b0000010: OneThousandth <= 6;
	7'b1111000: OneThousandth <= 7;
	7'b0000000: OneThousandth <= 8;
	7'b0010000: OneThousandth <= 9;
	endcase
	case(HEX1)
	7'b1000000: OneHundredth <= 0;
	7'b1111001: OneHundredth <= 1;
	7'b0100100: OneHundredth <= 2;
	7'b0110000: OneHundredth <= 3;
	7'b0011001: OneHundredth <= 4;
	7'b0010010: OneHundredth <= 5;
	7'b0000010: OneHundredth <= 6;
	7'b1111000: OneHundredth <= 7;
	7'b0000000: OneHundredth <= 8;
	7'b0010000: OneHundredth <= 9;
	endcase
	case(HEX2)
	7'b1000000: OneTenth <= 0;
	7'b1111001: OneTenth <= 1;
	7'b0100100: OneTenth <= 2;
	7'b0110000: OneTenth <= 3;
	7'b0011001: OneTenth <= 4;
	7'b0010010: OneTenth <= 5;
	7'b0000010: OneTenth <= 6;
	7'b1111000: OneTenth <= 7;
	7'b0000000: OneTenth <= 8;
	7'b0010000: OneTenth <= 9;
	endcase
	case(HEX3)
	7'b1000000: Ones <= 0;
	7'b1111001: Ones <= 1;
	7'b0100100: Ones <= 2;
	7'b0110000: Ones <= 3;
	7'b0011001: Ones <= 4;
	7'b0010010: Ones <= 5;
	7'b0000010: Ones <= 6;
	7'b1111000: Ones <= 7;
	7'b0000000: Ones <= 8;
	7'b0010000: Ones <= 9;
	endcase
	end
always @(posedge VGA_CLK)
	begin
	if (SW3) // Check if the harmonic value is loaded
		begin
		case(Harmonic_Value)
		0: Original_Signal <= {Ones, OneTenth, OneHundredth, OneThousandth};
		1: Third_Harmonic <= {Ones, OneTenth, OneHundredth, OneThousandth};
		2: Nineth_Harmonic <= {Ones, OneTenth, OneHundredth, OneThousandth};
		3: Fiftenth_Harmonic <= {Ones, OneTenth, OneHundredth, OneThousandth};
		endcase
		end
	end
/******************************************************************************/
//PWM drawing corrections (when jumping from 0 to 1 or from 1 to 0 I will draw a vertical line)
assign PhaseA_PWM_Correction_Stored = PhaseA_JumpDetected;
assign PhaseB_PWM_Correction_Stored = PhaseB_JumpDetected;
assign PhaseC_PWM_Correction_Stored = PhaseC_JumpDetected;
/**********************************************************/
//Phase A
reg [1:0] PhaseA_JumpCheckingRegister;
reg PhaseA_RegAddress;
wire PhaseA_JumpDetected; //set when jump is detected
assign PhaseA_JumpDetected = (PhaseA_JumpCheckingRegister[0] != PhaseA_JumpCheckingRegister[1])? 1 : 0;
always @(posedge VGA_CLK)
	begin
	if (!reset || !Push_0 || !Push_1 || !Push_2 || !Push_3) PhaseA_RegAddress <= 0;
	else
		begin
		PhaseA_RegAddress <= PhaseA_RegAddress + 1;
		end
	end
always @(PhaseA_RegAddress)
	begin
	PhaseA_JumpCheckingRegister[PhaseA_RegAddress] <= PhaseA_PWM_Stored;
	end
/**********************************************************/
//Phase B
reg [1:0] PhaseB_JumpCheckingRegister;
reg PhaseB_RegAddress;
wire PhaseB_JumpDetected; //set when jump is detected
assign PhaseB_JumpDetected = (PhaseB_JumpCheckingRegister[0] != PhaseB_JumpCheckingRegister[1])? 1 : 0;
always @(posedge VGA_CLK)
	begin
	if (!reset || !Push_0 || !Push_1 || !Push_2 || !Push_3) PhaseB_RegAddress <= 0;
	else
		begin
		PhaseB_RegAddress <= PhaseB_RegAddress + 1;
		end
	end
always @(PhaseB_RegAddress)
	begin
	PhaseB_JumpCheckingRegister[PhaseB_RegAddress] <= PhaseB_PWM_Stored;
	end
/**********************************************************/
//Phase C
reg [1:0] PhaseC_JumpCheckingRegister;
reg PhaseC_RegAddress;
wire PhaseC_JumpDetected; //set when jump is detected
assign PhaseC_JumpDetected = (PhaseC_JumpCheckingRegister[0] != PhaseC_JumpCheckingRegister[1])? 1 : 0;
always @(posedge VGA_CLK)
	begin
	if (!reset || !Push_0 || !Push_1 || !Push_2 || !Push_3) PhaseC_RegAddress <= 0;
	else
		begin
		PhaseC_RegAddress <= PhaseC_RegAddress + 1;
		end
	end
always @(PhaseC_RegAddress)
	begin
	PhaseC_JumpCheckingRegister[PhaseC_RegAddress] <= PhaseC_PWM_Stored;
	end
//========================================================================================
//Control logic for writing and reading to and from SRAM M9K blocks without Nios interaction
//Write address, write_address counts when there is Sample_Pulse
always @(posedge Sample_Pulse)
	begin
	if (!reset || !Push_0 || !Push_1 || !Push_2 || !Push_3) write_address <= 0;
	else
		begin
		write_address <= write_address + 1;
		if (write_address == 404) write_address <= 0;
		end
	end
//write_read_Switch is controlled by write_address since this is the dominant address
always @(posedge VGA_CLK)
	begin
	if (!reset || !Push_0 || !Push_1 || !Push_2 || !Push_3) write_read_Switch <= 0;
	else
		begin
		if (write_address == 404) write_read_Switch <= 0;
		else write_read_Switch <= 1;
		end
	end
//Read address, it counts when reaching the desired reading area on the screen
/////////////PhaseA Analog\\\\\\\\\\\\\\
always @(posedge VGA_CLK)
	begin
	if (!reset || !Push_0 || !Push_1 || !Push_2 || !Push_3) PhaseA_Analog_Read_Address <= 0;
	else
		begin
		if (PhaseA_Analog_Read_Enable) //reading area flag
			begin
			PhaseA_Analog_Read_Address <= PhaseA_Analog_Read_Address + 1;
			if (PhaseA_Analog_Read_Address == 404) PhaseA_Analog_Read_Address <= 0;
			end
		else if (!PhaseA_Analog_Read_Enable) PhaseA_Analog_Read_Address <= 0;
		else PhaseA_Analog_Read_Address <= 0;
		end
	end
/////////////PhaseB Analog\\\\\\\\\\\\\\
always @(posedge VGA_CLK)
	begin
	if (!reset || !Push_0 || !Push_1 || !Push_2 || !Push_3) PhaseB_Analog_Read_Address <= 0;
	else
		begin
		if (PhaseB_Analog_Read_Enable) //reading area flag
			begin
			PhaseB_Analog_Read_Address <= PhaseB_Analog_Read_Address + 1;
			if (PhaseB_Analog_Read_Address == 404) PhaseB_Analog_Read_Address <= 0;
			end
		else if (!PhaseB_Analog_Read_Enable) PhaseB_Analog_Read_Address <= 0;
		else PhaseB_Analog_Read_Address <= 0;
		end
	end
/////////////PhaseC Analog|| Triangular Analog\\\\\\\\\\\\\\
always @(posedge VGA_CLK)
	begin
	if (!reset || !Push_0 || !Push_1 || !Push_2 || !Push_3) PhaseC_Tri_Analog_Read_Address <= 0;
	else
		begin
		if (PhaseC_Tri_Analog_Read_Enable) //reading area flag
			begin
			PhaseC_Tri_Analog_Read_Address <= PhaseC_Tri_Analog_Read_Address + 1;
			if (PhaseC_Tri_Analog_Read_Address == 404) PhaseC_Tri_Analog_Read_Address <= 0;
			end
		else if (!PhaseC_Tri_Analog_Read_Enable) PhaseC_Tri_Analog_Read_Address <= 0;
		else PhaseC_Tri_Analog_Read_Address <= 0;
		end
	end
//========================================================================================
endmodule 