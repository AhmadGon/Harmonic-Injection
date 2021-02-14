module Debouncer(
	input clk,
	/** User inputs */
	input SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9, SW10, SW12, SW13, SW14, SW15, SW16, reset,
	input Push_0, Push_1, Push_2, Push_3,
	/** Debounced outputs */
	output DeSW0, DeSW1, DeSW2, DeSW3, DeSW4, DeSW5, DeSW6, DeSW7, DeSW8, DeSW9, DeSW10, DeSW12, DeSW13, DeSW14, DeSW15, DeSW16, DeReset,
	output DePush_0, DePush_1, DePush_2, DePush_3
);
/** Debounce counters */
reg[14:0] Push_0_Debounce_Counter;
reg[14:0] Push_1_Debounce_Counter;
reg[14:0] Push_2_Debounce_Counter;
reg[14:0] Push_3_Debounce_Counter;
reg[14:0] SW0_Debounce_Counter;
reg[14:0] SW1_Debounce_Counter;
reg[14:0] SW2_Debounce_Counter;
reg[14:0] SW3_Debounce_Counter;
reg[14:0] SW4_Debounce_Counter;
reg[14:0] SW5_Debounce_Counter;
reg[14:0] SW6_Debounce_Counter;
reg[14:0] SW7_Debounce_Counter;
reg[14:0] SW8_Debounce_Counter;
reg[14:0] SW9_Debounce_Counter;
reg[14:0] SW10_Debounce_Counter;
reg[14:0] SW12_Debounce_Counter;
reg[14:0] SW13_Debounce_Counter;
reg[14:0] SW14_Debounce_Counter;
reg[14:0] SW15_Debounce_Counter;
reg[14:0] SW16_Debounce_Counter;
reg[14:0] Reset_Debounce_Counter;

/** Debounce state registers */
reg[1:0] Push_0_State_Register;
reg[1:0] Push_1_State_Register;
reg[1:0] Push_2_State_Register;
reg[1:0] Push_3_State_Register;
reg[1:0] SW0_State_Register;
reg[1:0] SW1_State_Register;
reg[1:0] SW2_State_Register;
reg[1:0] SW3_State_Register;
reg[1:0] SW4_State_Register;
reg[1:0] SW5_State_Register;
reg[1:0] SW6_State_Register;
reg[1:0] SW7_State_Register;
reg[1:0] SW8_State_Register;
reg[1:0] SW9_State_Register;
reg[1:0] SW10_State_Register;
reg[1:0] SW12_State_Register;
reg[1:0] SW13_State_Register;
reg[1:0] SW14_State_Register;
reg[1:0] SW15_State_Register;
reg[1:0] SW16_State_Register;
reg[1:0] Reset_State_Register;

/** Intermediate registers */
reg Push_0_Debounce_Counter_Ignition, Push_0_State_Address, Push_0_Activated;
reg Push_1_Debounce_Counter_Ignition, Push_1_State_Address, Push_1_Activated;
reg Push_2_Debounce_Counter_Ignition, Push_2_State_Address, Push_2_Activated;
reg Push_3_Debounce_Counter_Ignition, Push_3_State_Address, Push_3_Activated;
reg SW0_Debounce_Counter_Ignition, SW0_State_Address, SW0_Activated;
reg SW1_Debounce_Counter_Ignition, SW1_State_Address, SW1_Activated;
reg SW2_Debounce_Counter_Ignition, SW2_State_Address, SW2_Activated;
reg SW3_Debounce_Counter_Ignition, SW3_State_Address, SW3_Activated;
reg SW4_Debounce_Counter_Ignition, SW4_State_Address, SW4_Activated;
reg SW5_Debounce_Counter_Ignition, SW5_State_Address, SW5_Activated;
reg SW6_Debounce_Counter_Ignition, SW6_State_Address, SW6_Activated;
reg SW7_Debounce_Counter_Ignition, SW7_State_Address, SW7_Activated;
reg SW8_Debounce_Counter_Ignition, SW8_State_Address, SW8_Activated;
reg SW9_Debounce_Counter_Ignition, SW9_State_Address, SW9_Activated;
reg SW10_Debounce_Counter_Ignition, SW10_State_Address, SW10_Activated;
reg SW12_Debounce_Counter_Ignition, SW12_State_Address, SW12_Activated;
reg SW13_Debounce_Counter_Ignition, SW13_State_Address, SW13_Activated;
reg SW14_Debounce_Counter_Ignition, SW14_State_Address, SW14_Activated;
reg SW15_Debounce_Counter_Ignition, SW15_State_Address, SW15_Activated;
reg SW16_Debounce_Counter_Ignition, SW16_State_Address, SW16_Activated;
reg Reset_Debounce_Counter_Ignition, Reset_State_Address, Reset_Activated;

