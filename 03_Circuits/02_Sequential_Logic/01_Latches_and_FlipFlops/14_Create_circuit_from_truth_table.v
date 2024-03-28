module top_module (
    input clk,
    input j,
    input k,
    output Q
    );

    reg Q_r;

    always@(posedge clk)begin
	if(~j & ~k)
	    Q_r <= Q_r;
        else if(~j & k)
	    Q_r <= 1'b0;
        else if(j & ~k)
	    Q_r <= 1'b1;
        else 
	    Q_r <= ~Q_r;
    end

    assign Q = Q_r;

endmodule
