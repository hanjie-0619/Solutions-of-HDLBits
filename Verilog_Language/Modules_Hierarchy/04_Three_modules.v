module top_module(
	input clk,
	input d,
	output q 
);
	wire t1,t2;
	my_dff D_Flip_Flop1(clk,d,t1);
	my_dff D_Flip_Flop2(clk,t1,t2);
	my_dff D_Flip_Flop3(clk,t2,q);
		
endmodule
