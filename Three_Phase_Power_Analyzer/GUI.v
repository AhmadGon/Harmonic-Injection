module GUI(
	input VGA_CLK, reset, Hsync,
	//Input counters
	input [10:1] H_counter, V_counter,
	//Input Data coming from DATA_Store module
	//Analog
	input [9:0] PhaseA_Analog_Stored, PhaseB_Analog_Stored, PhaseC_Tri_Analog_Stored,
	//PWM
	input PhaseA_PWM_Stored, PhaseB_PWM_Stored, PhaseC_PWM_Stored,
	//PWM Correction 
	input PhaseA_PWM_Correction_Stored, PhaseB_PWM_Correction_Stored, PhaseC_PWM_Correction_Stored,
	//PWM Correction enable switch
	input PWM_Correction_Enable_Switch,
	//Output Read enable signals to DATA_Store module
	output reg PhaseA_Analog_Read_Enable, PhaseB_Analog_Read_Enable, PhaseC_Tri_Analog_Read_Enable,
	//Output Red, Green and Blue
	output [7:0] Red, Green, Blue,
	//Page control
	input SW12, 
	input SW14, SW15, SW16,
	//Input harmonics
	input [15:0] Original_Signal, Third_Harmonic, Nineth_Harmonic, Fiftenth_Harmonic,
	//Harmonic counter
	input SW0, SW1, SW2,
	//Harmonic negation
	input SW7, SW8, SW9, SW10,
	//Load circuit currents and voltages
	input [7:0] PhaseA_Voltage_GUI, PhaseB_Voltage_GUI, PhaseC_Voltage_GUI, PhaseA_Current_GUI, PhaseB_Current_GUI, PhaseC_Current_GUI
);

wire[1:0] Page_counter; //0: Analog page, 1: Digital page, 2: FFT page, 3: Manual page
assign Page_counter = SW14 + SW15 + SW16;

wire[1:0] Harmonic_counter;
assign Harmonic_counter = SW0 + SW1 + SW2;
//================================
//Font ROM
wire [7:0]Character_Out;
reg [10:0]character_address;

Font_ROM	Font_ROM_inst (
	.address ( character_address ),
	.clock ( VGA_CLK ),
	.q ( Character_Out )
	);

//================================
////////Hard coded ROMs\\\\\\\\\
//Phase ROM
wire[63:0] String_out;
reg [5:0] string_address;

StringROM StringROM_inst(
	.VGA_CLK(VGA_CLK),
	.address(string_address),
	.data(String_out)
);
/********************************/
//Harmonic string ROM
wire[31:0] HarmonicString_out;
reg [5:0] HarmonicString_Address;

HarmonicROM HarmonicROM_inst(
	.VGA_CLK(VGA_CLK),
	.address(HarmonicString_Address),
	.data(HarmonicString_out)
);
/*******************************/
//My name ROM
wire[63:0] MyName_out;
reg [4:0] MyName_Address;

MyNameROM MyNameROM_inst(
	.VGA_CLK(VGA_CLK),
	.address(MyName_Address),
	.data(MyName_out)
);

/*******************************/
//Simulate Jumps ROM
wire[63:0] Simulate_Jumps_out;
reg [4:0] Simulate_Jumps_Address;

PWM_Jumps_ROM PWM_Jumps_ROM_inst(
	.VGA_CLK(VGA_CLK),
	.address(Simulate_Jumps_Address),
	.data(Simulate_Jumps_out)
);
//================================
//Slider bar
wire [7:0] Slider_DATA;
reg [14:0] Slider_Address;
reg Slider_H_Enable, Slider_V_Enable;
wire [23:0] Slider_RGB;

Slider_DATA	Slider_DATA_inst (
	.address ( Slider_Address ),
	.clock ( VGA_CLK ),
	.q ( Slider_DATA )
	);

Slider_Colormap	Slider_Colormap_inst (
	.address ( Slider_DATA ),
	.clock ( VGA_CLK ),
	.q ( Slider_RGB )
	);
	
always @(posedge VGA_CLK)
	begin
	if (!reset) Slider_H_Enable <= 0; 
	else if (H_counter > 10 & H_counter < 48) Slider_H_Enable <= 1; 
	else Slider_H_Enable <= 0;
	end
always @(posedge Hsync)
	begin
	if (!reset) Slider_V_Enable <= 0; 
	else if (V_counter > 5 & V_counter < 466) Slider_V_Enable <= 1; 
	else Slider_V_Enable <= 0;
	end
always @(posedge VGA_CLK)
	begin
	if (!reset) Slider_Address <= 0;
	else if (Slider_H_Enable & Slider_V_Enable)
		begin
		Slider_Address <= Slider_Address + 1;
		if (Slider_Address == 17019) Slider_Address <= 0;
		end
	end
//================================
//Project logo 
wire [7:0] Project_DATA;
reg [12:0] Project_Address;
reg Project_H_Enable, Project_V_Enable;
wire [23:0] Project_RGB;

JUSTLOGO_DATA	ProjectLOGO_DATA_inst (
	.address ( Project_Address ),
	.clock ( VGA_CLK ),
	.q ( Project_DATA )
	);

JUSTLOGO_Colormap	JUSTLOGO_Colormap_inst (
	.address ( Project_DATA ),
	.clock ( VGA_CLK ),
	.q ( Project_RGB )
	);

	
always @(posedge VGA_CLK)
	begin
	if (!reset) Project_H_Enable <= 0; 
	else if (H_counter > 555 & H_counter < 631) Project_H_Enable <= 1; 
	else Project_H_Enable <= 0;
	end
always @(posedge Hsync)
	begin
	if (!reset) Project_V_Enable <= 0; 
	else if (V_counter > 25 & V_counter < 101) Project_V_Enable <= 1; 
	else Project_V_Enable <= 0;
	end
always @(posedge VGA_CLK)
	begin
	if (!reset) Project_Address <= 0;
	else if (Project_H_Enable & Project_V_Enable)
		begin
		Project_Address <= Project_Address + 1;
		if (Project_Address == 5624) Project_Address <= 0;
		end
	end
//================================
//Project Title
wire [7:0] Title_DATA;
reg [12:0] Title_Address;
reg Title_H_Enable, Title_V_Enable;
wire [23:0] Title_RGB;

Title_DATA	Title_DATA_inst (
	.address ( Title_Address ),
	.clock ( VGA_CLK ),
	.q ( Title_DATA )
	);
	
