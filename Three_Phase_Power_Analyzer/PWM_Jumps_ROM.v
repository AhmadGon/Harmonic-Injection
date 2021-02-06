module PWM_Jumps_ROM(
	input VGA_CLK,
	input [5:0] address,
	output reg [63:0] data
);
always @(posedge VGA_CLK)
	begin
	case(address)
	//Simulate
	00: data <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
	01: data <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
	02: data <= 64'b0111110000110000000000000000000000111000000000000100000000000000;
	03: data <= 64'b1100011000110000000000000000000000011000000000001100000000000000;
	04: data <= 64'b1100011000000000000000000000000000011000000000001100000000000000;
	05: data <= 64'b0110000001110001110011000110011000011000111100111111000111110000;
	06: data <= 64'b0011100000110001111111100110011000011000000110001100001100011000;
	07: data <= 64'b0000110000110001101101100110011000011000111110001100001111111000;
	08: data <= 64'b0000011000110001101101100110011000011001100110001100001100000000;
	09: data <= 64'b1100011000110001101101100110011000011001100110001100001100000000;
	10: data <= 64'b1100011000110001101101100110011000011001100110001101101100011000;
	11: data <= 64'b0111110001111001101101100011101100111100111011000111000111110000;
	12: data <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
	13: data <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
	14: data <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
	15: data <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
	//Jumps
	16: data <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
	17: data <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
	18: data <= 64'b0001111000000000000000000000000000000000000000000000000000000000;
	19: data <= 64'b0000110000000000000000000000000000000000000000000000000000000000;
	20: data <= 64'b0000110000000000000000000000000000000000000000000000000000000000;
	21: data <= 64'b0000110011001100011100110011011100011111000000000000000000000000;
	22: data <= 64'b0000110011001100011111111001100110110001100000000000000000000000;
	23: data <= 64'b0000110011001100011011011001100110011000000000000000000000000000;
	24: data <= 64'b1100110011001100011011011001100110001110000000000000000000000000;
	25: data <= 64'b1100110011001100011011011001100110000011000000000000000000000000;
	26: data <= 64'b1100110011001100011011011001100110110001100000000000000000000000;
	27: data <= 64'b0111100001110110011011011001111100011111000000000000000000000000;
	28: data <= 64'b0000000000000000000000000001100000000000000000000000000000000000;
	29: data <= 64'b0000000000000000000000000001100000000000000000000000000000000000;
	30: data <= 64'b0000000000000000000000000011110000000000000000000000000000000000;
	31: data <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
	default: data <= 64'b0;
	endcase
	end
endmodule 
/*
J
4a0	:	0000000000000000000000000000000000000000000000000000000000000000;
4a1	:	0000000000000000000000000000000000000000000000000000000000000000;
4a2	:	0001111000000000000000000000000000000000000000000000000000000000;
4a3	:	0000110000000000000000000000000000000000000000000000000000000000;
4a4	:	0000110000000000000000000000000000000000000000000000000000000000;
4a5	:	0000110011001100011100110011011100011111000000000000000000000000;
4a6	:	0000110011001100011111111001100110110001100000000000000000000000;
4a7	:	0000110011001100011011011001100110011000000000000000000000000000;
4a8	:	1100110011001100011011011001100110001110000000000000000000000000;
4a9	:	1100110011001100011011011001100110000011000000000000000000000000;
4aa	:	1100110011001100011011011001100110110001100000000000000000000000;
4ab	:	0111100001110110011011011001111100011111000000000000000000000000;
4ac	:	0000000000000000000000000001100000000000000000000000000000000000;
4ad	:	0000000000000000000000000001100000000000000000000000000000000000;
4ae	:	0000000000000000000000000011110000000000000000000000000000000000;
4af	:	0000000000000000000000000000000000000000000000000000000000000000;
S
530	:	0000000000000000000000000000000000000000000000000000000000000000;
531	:	0000000000000000000000000000000000000000000000000000000000000000;
532	:	0111110000110000000000000000000000111000000000000001000000000000;
533	:	1100011000110000000000000000000000011000000000000011000000000000;
534	:	1100011000000000000000000000000000011000000000000011000000000000;
535	:	0110000001110001110011000110011000011000011110001111110001111100;
536	:	0011100000110001111111100110011000011000000011000011000011000110;
537	:	0000110000110001101101100110011000011000011111000011000011111110;
538	:	0000011000110001101101100110011000011000110011000011000011000000;
539	:	1100011000110001101101100110011000011000110011000011000011000000;
53a	:	1100011000110001101101100110011000011000110011000011011011000110;
53b	:	0111110001111001101101100011101100111100011101100001110001111100;
53c	:	0000000000000000000000000000000000000000000000000000000000000000;
53d	:	0000000000000000000000000000000000000000000000000000000000000000;
53e	:	0000000000000000000000000000000000000000000000000000000000000000;
53f	:	0000000000000000000000000000000000000000000000000000000000000000;
tick
000	:	00000000;
001	:	00000000;
002	:	00000000;
003	:	00000000;
004	:	00000001;
005	:	00000001;
006	:	00000011;
007	:	00000011;
008	:	10000110;
009	:	11000110;
00a	:	11001100;
00b	:	01101100;
00c	:	00111000;
00d	:	00010000;
00e	:	00000000;
00f	:	00000000;
*/