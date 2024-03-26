module top_module(
	input [31:0] a,
	input [31:0] b,
	output [31:0] sum
);
	wire lower_cout;
	wire [15:0] upper_0_sum,upper_1_sum;

	add16 lower(a[15:0],b[15:0],0,sum[15:0],lower_cout);
	add16 upper_0(a[31:16],b[31:16],0,upper_0_sum);
	add16 upper_1(a[31:16],b[31:16],1,upper_1_sum);

	always @(*) begin
		if(lower_cout)	
			sum[31:16] <= upper_1_sum;
		else
			sum[31:16] <= upper_0_sum;
	end

endmodule