Title_Colormap	Title_Colormap_inst (
	.address ( Title_DATA ),
	.clock ( VGA_CLK ),
	.q ( Title_RGB )
	);
	
always @(posedge VGA_CLK)
	begin
	if (!reset) Title_H_Enable <= 0; 
	else if (H_counter > 479 & H_counter < 555) Title_H_Enable <= 1; 
	else Title_H_Enable <= 0;
	end
always @(posedge Hsync)
	begin
	if (!reset) Title_V_Enable <= 0; 
	else if (V_counter > 25 & V_counter < 101) Title_V_Enable <= 1; 
	else Title_V_Enable <= 0;
	end
always @(posedge VGA_CLK)
	begin
	if (!reset) Title_Address <= 0;
	else if (Title_H_Enable & Title_V_Enable)
		begin
		Title_Address <= Title_Address + 1;
		if (Title_Address == 5624) Title_Address <= 0;
		end
	end
//================================
//Time bar
wire [7:0] TimeBar_DATA;
reg [12:0] TimeBar_Address;
reg TimeBar_H_Enable, TimeBar_V_Enable;
wire [23:0] TimeBar_RGB;

TimeBar_DATA	TimeBar_DATA_inst (
	.address ( TimeBar_Address ),
	.clock ( VGA_CLK ),
	.q ( TimeBar_DATA )
	);
TimeBar_Colormap	TimeBar_Colormap_inst (
	.address ( TimeBar_DATA ),
	.clock ( VGA_CLK ),
	.q ( TimeBar_RGB )
	);

	
always @(posedge VGA_CLK)
	begin
	if (!reset) TimeBar_H_Enable <= 0; 
	else if (H_counter > 60 && H_counter < 466) TimeBar_H_Enable <= 1; 
	else TimeBar_H_Enable <= 0;
	end
always @(posedge Hsync)
	begin
	if (!reset) TimeBar_V_Enable <= 0; 
	else if (V_counter > 455 & V_counter < 474) TimeBar_V_Enable <= 1; 
	else TimeBar_V_Enable <= 0;
	end
always @(posedge VGA_CLK)
	begin
	if (!reset) TimeBar_Address <= 0;
	else if (TimeBar_H_Enable & TimeBar_V_Enable)
		begin
		TimeBar_Address <= TimeBar_Address + 1;
		if (TimeBar_Address == 7289) TimeBar_Address <= 0;
		end
	end
//================================
//Manual!
wire [7:0] Manual_DATA;
reg [17:0] Manual_Address;
reg Manual_H_Enable, Manual_V_Enable;
wire [23:0] Manual_RGB;

Manual_DATA	Manual_DATA_inst (
	.address ( Manual_Address ),
	.clock ( VGA_CLK ),
	.q ( Manual_DATA )
	);

	Manual_Colormap	Manual_Colormap_inst (
	.address ( Manual_DATA ),
	.clock ( VGA_CLK ),
	.q ( Manual_RGB )
	);

	
always @(posedge VGA_CLK)
	begin
	if (!reset) Manual_H_Enable <= 0; 
	else if (H_counter > 60 && H_counter < 466) Manual_H_Enable <= 1; 
	else Manual_H_Enable <= 0;
	end
always @(posedge Hsync)
	begin
	if (!reset) Manual_V_Enable <= 0; 
	else if (V_counter > 12 & V_counter < 455) Manual_V_Enable <= 1; 
	else Manual_V_Enable <= 0;
	end
always @(posedge VGA_CLK)
	begin
	if (!reset) Manual_Address <= 0;
	else if (Manual_H_Enable & Manual_V_Enable)
		begin
		Manual_Address <= Manual_Address + 1;
		if (Manual_Address == 179009) Manual_Address <= 0;
		end
	end
//================================
assign Red = (Signals_Region)? RedSignal : RedGUI;
assign Green = (Signals_Region)? GreenSignal : GreenGUI;
assign Blue = (Signals_Region)? BlueSignal : BlueGUI;

reg Signals_Region; //the region that all signals will appear in (analog, digital and FFT)

