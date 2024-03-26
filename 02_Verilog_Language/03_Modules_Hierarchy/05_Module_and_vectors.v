module top_module(
	input clk,
	input [7:0] d,
	input [1:0] sel,
	output [7:0] q
);
	wire [7:0] D1_out,D2_out,D3_out;
	my_dff8 dff1(clk,d,D1_out);
	my_dff8 dff2(clk,D1_out,D2_out);
	my_dff8 dff3(clk,D2_out,D3_out);

	always@(*)begin
		case(sel)
			2'b00:q <= d;
			2'b01:q <= D1_out;
			2'b10:q <= D2_out;
			2'b11:q <= D3_out;
		endcase
	end

endmodule
