module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum 
    );
    
    reg[2:0] mid;

    generate
        genvar i;
	for(i = 0;i < 4;i = i + 1)begin:BCD_adder_4_digit
             bcd_fadd my_bcd_fadd(
                 .a    (a[4*i+3:4*i]),
		 .b    (b[4*i+3:4*i]),
		 .cin  (i==0?cin:mid[i-1]),
		 .cout (i==3?cout:mid[i]),
		 .sum  (sum[4*i+3:4*i])
	     );
	end

    endgenerate

endmodule