reg [7:0] RedSignal, GreenSignal, BlueSignal;
reg [7:0] RedGUI, GreenGUI, BlueGUI;
/**********************************************************/
//Drawing signals
always @(posedge VGA_CLK)
	begin
	if (H_counter > 60 && H_counter < 466 && V_counter > 12 && V_counter < 455)
		begin
		Signals_Region <= 1;
		PhaseA_Analog_Read_Enable <= 1;
		PhaseB_Analog_Read_Enable <= 1;
		PhaseC_Tri_Analog_Read_Enable <= 1;
		case(Page_counter)
		0:
			begin
			//======================================
			//Writing Phase A, Phase B and Phase C strings 
			//Phase A
			if (H_counter > 400 && H_counter < 466 && V_counter > 11 && V_counter < 30)
				begin
				string_address <= V_counter - 14;
				if(H_counter > 402 && H_counter < 468 && V_counter > 13 && V_counter < 31)
					begin
					if (String_out[82-H_counter[6:1]] == 1)
						begin
						RedSignal <= 8'h7F;
						GreenSignal <= 8'h7F;
						BlueSignal <= 8'h7F;
						end
					else
						begin
						RedSignal <= 8'h00;
						GreenSignal <= 8'h00;
						BlueSignal <= 8'h00;
						end
					end
				else
					begin
					RedSignal <= 8'h00;
					GreenSignal <= 8'h00;
					BlueSignal <= 8'h00;
					end
				end
			//Phase B
			else if (H_counter > 400 && H_counter < 466 && V_counter > 146 && V_counter < 165)
				begin
				string_address <= V_counter - 133;
				if(H_counter > 402 && H_counter < 468 && V_counter > 148 && V_counter < 166)
					begin
					if (String_out[82-H_counter[6:1]] == 1)
						begin
						RedSignal <= 8'h7F;
						GreenSignal <= 8'h7F;
						BlueSignal <= 8'h7F;
						end
					else
						begin
						RedSignal <= 8'h00;
						GreenSignal <= 8'h00;
						BlueSignal <= 8'h00;
						end
					end
				else
					begin
					RedSignal <= 8'h00;
					GreenSignal <= 8'h00;
					BlueSignal <= 8'h00;
					end
				end
			//Phase C
			else if (H_counter > 400 && H_counter < 466 && V_counter > 296 && V_counter < 315)
				begin
				string_address <= V_counter - 267;
				if(H_counter > 402 && H_counter < 468 && V_counter > 298 && V_counter < 316)
					begin
					if (String_out[82-H_counter[6:1]] == 1)
						begin
						RedSignal <= 8'h7F;
						GreenSignal <= 8'h7F;
						BlueSignal <= 8'h7F;
						end
					else
						begin
						RedSignal <= 8'h00;
						GreenSignal <= 8'h00;
						BlueSignal <= 8'h00;
						end
					end
				else
					begin
					RedSignal <= 8'h00;
					GreenSignal <= 8'h00;
					BlueSignal <= 8'h00;
					end
				end
			//======================================
			//Draw 3 phase analog signals
			else if(PhaseA_Analog_Stored / 5 - 15 == V_counter && V_counter < 141 && V_counter > 15)
				begin
				RedSignal <= 8'hFF;
				GreenSignal <= 8'hFF;
				BlueSignal <= 8'hFF;
				end
			else if (PhaseB_Analog_Stored / 5 + 135 == V_counter && V_counter < 291 && V_counter > 156)
				begin
				RedSignal <= 8'hFF;
				GreenSignal <= 8'h00;
				BlueSignal <= 8'h00;
				end
			else if (PhaseC_Tri_Analog_Stored / 5 + 285 == V_counter && V_counter < 460 && V_counter > 315)
				begin
				RedSignal <= 8'h00;
				GreenSignal <= 8'hFF;
				BlueSignal <= 8'h00;
				end
			else
				begin
				RedSignal <= 8'h00;
				GreenSignal <= 8'h00;
				BlueSignal <= 8'h00;
				end
			end
			//======================================
		1:
			begin
			//======================================
			//Writing Phase A, Phase B and Phase C strings 
			//Phase A
			if (H_counter > 400 && H_counter < 466 && V_counter > 11 && V_counter < 30)
				begin
				string_address <= V_counter - 14;
				if(H_counter > 402 && H_counter < 468 && V_counter > 13 && V_counter < 31)
					begin
					if (String_out[82-H_counter[6:1]] == 1)
						begin
						RedSignal <= 8'h7F;
						GreenSignal <= 8'h7F;
						BlueSignal <= 8'h7F;
						end
					else
						begin
						RedSignal <= 8'h00;
						GreenSignal <= 8'h00;
						BlueSignal <= 8'h00;
						end
					end
				else
					begin
					RedSignal <= 8'h00;
					GreenSignal <= 8'h00;
					BlueSignal <= 8'h00;
					end
				end
			//Phase B
			else if (H_counter > 400 && H_counter < 466 && V_counter > 146 && V_counter < 165)
				begin
				string_address <= V_counter - 133;
				if(H_counter > 402 && H_counter < 468 && V_counter > 148 && V_counter < 166)
					begin
					if (String_out[82-H_counter[6:1]] == 1)
						begin
						RedSignal <= 8'h7F;
						GreenSignal <= 8'h7F;
						BlueSignal <= 8'h7F;
						end
					else
						begin
						RedSignal <= 8'h00;
						GreenSignal <= 8'h00;
						BlueSignal <= 8'h00;
						end
					end
				else
					begin
					RedSignal <= 8'h00;
					GreenSignal <= 8'h00;
					BlueSignal <= 8'h00;
					end
				end
			//Phase C
			else if (H_counter > 400 && H_counter < 466 && V_counter > 296 && V_counter < 315)
				begin
				string_address <= V_counter - 267;
				if(H_counter > 402 && H_counter < 468 && V_counter > 298 && V_counter < 316)
					begin
					if (String_out[82-H_counter[6:1]] == 1)
						begin
						RedSignal <= 8'h7F;
						GreenSignal <= 8'h7F;
						BlueSignal <= 8'h7F;
						end
					else
						begin
						RedSignal <= 8'h00;
						GreenSignal <= 8'h00;
						BlueSignal <= 8'h00;
						end
					end
				else
					begin
					RedSignal <= 8'h00;
					GreenSignal <= 8'h00;
					BlueSignal <= 8'h00;
					end
				end
			//======================================
			//Draw 3 phase PWM signals				
			else if(PhaseA_PWM_Stored * 100 + 35 == V_counter)
				begin
				RedSignal <= 8'hFF;
				GreenSignal <= 8'hFF;
				BlueSignal <= 8'hFF;
				end
			else if (PhaseB_PWM_Stored * 100 + 180 == V_counter)
				begin
				RedSignal <= 8'hFF;
				GreenSignal <= 8'h00;
				BlueSignal <= 8'h00;
				end
			else if (PhaseC_PWM_Stored * 100 + 330 == V_counter)
				begin
				RedSignal <= 8'h00;
				GreenSignal <= 8'hFF;
				BlueSignal <= 8'h00;
				end
			//======================================
			//PWM simulated jumps
			else if (PhaseA_PWM_Correction_Stored == 1 && V_counter > 34 && V_counter < 136 && PWM_Correction_Enable_Switch)
				begin
				RedSignal <= 8'hFF;
				GreenSignal <= 8'hFF;
				BlueSignal <= 8'hFF;				
				end
			else if (PhaseB_PWM_Correction_Stored == 1 && V_counter > 179 && V_counter < 281 && PWM_Correction_Enable_Switch)
				begin
				RedSignal <= 8'hFF;
				GreenSignal <= 8'h00;
				BlueSignal <= 8'h00;				
				end
			else if (PhaseC_PWM_Correction_Stored == 1 && V_counter > 329 && V_counter < 431 && PWM_Correction_Enable_Switch)
				begin
				RedSignal <= 8'h00;
				GreenSignal <= 8'hFF;
				BlueSignal <= 8'h00;				
				end
			//======================================
			else
				begin
				RedSignal <= 8'h00;
				GreenSignal <= 8'h00;
				BlueSignal <= 8'h00;
				end
			end
			//======================================
		2:
			begin
			//======================================
			//Writing Phase A, Phase B and Phase C strings 
			//Phase A
			if (H_counter > 400 && H_counter < 466 && V_counter > 11 && V_counter < 30)
				begin
				string_address <= V_counter - 14;
				if(H_counter > 402 && H_counter < 468 && V_counter > 13 && V_counter < 31)
					begin
					if (String_out[82-H_counter[6:1]] == 1)
						begin
						RedSignal <= 8'h7F;
						GreenSignal <= 8'h7F;
						BlueSignal <= 8'h7F;
						end
					else
						begin
						RedSignal <= 8'h00;
						GreenSignal <= 8'h00;
						BlueSignal <= 8'h00;
						end
					end
				else
					begin
					RedSignal <= 8'h00;
					GreenSignal <= 8'h00;
					BlueSignal <= 8'h00;
					end
				end
			//Phase B
			else if (H_counter > 400 && H_counter < 466 && V_counter > 146 && V_counter < 165)
				begin
				string_address <= V_counter - 133;
				if(H_counter > 402 && H_counter < 468 && V_counter > 148 && V_counter < 166)
					begin
					if (String_out[82-H_counter[6:1]] == 1)
						begin
						RedSignal <= 8'h7F;
						GreenSignal <= 8'h7F;
						BlueSignal <= 8'h7F;
						end
					else
						begin
						RedSignal <= 8'h00;
						GreenSignal <= 8'h00;
						BlueSignal <= 8'h00;
						end
					end
				else
					begin
					RedSignal <= 8'h00;
					GreenSignal <= 8'h00;
					BlueSignal <= 8'h00;
					end
				end
			//Phase C
			else if (H_counter > 400 && H_counter < 466 && V_counter > 296 && V_counter < 315)
				begin
				string_address <= V_counter - 267;
				if(H_counter > 402 && H_counter < 468 && V_counter > 298 && V_counter < 316)
					begin
					if (String_out[82-H_counter[6:1]] == 1)
						begin
						RedSignal <= 8'h7F;
						GreenSignal <= 8'h7F;
						BlueSignal <= 8'h7F;
						end
					else
						begin
						RedSignal <= 8'h00;
						GreenSignal <= 8'h00;
						BlueSignal <= 8'h00;
						end
					end
				else
					begin
					RedSignal <= 8'h00;
					GreenSignal <= 8'h00;
					BlueSignal <= 8'h00;
					end
				end
			//Draw load voltage sample
			else if(PhaseA_Voltage_GUI / 2 + 35 == V_counter && !SW12)
				begin
				RedSignal <= 8'hFF;
				GreenSignal <= 8'hFF;
				BlueSignal <= 8'hFF;
				end
			else if(PhaseB_Voltage_GUI / 2 + 185 == V_counter && !SW12)
				begin
				RedSignal <= 8'hFF;
				GreenSignal <= 8'h00;
				BlueSignal <= 8'h00;
				end
			else if(PhaseC_Voltage_GUI / 2 + 335 == V_counter && !SW12)
				begin
				RedSignal <= 8'h00;
				GreenSignal <= 8'hFF;
				BlueSignal <= 8'h00;
				end
			//Draw load current sample
			else if(PhaseA_Current_GUI / 2 + 35 == V_counter && SW12)
				begin
				RedSignal <= 8'hFF;
				GreenSignal <= 8'hFF;
				BlueSignal <= 8'hFF;
				end
			else if(PhaseB_Current_GUI / 2 + 185 == V_counter && SW12)
				begin
				RedSignal <= 8'hFF;
				GreenSignal <= 8'h00;
				BlueSignal <= 8'h00;
				end
			else if(PhaseC_Current_GUI / 2 + 335 == V_counter && SW12)
				begin
				RedSignal <= 8'h00;
				GreenSignal <= 8'hFF;
				BlueSignal <= 8'h00;
				end
			//Else draw nothing
			else
				begin
				RedSignal <= 8'h00;
				GreenSignal <= 8'h00;
				BlueSignal <= 8'h00;
				end
			//======================================
			//Draw 3 phase FFT voltage signals
			end
			//======================================
		3:
