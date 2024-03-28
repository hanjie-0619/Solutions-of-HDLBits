module top_module (
    input clk,
    input w, R, E, L,
    output Q
    );

    reg Q_r;

    always@(posedge clk)begin
        Q_r <= L == 1'b1 ? R : (E == 1'b1 ? w : Q_r);
    end

    assign Q = Q_r;

endmodule
