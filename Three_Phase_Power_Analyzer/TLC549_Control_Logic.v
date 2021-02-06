module TLC549_Control_Logic (clk_in,reset,ADC_clk,CS,data_in,ADC_value,write_enable);
	input clk_in,data_in,reset,write_enable;
	output ADC_clk,CS;
	output reg [7:0] ADC_value;
wire [8:1] out_wire;
reg CS,ADC_clk;
reg [11:0]counter;
always @ (posedge clk_in)
	begin
//		if (write_enable)
//		begin
		counter <= counter + 1;
			if (counter < 834) CS <= 1;
			else 
				begin
				CS = 0;
				if (counter >= 917 && counter < 959) ADC_clk <= 1;
				else if (counter >= 1000 && counter < 1042) ADC_clk <= 1;
				else if (counter >= 1084 && counter < 1125) ADC_clk <= 1;
				else if (counter >= 1167 && counter < 1209) ADC_clk <= 1;
				else if (counter >= 1250 && counter < 1292) ADC_clk <= 1;
				else if (counter >= 1334 && counter < 1375) ADC_clk <= 1;
				else if (counter >= 1417 && counter < 1459) ADC_clk <= 1;
				else if (counter >= 1500 && counter < 1542) ADC_clk <= 1;
				else ADC_clk <= 0;
				if (counter == 1667) counter <= 0;
				else CS <= CS;
				end
//		end
	end
Shift_Register shift_reg (ADC_clk,reset,data_in,data_out,out_wire);
	always @ (posedge CS)
		begin
		ADC_value <= out_wire[8] * 128 + out_wire[7] * 64 + out_wire[6] * 32 + out_wire[5] * 16 + out_wire[4] * 8 + out_wire[3] * 4 + out_wire[2] * 2 + out_wire[1];
		end
endmodule 