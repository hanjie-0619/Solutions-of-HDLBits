module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum);

    generate
	genvar i;
	for(i = 0; i < $bits(sum); i = i + 1)begin:add_gen
		full_adder1 my_adder(
			.a(a[i]),
			.b(b[i]),
			.cin(i == 0 ? cin : cout[i - 1]),
			.cout(cout[i]),
			.sum(sum[i])
		);
	end
    endgenerate

endmodule

module full_adder1(
    input a,
    input b,
    input cin,
    output cout,
    output sum
);
    //Full adder module is designed here.
    assign sum = a + b + cin;
    assign cout = (a & b) | (a & cin) | (b & cin);

endmodule
