module Shift_Register (clk,reset,data_in,data_out,out_wire);
	input clk,reset,data_in;
	output data_out;
	output [8:1]out_wire;
	wire [8:0]connect_wire;
	assign connect_wire[0] = data_in;
	assign data_out = connect_wire[8];
	genvar i;
	generate
		for(i=1;i<=8;i=i+1) 
			begin : Shift_Reg
			D_flipflop dff(clk,reset,connect_wire[i-1],connect_wire[i]);
			assign out_wire[i] = connect_wire[i];
			end
	endgenerate
endmodule	