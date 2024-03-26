module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    reg [98:0] mid;

    generate
	    genvar i;
	    for(i = 0;i < 100;i = i + 1)begin:BCD_adder100
		    bcd_fadd my_bdc_adder(
			.a(a[(i + 1) * 4 - 1 : i * 4]),
			.b(b[(i + 1) * 4 - 1 : i * 4]),
			.cin(i ==0 ? cin : mid[i - 1]),
			.cout(i == 99 ? cout : mid[i]),
			.sum(sum[(i + 1) * 4 - 1 : i * 4])
		    );
	    end

    endgenerate

endmodule
