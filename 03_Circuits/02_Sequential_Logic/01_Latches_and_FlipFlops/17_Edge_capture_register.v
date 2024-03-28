module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
    );

    reg  [31:0]  capture_flag;
    reg  [31:0]  in_dly;

    always@(posedge clk)begin
	in_dly <= in;
    end

    always@(posedge clk)begin
	if(reset)
	    capture_flag <= 32'd0;
        else begin
	    capture_flag <= (in_dly & ~in) | capture_flag; 
	end
    end

    assign out = capture_flag;

endmodule
