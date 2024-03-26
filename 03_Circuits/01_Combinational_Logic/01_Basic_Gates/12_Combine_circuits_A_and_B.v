module top_module (
    input   x, 
    input   y, 
    output  z
    );

    wire out1,out2,out3,out4;

    q4a IA1(x,y,out1);
    q4b IB1(x,y,out2);
    q4a IA2(x,y,out3);
    q4b IB2(x,y,out4);

    assign z = (out1 | out2) ^ (out3 & out4);

endmodule

module q4a (
    input   x, 
    input   y, 
    output  z
    );

    assign z = (x ^ y) & x;

endmodule

module q4b ( 
    input   x, 
    input   y, 
    output  z 
    );

    assign z = x ~^ y;

endmodule