//			//======================================
//			//Draw quick manual image
			begin
			RedSignal <= Manual_RGB [23:16];
			GreenSignal <= Manual_RGB [15:8];
			BlueSignal <= Manual_RGB [7:0];
			end
//			//======================================
		endcase
		end
//======================================
	else
		begin
		Signals_Region <= 0;
		PhaseA_Analog_Read_Enable <= 0;
		PhaseB_Analog_Read_Enable <= 0;
		PhaseC_Tri_Analog_Read_Enable <= 0;
		RedSignal <= 8'h00;
		GreenSignal <= 8'h00;
		BlueSignal <= 8'h00;
		end
	end
/**********************************************************/
//Drawing GUI
always @(posedge VGA_CLK)
	begin
//Draw slider
	if (Slider_H_Enable & Slider_V_Enable )
		begin
		RedGUI <= Slider_RGB[23:16];
		GreenGUI <= Slider_RGB[15:8];
		BlueGUI <= Slider_RGB[7:0];
		end
//======================================
//Draw Project Title
	else if (Title_H_Enable & Title_V_Enable )
		begin
		RedGUI <= Title_RGB[23:16];
		GreenGUI <= Title_RGB[15:8];
		BlueGUI <= Title_RGB[7:0];
		end
//======================================
//Draw Project logo
	else if (Project_H_Enable & Project_V_Enable )
		begin
		RedGUI <= Project_RGB[23:16];
		GreenGUI <= Project_RGB[15:8];
		BlueGUI <= Project_RGB[7:0];
		end
//======================================
//Draw Time bar
	else if (TimeBar_H_Enable & TimeBar_V_Enable)
		begin
		if (Page_counter == 0 || Page_counter == 1)
			begin
			RedGUI <= TimeBar_RGB[23:16];
			GreenGUI <= TimeBar_RGB[15:8];
			BlueGUI <= TimeBar_RGB[7:0];
			end
		end