assign DePush_0 = Push_0_Activated;
assign DePush_1 = Push_1_Activated;
assign DePush_2 = Push_2_Activated;
assign DePush_3 = Push_3_Activated;
assign DeSW0 = SW0_Activated;
assign DeSW1 = SW1_Activated;
assign DeSW2 = SW2_Activated;
assign DeSW3 = SW3_Activated;
assign DeSW4 = SW4_Activated;
assign DeSW5 = SW5_Activated;
assign DeSW6 = SW6_Activated;
assign DeSW7 = SW7_Activated;
assign DeSW8 = SW8_Activated;
assign DeSW9 = SW9_Activated;
assign DeSW10 = SW10_Activated;
assign DeSW12 = SW12_Activated;
assign DeSW13 = SW13_Activated;
assign DeSW14 = SW14_Activated;
assign DeSW15 = SW15_Activated;
assign DeSW16 = SW16_Activated;
assign DeReset = Reset_Activated;

//=======================================================
// Push_0
always @(posedge clk)
	begin
	if (!Push_0_Debounce_Counter_Ignition)
		begin
		Push_0_State_Register[Push_0_State_Address] <= Push_0;
		Push_0_State_Address <= Push_0_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (Push_0_State_Register[0] != Push_0_State_Register[1]) 
		begin
		Push_0_Debounce_Counter_Ignition <= 1;
		end
	if (Push_0_Debounce_Counter == 14999) Push_0_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (Push_0_Debounce_Counter_Ignition)
		begin
		Push_0_Debounce_Counter <= Push_0_Debounce_Counter + 1;
		if (Push_0_Debounce_Counter == 14999) 
			begin
			Push_0_Debounce_Counter <= 0;
			Push_0_Activated <= Push_0;
			end
		end
	else Push_0_Debounce_Counter <= 0;
	end
//=======================================================
// Push_1
always @(posedge clk)
	begin
	if (!Push_1_Debounce_Counter_Ignition)
		begin
		Push_1_State_Register[Push_1_State_Address] <= Push_1;
		Push_1_State_Address <= Push_1_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (Push_1_State_Register[0] != Push_1_State_Register[1]) 
		begin
		Push_1_Debounce_Counter_Ignition <= 1;
		end
	if (Push_1_Debounce_Counter == 14999) Push_1_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (Push_1_Debounce_Counter_Ignition)
		begin
		Push_1_Debounce_Counter <= Push_1_Debounce_Counter + 1;
		if (Push_1_Debounce_Counter == 14999) 
			begin
			Push_1_Debounce_Counter <= 0;
			Push_1_Activated <= Push_1;
			end
		end
	else Push_1_Debounce_Counter <= 0;
	end
//=======================================================
// Push_2
always @(posedge clk)
	begin
	if (!Push_2_Debounce_Counter_Ignition)
		begin
		Push_2_State_Register[Push_2_State_Address] <= Push_2;
		Push_2_State_Address <= Push_2_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (Push_2_State_Register[0] != Push_2_State_Register[1]) 
		begin
		Push_2_Debounce_Counter_Ignition <= 1;
		end
	if (Push_2_Debounce_Counter == 14999) Push_2_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (Push_2_Debounce_Counter_Ignition)
		begin
		Push_2_Debounce_Counter <= Push_2_Debounce_Counter + 1;
		if (Push_2_Debounce_Counter == 14999) 
			begin
			Push_2_Debounce_Counter <= 0;
			Push_2_Activated <= Push_2;
			end
		end
	else Push_2_Debounce_Counter <= 0;
	end
//=======================================================
// Push_3
always @(posedge clk)
	begin
	if (!Push_3_Debounce_Counter_Ignition)
		begin
		Push_3_State_Register[Push_3_State_Address] <= Push_3;
		Push_3_State_Address <= Push_3_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (Push_3_State_Register[0] != Push_3_State_Register[1]) 
		begin
		Push_3_Debounce_Counter_Ignition <= 1;
		end
	if (Push_3_Debounce_Counter == 14999) Push_3_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (Push_3_Debounce_Counter_Ignition)
		begin
		Push_3_Debounce_Counter <= Push_3_Debounce_Counter + 1;
		if (Push_3_Debounce_Counter == 14999) 
			begin
			Push_3_Debounce_Counter <= 0;
			Push_3_Activated <= Push_3;
			end
		end
	else Push_3_Debounce_Counter <= 0;
	end
