module D_flipflop(clk,reset,d,q);
	input clk,reset,d;
	output q;
	reg q;
	always @ (posedge clk)
		begin
			if(!reset) q <= 0;
			else q = d;
		end
endmodule 