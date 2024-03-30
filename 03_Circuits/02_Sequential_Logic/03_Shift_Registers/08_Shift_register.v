module top_module (
    input   [3:0]  SW,
    input   [3:0]  KEY,
    output  [3:0]  LEDR
); //

    genvar i;
    generate
	for(i = 0; i < 4; i = i + 1)begin:MUXDFF_4
	    MUXDFF MYMUXDFF(
                .clk   (KEY[0]),
	        .E     (KEY[1]),
		.L     (KEY[2]),
		.R     (SW[i]),
		.w     (i == 3 ? KEY[3] : LEDR[i+1]),
		.Q     (LEDR[i])
	    );
	end
    endgenerate

endmodule

module MUXDFF (
    input       clk,
    input       E,
    input       L,
    input       R,
    input       w,
    output reg  Q
);

    always@(posedge clk)begin
	Q <= L ? R : (E ? w : Q);
    end

endmodule
