module top_module(
    input                clk,
    input                load,
    input        [255:0] data,
    output  reg  [255:0] q 
); 
    wire [17:0] q_2d [17:0];
    wire [3:0]  count [16:1][16:1];

    int i,j;

    //采用二维向量储存数据，并扩展为18*18
    always@(*)begin
	q_2d[0][17:0]  = {q[240],q[255:240],q[255]};
	q_2d[17][17:0] = {q[0],  q[15:0],   q[15] };
	for(i = 1 ; i < 17; i = i + 1)begin
	    q_2d[i][17:0] = {q[16*(i-1)],q[(16*i-1)-:16],q[16*i-1]};
	end
    end

    //统计16*16中每个元素周围1的个数
    always@(*)begin
	for(i = 1; i < 17; i = i + 1)begin
	    for(j = 1; j < 17; j = j + 1)begin
                count[i][j] = q_2d[i-1][j-1]+q_2d[i-1][j]+q_2d[i-1][j+1]+q_2d[i][j-1]+q_2d[i][j+1]+q_2d[i+1][j-1]+q_2d[i+1][j]+q_2d[i+1][j+1];
	    end
	end
    end
    
    //根据规则变化
    always@(posedge clk)begin
	if(load)
	    q <= data;
        else begin
	    for(i = 1; i < 17; i = i + 1)begin
		for(j = 1; j < 17; j = j + 1)begin
		    if(count[i][j] == 4'd2)
	                q[16*(i-1)+(j-1)] <= q[16*(i-1)+(j-1)];
		    else if(count[i][j] == 4'd3)
			q[16*(i-1)+(j-1)] <= 1'b1;
		    else
			q[16*(i-1)+(j-1)] <= 1'b0;
		end
	    end
	end
    end

endmodule