//=======================================================
// SW0
always @(posedge clk)
	begin
	if (!SW0_Debounce_Counter_Ignition)
		begin
		SW0_State_Register[SW0_State_Address] <= SW0;
		SW0_State_Address <= SW0_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW0_State_Register[0] != SW0_State_Register[1]) 
		begin
		SW0_Debounce_Counter_Ignition <= 1;
		end
	if (SW0_Debounce_Counter == 14999) SW0_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW0_Debounce_Counter_Ignition)
		begin
		SW0_Debounce_Counter <= SW0_Debounce_Counter + 1;
		if (SW0_Debounce_Counter == 14999) 
			begin
			SW0_Debounce_Counter <= 0;
			SW0_Activated <= SW0;
			end
		end
	else SW0_Debounce_Counter <= 0;
	end	
//=======================================================
// SW1
always @(posedge clk)
	begin
	if (!SW1_Debounce_Counter_Ignition)
		begin
		SW1_State_Register[SW1_State_Address] <= SW1;
		SW1_State_Address <= SW1_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW1_State_Register[0] != SW1_State_Register[1]) 
		begin
		SW1_Debounce_Counter_Ignition <= 1;
		end
	if (SW1_Debounce_Counter == 14999) SW1_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW1_Debounce_Counter_Ignition)
		begin
		SW1_Debounce_Counter <= SW1_Debounce_Counter + 1;
		if (SW1_Debounce_Counter == 14999) 
			begin
			SW1_Debounce_Counter <= 0;
			SW1_Activated <= SW1;
			end
		end
	else SW1_Debounce_Counter <= 0;
	end	
//=======================================================
// SW2
always @(posedge clk)
	begin
	if (!SW2_Debounce_Counter_Ignition)
		begin
		SW2_State_Register[SW2_State_Address] <= SW2;
		SW2_State_Address <= SW2_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW2_State_Register[0] != SW2_State_Register[1]) 
		begin
		SW2_Debounce_Counter_Ignition <= 1;
		end
	if (SW2_Debounce_Counter == 14999) SW2_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW2_Debounce_Counter_Ignition)
		begin
		SW2_Debounce_Counter <= SW2_Debounce_Counter + 1;
		if (SW2_Debounce_Counter == 14999) 
			begin
			SW2_Debounce_Counter <= 0;
			SW2_Activated <= SW2;
			end
		end
	else SW2_Debounce_Counter <= 0;
	end	
//=======================================================
// SW3
always @(posedge clk)
	begin
	if (!SW3_Debounce_Counter_Ignition)
		begin
		SW3_State_Register[SW3_State_Address] <= SW3;
		SW3_State_Address <= SW3_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW3_State_Register[0] != SW3_State_Register[1]) 
		begin
		SW3_Debounce_Counter_Ignition <= 1;
		end
	if (SW3_Debounce_Counter == 14999) SW3_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW3_Debounce_Counter_Ignition)
		begin
		SW3_Debounce_Counter <= SW3_Debounce_Counter + 1;
		if (SW3_Debounce_Counter == 14999) 
			begin
			SW3_Debounce_Counter <= 0;
			SW3_Activated <= SW3;
			end
		end
	else SW3_Debounce_Counter <= 0;
	end
//=======================================================
// SW4
always @(posedge clk)
	begin
	if (!SW4_Debounce_Counter_Ignition)
		begin
		SW4_State_Register[SW4_State_Address] <= SW4;
		SW4_State_Address <= SW4_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW4_State_Register[0] != SW4_State_Register[1]) 
		begin
		SW4_Debounce_Counter_Ignition <= 1;
		end
	if (SW4_Debounce_Counter == 14999) SW4_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW4_Debounce_Counter_Ignition)
		begin
		SW4_Debounce_Counter <= SW4_Debounce_Counter + 1;
		if (SW4_Debounce_Counter == 14999) 
			begin
			SW4_Debounce_Counter <= 0;
			SW4_Activated <= SW4;
			end
		end
	else SW4_Debounce_Counter <= 0;
	end		
//=======================================================
// SW5
always @(posedge clk)
	begin
	if (!SW5_Debounce_Counter_Ignition)
		begin
		SW5_State_Register[SW5_State_Address] <= SW5;
		SW5_State_Address <= SW5_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW5_State_Register[0] != SW5_State_Register[1]) 
		begin
		SW5_Debounce_Counter_Ignition <= 1;
		end
	if (SW5_Debounce_Counter == 14999) SW5_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW5_Debounce_Counter_Ignition)
		begin
		SW5_Debounce_Counter <= SW5_Debounce_Counter + 1;
		if (SW5_Debounce_Counter == 14999) 
			begin
			SW5_Debounce_Counter <= 0;
			SW5_Activated <= SW5;
			end
		end
	else SW5_Debounce_Counter <= 0;
	end	
