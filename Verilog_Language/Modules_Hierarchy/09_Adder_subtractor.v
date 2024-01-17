module top_module(
	input [31:0] a,
	input [31:0] b,
	input sub,
	output [31:0] sum
);
	wire [31:0] b_select;
	assign b_select = b ^ {32{sub}};

	wire lower_cout;

	add16 lower(a[15:0],b_select[15:0],sub,sum[15:0],lower_cout);
	add16 upper(a[31:16],b_select[31:16],lower_cout,sum[31:16]);

endmodule