//======================================
//Draw M string for original signal (0th harmonic)
	else if (H_counter > 480 && H_counter < 514 && V_counter > 150 && V_counter < 169)
		begin
		HarmonicString_Address <= V_counter - 153;
		if(H_counter > 482 && H_counter < 516 && V_counter > 152 && V_counter < 170)
			begin
			if (HarmonicString_out[34-H_counter[5:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
//is M negative ?
	else if (H_counter > 584 && H_counter < 588 && V_counter > 157 && V_counter < 160 && SW7 == 1)
		begin
		RedGUI <= 8'h7F;
		GreenGUI <= 8'h7F;
		BlueGUI <= 8'h7F;
		end
//M chosen ? 
	else if (H_counter > 590 && H_counter < 600 && V_counter > 148 && V_counter < 167 && Harmonic_counter == 0)
		begin
		character_address <= V_counter + 281;
		if(H_counter > 592 && H_counter < 602 && V_counter > 150 && V_counter < 168)
			begin
			if (Character_Out[24-H_counter[5:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
//======================================
//Draw 3rd string for third harmonic 
	else if (H_counter > 480 && H_counter < 514 && V_counter > 170 && V_counter < 189)
		begin
		HarmonicString_Address <= V_counter - 157;
		if(H_counter > 482 && H_counter < 516 && V_counter > 172 && V_counter < 190)
			begin
			if (HarmonicString_out[34-H_counter[5:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
//is 3rd negative ?
	else if (H_counter > 584 && H_counter < 588 && V_counter > 178 && V_counter < 181 && SW8 == 1)
		begin
		RedGUI <= 8'h7F;
		GreenGUI <= 8'h7F;
		BlueGUI <= 8'h7F;
		end
//3rd chosen ? 
	else if (H_counter > 590 && H_counter < 600 && V_counter > 170 && V_counter < 189 && Harmonic_counter == 1)
		begin
		character_address <= V_counter + 259;
		if(H_counter > 592 && H_counter < 602 && V_counter > 172 && V_counter < 190)
			begin
			if (Character_Out[24-H_counter[5:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
//======================================
//Draw 9th string for third harmonic 
	else if (H_counter > 480 && H_counter < 514 && V_counter > 190 && V_counter < 209)
		begin
		HarmonicString_Address <= V_counter - 161;
		if(H_counter > 482 && H_counter < 516 && V_counter > 192 && V_counter < 210)
			begin
			if (HarmonicString_out[34-H_counter[5:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
//is 9th negative ?
	else if (H_counter > 584 && H_counter < 588 && V_counter > 198 && V_counter < 201 && SW9 == 1)
		begin
		RedGUI <= 8'h7F;
		GreenGUI <= 8'h7F;
		BlueGUI <= 8'h7F;
		end
//9th chosen ? 
	else if (H_counter > 590 && H_counter < 600 && V_counter > 190 && V_counter < 209 && Harmonic_counter == 2)
		begin
		character_address <= V_counter + 239;
		if(H_counter > 592 && H_counter < 602 && V_counter > 192 && V_counter < 210)
			begin
			if (Character_Out[24-H_counter[5:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
//======================================
//Draw 15th string for third harmonic 
	else if (H_counter > 480 && H_counter < 514 && V_counter > 210 && V_counter < 229)
		begin
		HarmonicString_Address <= V_counter - 165;
		if(H_counter > 482 && H_counter < 516 && V_counter > 212 && V_counter < 230)
			begin
			if (HarmonicString_out[34-H_counter[5:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
//is 15th negative ?
	else if (H_counter > 584 && H_counter < 588 && V_counter > 218 && V_counter < 221 && SW10 == 1)
		begin
		RedGUI <= 8'h7F;
		GreenGUI <= 8'h7F;
		BlueGUI <= 8'h7F;
		end
//15th chosen ? 
	else if (H_counter > 590 && H_counter < 600 && V_counter > 210 && V_counter < 229 && Harmonic_counter == 3)
		begin
		character_address <= V_counter + 219;
		if(H_counter > 592 && H_counter < 602 && V_counter > 212 && V_counter < 230)
			begin
			if (Character_Out[24-H_counter[5:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
//======================================
//Draw Check box
	else if (H_counter > 480 && H_counter < 499 && V_counter > 240 && V_counter < 259 && Page_counter == 1)
		begin
		RedGUI <= 8'h7F;
		GreenGUI <= 8'h7F;
		BlueGUI <= 8'h7F;
		if (H_counter > 482 && H_counter < 497 && V_counter > 242 && V_counter < 257)
			begin
			RedGUI <= 8'h62;
			GreenGUI <= 8'h62;
			BlueGUI <= 8'h62;
			//Draw Check box enable/disable box
			if (H_counter > 485 && H_counter < 494 && V_counter > 245 && V_counter < 254 && PWM_Correction_Enable_Switch)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				if (H_counter > 487 && H_counter < 492 && V_counter > 247 && V_counter < 252)
					begin
					RedGUI <= 8'h62;
					GreenGUI <= 8'h62;
					BlueGUI <= 8'h62;
					end
				end
			else if (H_counter > 484 && H_counter < 495 && V_counter > 244 && V_counter < 255)
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		end		
//======================================
//Draw Simulate
	else if (H_counter > 500 && H_counter < 565 && V_counter > 240 && V_counter < 259 && Page_counter == 1)
		begin
		Simulate_Jumps_Address <= V_counter - 243;
		if(H_counter > 502 && H_counter < 567 && V_counter > 242 && V_counter < 260)
			begin
			if (Simulate_Jumps_out[118-H_counter[6:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
//======================================
//Draw Jumps 
	else if (H_counter > 565 && H_counter < 630 && V_counter > 240 && V_counter < 259 && Page_counter == 1)
		begin
		Simulate_Jumps_Address <= V_counter - 227;
		if(H_counter > 567 && H_counter < 632 && V_counter > 242 && V_counter < 260)
			begin
			if (Simulate_Jumps_out[119-H_counter[6:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
//======================================
//Draw Ahmad
	else if (H_counter > 480 && H_counter < 545 && V_counter > 410 && V_counter < 429)
		begin
		MyName_Address <= V_counter - 413;
		if(H_counter > 482 && H_counter < 547 && V_counter > 412 && V_counter < 430)
			begin
			if (MyName_out[98-H_counter[6:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
//======================================
//Draw Alastal
	else if (H_counter > 546 && H_counter < 611 && V_counter > 410 && V_counter < 429)
		begin
		MyName_Address <= V_counter - 397;
		if(H_counter > 548 && H_counter < 613 && V_counter > 412 && V_counter < 430)
			begin
			if (MyName_out[100-H_counter[6:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
//======================================
//Draw colon (:) for every harmonic
	else if (H_counter > 520 && H_counter < 530 && V_counter > 210 && V_counter < 229)
		begin
		character_address <= V_counter + 715;
		if(H_counter > 522 && H_counter < 532 && V_counter > 212 && V_counter < 230 )
			begin
			if (Character_Out[14-H_counter[4:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
	else if (H_counter > 520 && H_counter < 530 && V_counter > 190 && V_counter < 209 )
		begin
		character_address <= V_counter + 735;
		if(H_counter > 522 && H_counter < 532 && V_counter > 192 && V_counter < 210 )
			begin
			if (Character_Out[14-H_counter[4:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
	else if (H_counter > 520 && H_counter < 530 && V_counter > 170 && V_counter < 189 )
		begin
		character_address <= V_counter + 755;
		if(H_counter > 522 && H_counter < 532 && V_counter > 172 && V_counter < 190 )
			begin
			if (Character_Out[14-H_counter[4:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
	else if (H_counter > 520 && H_counter < 530 && V_counter > 150 && V_counter < 169 )
		begin
		character_address <= V_counter + 775;
		if(H_counter > 522 && H_counter < 532 && V_counter > 152 && V_counter < 170 )
			begin
			if (Character_Out[14-H_counter[4:1]] == 1)
				begin
				RedGUI <= 8'h7F;
				GreenGUI <= 8'h7F;
				BlueGUI <= 8'h7F;
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
//======================================
//Draw harmonic values for each harmonic
	//Draw for M
	else if (H_counter > 520 && H_counter < 585 && V_counter > 150 && V_counter < 169 )
		begin
		//Ones digit
		if (H_counter > 530 && H_counter < 540 && V_counter > 150 && V_counter < 169)
			begin
			case(Original_Signal[15:12])
			0: character_address <= V_counter + 617;
			1: character_address <= V_counter + 633;
			2: character_address <= V_counter + 649;
			3: character_address <= V_counter + 665;
			4: character_address <= V_counter + 681;
			5: character_address <= V_counter + 697;
			6: character_address <= V_counter + 713;
			7: character_address <= V_counter + 729;
			8: character_address <= V_counter + 745;
			9: character_address <= V_counter + 761;
			endcase
			if (H_counter > 532 && H_counter < 542 && V_counter > 152 && V_counter < 170)
				begin
				if(Character_Out[12-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Draw a dot
		else if (H_counter > 540 && H_counter < 550 && V_counter > 150 && V_counter < 169 )
			begin
			character_address <= V_counter + 583;
			if(H_counter > 542 && H_counter < 552 && V_counter > 152 && V_counter < 170 )
				begin
				if (Character_Out[22-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Onetenth digit
		else if (H_counter > 550 && H_counter < 560 && V_counter > 150 && V_counter < 169)
			begin
			case(Original_Signal[11:8])
			0: character_address <= V_counter + 617;
			1: character_address <= V_counter + 633;
			2: character_address <= V_counter + 649;
			3: character_address <= V_counter + 665;
			4: character_address <= V_counter + 681;
			5: character_address <= V_counter + 697;
			6: character_address <= V_counter + 713;
			7: character_address <= V_counter + 729;
			8: character_address <= V_counter + 745;
			9: character_address <= V_counter + 761;
			endcase
			if (H_counter > 552 && H_counter < 562 && V_counter > 152 && V_counter < 170)
				begin
				if(Character_Out[16-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Onehundredth digit
		else if (H_counter > 560 && H_counter < 570 && V_counter > 150 && V_counter < 169)
			begin
			case(Original_Signal[7:4])
			0: character_address <= V_counter + 617;
			1: character_address <= V_counter + 633;
			2: character_address <= V_counter + 649;
			3: character_address <= V_counter + 665;
			4: character_address <= V_counter + 681;
			5: character_address <= V_counter + 697;
			6: character_address <= V_counter + 713;
			7: character_address <= V_counter + 729;
			8: character_address <= V_counter + 745;
			9: character_address <= V_counter + 761;
			endcase
			if (H_counter > 562 && H_counter < 572 && V_counter > 152 && V_counter < 170)
				begin
				if(Character_Out[10-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Onethousandth digit
		else if (H_counter > 570 && H_counter < 580 && V_counter > 150 && V_counter < 169)
			begin
			case(Original_Signal[3:0])
			0: character_address <= V_counter + 617;
			1: character_address <= V_counter + 633;
			2: character_address <= V_counter + 649;
			3: character_address <= V_counter + 665;
			4: character_address <= V_counter + 681;
			5: character_address <= V_counter + 697;
			6: character_address <= V_counter + 713;
			7: character_address <= V_counter + 729;
			8: character_address <= V_counter + 745;
			9: character_address <= V_counter + 761;
			endcase
			if (H_counter > 572 && H_counter < 582 && V_counter > 152 && V_counter < 170)
				begin
				if(Character_Out[20-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
	//Draw 3rd
	else if (H_counter > 520 && H_counter < 585 && V_counter > 170 && V_counter < 189 )
		begin
		//Ones digit
		if (H_counter > 530 && H_counter < 540 && V_counter > 170 && V_counter < 189)
			begin
			case(Third_Harmonic[15:12])
			0: character_address <= V_counter + 595;
			1: character_address <= V_counter + 611;
			2: character_address <= V_counter + 627;
			3: character_address <= V_counter + 643;
			4: character_address <= V_counter + 659;
			5: character_address <= V_counter + 675;
			6: character_address <= V_counter + 691;
			7: character_address <= V_counter + 707;
			8: character_address <= V_counter + 723;
			9: character_address <= V_counter + 739;
			endcase
			if (H_counter > 532 && H_counter < 542 && V_counter > 172 && V_counter < 190)
				begin
				if(Character_Out[12-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Draw a dot
		else if (H_counter > 540 && H_counter < 550 && V_counter > 170 && V_counter < 189 )
			begin
			character_address <= V_counter + 563;
			if(H_counter > 542 && H_counter < 552 && V_counter > 172 && V_counter < 190 )
				begin
				if (Character_Out[22-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Onetenth digit
		else if (H_counter > 550 && H_counter < 560 && V_counter > 170 && V_counter < 189)
			begin
			case(Third_Harmonic[11:8])
			0: character_address <= V_counter + 595;
			1: character_address <= V_counter + 611;
			2: character_address <= V_counter + 627;
			3: character_address <= V_counter + 643;
			4: character_address <= V_counter + 659;
			5: character_address <= V_counter + 675;
			6: character_address <= V_counter + 691;
			7: character_address <= V_counter + 707;
			8: character_address <= V_counter + 723;
			9: character_address <= V_counter + 739;
			endcase
			if (H_counter > 552 && H_counter < 562 && V_counter > 172 && V_counter < 190)
				begin
				if(Character_Out[16-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Onehundredth digit
		else if (H_counter > 560 && H_counter < 570 && V_counter > 170 && V_counter < 189)
			begin
			case(Third_Harmonic[7:4])
			0: character_address <= V_counter + 595;
			1: character_address <= V_counter + 611;
			2: character_address <= V_counter + 627;
			3: character_address <= V_counter + 643;
			4: character_address <= V_counter + 659;
			5: character_address <= V_counter + 675;
			6: character_address <= V_counter + 691;
			7: character_address <= V_counter + 707;
			8: character_address <= V_counter + 723;
			9: character_address <= V_counter + 739;
			endcase
			if (H_counter > 562 && H_counter < 572 && V_counter > 172 && V_counter < 190)
				begin
				if(Character_Out[10-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Onethousandth digit
		else if (H_counter > 570 && H_counter < 580 && V_counter > 170 && V_counter < 189)
			begin
			case(Third_Harmonic[3:0])
			0: character_address <= V_counter + 595;
			1: character_address <= V_counter + 611;
			2: character_address <= V_counter + 627;
			3: character_address <= V_counter + 643;
			4: character_address <= V_counter + 659;
			5: character_address <= V_counter + 675;
			6: character_address <= V_counter + 691;
			7: character_address <= V_counter + 707;
			8: character_address <= V_counter + 723;
			9: character_address <= V_counter + 739;
			endcase
			if (H_counter > 572 && H_counter < 582 && V_counter > 172 && V_counter < 190)
				begin
				if(Character_Out[20-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
	//Draw 9th
	else if (H_counter > 520 && H_counter < 585 && V_counter > 190 && V_counter < 209 )
		begin
		//Ones digit
		if (H_counter > 530 && H_counter < 540 && V_counter > 190 && V_counter < 209)
			begin
			case(Nineth_Harmonic[15:12])
			0: character_address <= V_counter + 575;
			1: character_address <= V_counter + 591;
			2: character_address <= V_counter + 607;
			3: character_address <= V_counter + 623;
			4: character_address <= V_counter + 639;
			5: character_address <= V_counter + 655;
			6: character_address <= V_counter + 671;
			7: character_address <= V_counter + 687;
			8: character_address <= V_counter + 703;
			9: character_address <= V_counter + 719;
			endcase
			if (H_counter > 532 && H_counter < 542 && V_counter > 192 && V_counter < 210)
				begin
				if(Character_Out[12-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Draw a dot
		else if (H_counter > 540 && H_counter < 550 && V_counter > 190 && V_counter < 209 )
			begin
			character_address <= V_counter + 543;
			if(H_counter > 542 && H_counter < 552 && V_counter > 192 && V_counter < 210 )
				begin
				if (Character_Out[22-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Onetenth digit
		else if (H_counter > 550 && H_counter < 560 && V_counter > 190 && V_counter < 209)
			begin
			case(Nineth_Harmonic[11:8])
			0: character_address <= V_counter + 575;
			1: character_address <= V_counter + 591;
			2: character_address <= V_counter + 607;
			3: character_address <= V_counter + 623;
			4: character_address <= V_counter + 639;
			5: character_address <= V_counter + 655;
			6: character_address <= V_counter + 671;
			7: character_address <= V_counter + 687;
			8: character_address <= V_counter + 703;
			9: character_address <= V_counter + 719;
			endcase
			if (H_counter > 552 && H_counter < 562 && V_counter > 192 && V_counter < 210)
				begin
				if(Character_Out[16-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Onehundredth digit
		else if (H_counter > 560 && H_counter < 570 && V_counter > 190 && V_counter < 209)
			begin
			case(Nineth_Harmonic[7:4])
			0: character_address <= V_counter + 575;
			1: character_address <= V_counter + 591;
			2: character_address <= V_counter + 607;
			3: character_address <= V_counter + 623;
			4: character_address <= V_counter + 639;
			5: character_address <= V_counter + 655;
			6: character_address <= V_counter + 671;
			7: character_address <= V_counter + 687;
			8: character_address <= V_counter + 703;
			9: character_address <= V_counter + 719;
			endcase
			if (H_counter > 562 && H_counter < 572 && V_counter > 192 && V_counter < 210)
				begin
				if(Character_Out[10-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Onethousandth digit
		else if (H_counter > 570 && H_counter < 580 && V_counter > 190 && V_counter < 209)
			begin
			case(Nineth_Harmonic[3:0])
			0: character_address <= V_counter + 575;
			1: character_address <= V_counter + 591;
			2: character_address <= V_counter + 607;
			3: character_address <= V_counter + 623;
			4: character_address <= V_counter + 639;
			5: character_address <= V_counter + 655;
			6: character_address <= V_counter + 671;
			7: character_address <= V_counter + 687;
			8: character_address <= V_counter + 703;
			9: character_address <= V_counter + 719;
			endcase
			if (H_counter > 572 && H_counter < 582 && V_counter > 192 && V_counter < 210)
				begin
				if(Character_Out[20-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
	//Draw 15th
	else if (H_counter > 520 && H_counter < 585 && V_counter > 210 && V_counter < 229 )
		begin
		//Ones digit
		if (H_counter > 530 && H_counter < 540 && V_counter > 210 && V_counter < 229)
			begin
			case(Fiftenth_Harmonic[15:12])
			0: character_address <= V_counter + 555;
			1: character_address <= V_counter + 571;
			2: character_address <= V_counter + 587;
			3: character_address <= V_counter + 603;
			4: character_address <= V_counter + 619;
			5: character_address <= V_counter + 635;
			6: character_address <= V_counter + 651;
			7: character_address <= V_counter + 667;
			8: character_address <= V_counter + 683;
			9: character_address <= V_counter + 699;
			endcase
			if (H_counter > 532 && H_counter < 542 && V_counter > 212 && V_counter < 230)
				begin
				if(Character_Out[12-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Draw a dot
		else if (H_counter > 540 && H_counter < 550 && V_counter > 210 && V_counter < 229 )
			begin
			character_address <= V_counter + 523;
			if(H_counter > 542 && H_counter < 552 && V_counter > 212 && V_counter < 230 )
				begin
				if (Character_Out[22-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Onetenth digit
		else if (H_counter > 550 && H_counter < 560 && V_counter > 210 && V_counter < 229)
			begin
			case(Fiftenth_Harmonic[11:8])
			0: character_address <= V_counter + 555;
			1: character_address <= V_counter + 571;
			2: character_address <= V_counter + 587;
			3: character_address <= V_counter + 603;
			4: character_address <= V_counter + 619;
			5: character_address <= V_counter + 635;
			6: character_address <= V_counter + 651;
			7: character_address <= V_counter + 667;
			8: character_address <= V_counter + 683;
			9: character_address <= V_counter + 699;
			endcase
			if (H_counter > 552 && H_counter < 562 && V_counter > 212 && V_counter < 230)
				begin
				if(Character_Out[16-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Onehundredth digit
		else if (H_counter > 560 && H_counter < 570 && V_counter > 210 && V_counter < 229)
			begin
			case(Fiftenth_Harmonic[7:4])
			0: character_address <= V_counter + 555;
			1: character_address <= V_counter + 571;
			2: character_address <= V_counter + 587;
			3: character_address <= V_counter + 603;
			4: character_address <= V_counter + 619;
			5: character_address <= V_counter + 635;
			6: character_address <= V_counter + 651;
			7: character_address <= V_counter + 667;
			8: character_address <= V_counter + 683;
			9: character_address <= V_counter + 699;
			endcase
			if (H_counter > 562 && H_counter < 572 && V_counter > 212 && V_counter < 230)
				begin
				if(Character_Out[10-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		//Onethousandth digit
		else if (H_counter > 570 && H_counter < 580 && V_counter > 210 && V_counter < 229)
			begin
			case(Fiftenth_Harmonic[3:0])
			0: character_address <= V_counter + 555;
			1: character_address <= V_counter + 571;
			2: character_address <= V_counter + 587;
			3: character_address <= V_counter + 603;
			4: character_address <= V_counter + 619;
			5: character_address <= V_counter + 635;
			6: character_address <= V_counter + 651;
			7: character_address <= V_counter + 667;
			8: character_address <= V_counter + 683;
			9: character_address <= V_counter + 699;
			endcase
			if (H_counter > 572 && H_counter < 582 && V_counter > 212 && V_counter < 230)
				begin
				if(Character_Out[20-H_counter[4:1]] == 1)
					begin
					RedGUI <= 8'h7F;
					GreenGUI <= 8'h7F;
					BlueGUI <= 8'h7F;
					end
				else
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			else
				begin
				RedGUI <= 8'h34;
				GreenGUI <= 8'h21;
				BlueGUI <= 8'h33;
				end
			end
		else
			begin
			RedGUI <= 8'h34;
			GreenGUI <= 8'h21;
			BlueGUI <= 8'h33;
			end
		end
//======================================
//Draw right hand box
	else if (H_counter > 469 && H_counter < 640 && V_counter > 5 && V_counter < 466)
		begin
		RedGUI <= 8'h7F;
		GreenGUI <= 8'h7F;
		BlueGUI <= 8'h7F;
		if (H_counter > 471 && H_counter < 638 && V_counter > 7 && V_counter < 464)
			begin
			RedGUI <= 8'h27;
			GreenGUI <= 8'h10;
			BlueGUI <= 8'h26;
			if (H_counter > 473 && H_counter < 636 && V_counter > 9 && V_counter < 462)
				begin
				RedGUI <= 8'h2E;
				GreenGUI <= 8'h19;
				BlueGUI <= 8'h2D;
				if (H_counter > 475 && H_counter < 634 && V_counter > 11 && V_counter < 460)
					begin
					RedGUI <= 8'h34;
					GreenGUI <= 8'h21;
					BlueGUI <= 8'h33;
					end
				end
			end
		end
//======================================
//Drawing two horizontal lines 
	else if ((V_counter > 5 && V_counter < 8) /*|| (V_counter > 464 && V_counter < 467)*/)
		begin
		if (H_counter > 47 && H_counter < 640)
			begin
			RedGUI <= 8'h7F;
			GreenGUI <= 8'h7F;
			BlueGUI <= 8'h7F;
			end
		else
			begin
			RedGUI <= 8'h00;
			GreenGUI <= 8'h00;
			BlueGUI <= 8'h00;
			end
		end
//======================================
//Drawing chosen page widget 
	else if (H_counter > 49 && H_counter < 53)
		begin
		case(Page_counter)
		0:
		//======================================
		//Draw page zero widget
			begin
			if (V_counter > 22 && V_counter < 104)
				begin
				RedGUI <= 8'hEF;
				GreenGUI <= 8'hE4;
				BlueGUI <= 8'hB0;
				end
			else
				begin
				RedGUI <= 8'h00;
				GreenGUI <= 8'h00;
				BlueGUI <= 8'h00;
				end
			end
		//======================================
		1:
		//======================================
		//Draw page one widget
			begin
			if (V_counter > 138 && V_counter < 220)
				begin
				RedGUI <= 8'hEF;
				GreenGUI <= 8'hE4;
				BlueGUI <= 8'hB0;
				end
			else
				begin
				RedGUI <= 8'h00;
				GreenGUI <= 8'h00;
				BlueGUI <= 8'h00;
				end
			end
		//======================================
		2:
		//======================================
		//Draw page one widget
			begin
			if (!SW12)
				begin
				if (V_counter > 250 && V_counter < 286)
					begin
					RedGUI <= 8'hEF;
					GreenGUI <= 8'hE4;
					BlueGUI <= 8'hB0;
					end
				else
					begin
					RedGUI <= 8'h00;
					GreenGUI <= 8'h00;
					BlueGUI <= 8'h00;
					end
				end
			else if (SW12)
				begin
				if (V_counter > 295 && V_counter < 330)
					begin
					RedGUI <= 8'hEF;
					GreenGUI <= 8'hE4;
					BlueGUI <= 8'hB0;
					end
				else
					begin
					RedGUI <= 8'h00;
					GreenGUI <= 8'h00;
					BlueGUI <= 8'h00;
					end
				end
			end
		//======================================
		3:
		//======================================
		//Draw page one widget
			begin
			if (V_counter > 370 && V_counter < 452)
				begin
				RedGUI <= 8'hEF;
				GreenGUI <= 8'hE4;
				BlueGUI <= 8'hB0;
				end
			else
				begin
				RedGUI <= 8'h00;
				GreenGUI <= 8'h00;
				BlueGUI <= 8'h00;
				end
			end
		//======================================
		endcase
		end
//======================================
	else
		begin
		RedGUI <= 8'h00;
		GreenGUI <= 8'h00;
		BlueGUI <= 8'h00;		
		end
	end
endmodule 