//=======================================================
// SW6
always @(posedge clk)
	begin
	if (!SW6_Debounce_Counter_Ignition)
		begin
		SW6_State_Register[SW6_State_Address] <= SW6;
		SW6_State_Address <= SW6_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW6_State_Register[0] != SW6_State_Register[1]) 
		begin
		SW6_Debounce_Counter_Ignition <= 1;
		end
	if (SW6_Debounce_Counter == 14999) SW6_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW6_Debounce_Counter_Ignition)
		begin
		SW6_Debounce_Counter <= SW6_Debounce_Counter + 1;
		if (SW6_Debounce_Counter == 14999) 
			begin
			SW6_Debounce_Counter <= 0;
			SW6_Activated <= SW6;
			end
		end
	else SW6_Debounce_Counter <= 0;
	end
//=======================================================
// SW7
always @(posedge clk)
	begin
	if (!SW7_Debounce_Counter_Ignition)
		begin
		SW7_State_Register[SW7_State_Address] <= SW7;
		SW7_State_Address <= SW7_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW7_State_Register[0] != SW7_State_Register[1]) 
		begin
		SW7_Debounce_Counter_Ignition <= 1;
		end
	if (SW7_Debounce_Counter == 14999) SW7_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW7_Debounce_Counter_Ignition)
		begin
		SW7_Debounce_Counter <= SW7_Debounce_Counter + 1;
		if (SW7_Debounce_Counter == 14999) 
			begin
			SW7_Debounce_Counter <= 0;
			SW7_Activated <= SW7;
			end
		end
	else SW7_Debounce_Counter <= 0;
	end
//=======================================================
// SW8
always @(posedge clk)
	begin
	if (!SW8_Debounce_Counter_Ignition)
		begin
		SW8_State_Register[SW8_State_Address] <= SW8;
		SW8_State_Address <= SW8_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW8_State_Register[0] != SW8_State_Register[1]) 
		begin
		SW8_Debounce_Counter_Ignition <= 1;
		end
	if (SW8_Debounce_Counter == 14999) SW8_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW8_Debounce_Counter_Ignition)
		begin
		SW8_Debounce_Counter <= SW8_Debounce_Counter + 1;
		if (SW8_Debounce_Counter == 14999) 
			begin
			SW8_Debounce_Counter <= 0;
			SW8_Activated <= SW8;
			end
		end
	else SW8_Debounce_Counter <= 0;
	end
//=======================================================
// SW9
always @(posedge clk)
	begin
	if (!SW9_Debounce_Counter_Ignition)
		begin
		SW9_State_Register[SW9_State_Address] <= SW9;
		SW9_State_Address <= SW9_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW9_State_Register[0] != SW9_State_Register[1]) 
		begin
		SW9_Debounce_Counter_Ignition <= 1;
		end
	if (SW9_Debounce_Counter == 14999) SW9_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW9_Debounce_Counter_Ignition)
		begin
		SW9_Debounce_Counter <= SW9_Debounce_Counter + 1;
		if (SW9_Debounce_Counter == 14999) 
			begin
			SW9_Debounce_Counter <= 0;
			SW9_Activated <= SW9;
			end
		end
	else SW9_Debounce_Counter <= 0;
	end
//=======================================================
// SW10
always @(posedge clk)
	begin
	if (!SW10_Debounce_Counter_Ignition)
		begin
		SW10_State_Register[SW10_State_Address] <= SW10;
		SW10_State_Address <= SW10_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW10_State_Register[0] != SW10_State_Register[1]) 
		begin
		SW10_Debounce_Counter_Ignition <= 1;
		end
	if (SW10_Debounce_Counter == 14999) SW10_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW10_Debounce_Counter_Ignition)
		begin
		SW10_Debounce_Counter <= SW10_Debounce_Counter + 1;
		if (SW10_Debounce_Counter == 14999) 
			begin
			SW10_Debounce_Counter <= 0;
			SW10_Activated <= SW10;
			end
		end
	else SW10_Debounce_Counter <= 0;
	end
//=======================================================
// SW12
always @(posedge clk)
	begin
	if (!SW12_Debounce_Counter_Ignition)
		begin
		SW12_State_Register[SW12_State_Address] <= SW12;
		SW12_State_Address <= SW12_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW12_State_Register[0] != SW12_State_Register[1]) 
		begin
		SW12_Debounce_Counter_Ignition <= 1;
		end
	if (SW12_Debounce_Counter == 14999) SW12_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW12_Debounce_Counter_Ignition)
		begin
		SW12_Debounce_Counter <= SW12_Debounce_Counter + 1;
		if (SW12_Debounce_Counter == 14999) 
			begin
			SW12_Debounce_Counter <= 0;
			SW12_Activated <= SW12;
			end
		end
	else SW12_Debounce_Counter <= 0;
	end
