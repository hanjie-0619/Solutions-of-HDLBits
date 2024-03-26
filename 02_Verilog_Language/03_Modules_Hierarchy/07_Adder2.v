module top_module(
	input [31:0] a,
	input [31:0] b,
	output [31:0] sum
);
	wire [15:0] lower_cout;
	add16 lower(a[15:0],b[15:0],0,sum[15:0],lower_cout);
	add16 upper(a[31:16],b[31:16],lower_cout,sum[31:16]);

endmodule

module add1(
	input a,
	input b,
	input cin,
	output sum,
	output cout
);
	assign {cout,sum} = a + b + cin;

endmodule
