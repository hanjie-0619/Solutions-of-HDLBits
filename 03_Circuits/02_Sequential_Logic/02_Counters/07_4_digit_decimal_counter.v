module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output reg [15:0] q
    );

    always@(posedge clk)begin
	if(reset)
	    q <= 16'h0000;
        else begin
	    q[3:0]   <= ena[1] ? 4'd0 : q[3:0] + 4'd1;
	    q[7:4]   <= ena[2] ? 4'd0 : (ena[1] ? q[7:4] + 4'd1 : q[7:4]);
	    q[11:8]  <= ena[3] ? 4'd0 : (ena[2] ? q[11:8] + 4'd1 : q[11:8]);
	    q[15:12] <= (ena == 3'b111 && q[15:12] == 4'd9) ? 4'd0 : (ena[3] ? q[15:12] + 1'b1 : q[15:12]); 
	end
    end
    
    assign ena[3] = q[11:0] == 12'h999;
    assign ena[2] = q[7:0]  == 8'h99  ;
    assign ena[1] = q[3:0]  == 4'h9   ;

endmodule