//=======================================================
// SW13
always @(posedge clk)
	begin
	if (!SW13_Debounce_Counter_Ignition)
		begin
		SW13_State_Register[SW13_State_Address] <= SW13;
		SW13_State_Address <= SW13_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW13_State_Register[0] != SW13_State_Register[1]) 
		begin
		SW13_Debounce_Counter_Ignition <= 1;
		end
	if (SW13_Debounce_Counter == 14999) SW13_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW13_Debounce_Counter_Ignition)
		begin
		SW13_Debounce_Counter <= SW13_Debounce_Counter + 1;
		if (SW13_Debounce_Counter == 14999) 
			begin
			SW13_Debounce_Counter <= 0;
			SW13_Activated <= SW13;
			end
		end
	else SW13_Debounce_Counter <= 0;
	end
//=======================================================
// SW14
always @(posedge clk)
	begin
	if (!SW14_Debounce_Counter_Ignition)
		begin
		SW14_State_Register[SW14_State_Address] <= SW14;
		SW14_State_Address <= SW14_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW14_State_Register[0] != SW14_State_Register[1]) 
		begin
		SW14_Debounce_Counter_Ignition <= 1;
		end
	if (SW14_Debounce_Counter == 14999) SW14_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW14_Debounce_Counter_Ignition)
		begin
		SW14_Debounce_Counter <= SW14_Debounce_Counter + 1;
		if (SW14_Debounce_Counter == 14999) 
			begin
			SW14_Debounce_Counter <= 0;
			SW14_Activated <= SW14;
			end
		end
	else SW14_Debounce_Counter <= 0;
	end
//=======================================================
// SW15
always @(posedge clk)
	begin
	if (!SW15_Debounce_Counter_Ignition)
		begin
		SW15_State_Register[SW15_State_Address] <= SW15;
		SW15_State_Address <= SW15_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW15_State_Register[0] != SW15_State_Register[1]) 
		begin
		SW15_Debounce_Counter_Ignition <= 1;
		end
	if (SW15_Debounce_Counter == 14999) SW15_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW15_Debounce_Counter_Ignition)
		begin
		SW15_Debounce_Counter <= SW15_Debounce_Counter + 1;
		if (SW15_Debounce_Counter == 14999) 
			begin
			SW15_Debounce_Counter <= 0;
			SW15_Activated <= SW15;
			end
		end
	else SW15_Debounce_Counter <= 0;
	end
//=======================================================
// SW16
always @(posedge clk)
	begin
	if (!SW16_Debounce_Counter_Ignition)
		begin
		SW16_State_Register[SW16_State_Address] <= SW16;
		SW16_State_Address <= SW16_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (SW16_State_Register[0] != SW16_State_Register[1]) 
		begin
		SW16_Debounce_Counter_Ignition <= 1;
		end
	if (SW16_Debounce_Counter == 14999) SW16_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (SW16_Debounce_Counter_Ignition)
		begin
		SW16_Debounce_Counter <= SW16_Debounce_Counter + 1;
		if (SW16_Debounce_Counter == 14999) 
			begin
			SW16_Debounce_Counter <= 0;
			SW16_Activated <= SW16;
			end
		end
	else SW16_Debounce_Counter <= 0;
	end
//=======================================================
// Reset
always @(posedge clk)
	begin
	if (!Reset_Debounce_Counter_Ignition)
		begin
		Reset_State_Register[Reset_State_Address] <= reset;
		Reset_State_Address <= Reset_State_Address + 1; 
		end
	end
always @(posedge clk)
	begin
	if (Reset_State_Register[0] != Reset_State_Register[1]) 
		begin
		Reset_Debounce_Counter_Ignition <= 1;
		end
	if (Reset_Debounce_Counter == 14999) Reset_Debounce_Counter_Ignition <= 0; 
	end
always @(posedge clk)
	begin
	if (Reset_Debounce_Counter_Ignition)
		begin
		Reset_Debounce_Counter <= Reset_Debounce_Counter + 1;
		if (Reset_Debounce_Counter == 14999) 
			begin
			Reset_Debounce_Counter <= 0;
			Reset_Activated <= reset;
			end
		end
	else Reset_Debounce_Counter <= 0;
	end
endmodule 