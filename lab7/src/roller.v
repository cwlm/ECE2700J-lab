module roller(
    input  M,P,clk,
    output reg [3:0] R[3:0];// 4 digit in the ssd 
);


reg [3:0] num1 [0:11] = {4'h5, 4'h2, 4'h3, 4'h3, 4'h7, 4'h0, 4'h9, 4'h1, 4'h0, 4'h2, 4'h1, 4'h7};
reg [3:0] num2 [0:11] = {4'h5, 4'h2, 4'h3, 4'h3, 4'h7, 4'h0, 4'h9, 4'h1, 4'h0, 4'h2, 4'h1, 4'h8};

reg [3:0] pos[3:0]= {0,0,0,0}; // begining position the number list
reg i1[2:0] = 0;

always @(posedge clk) begin
    if(M) begin
        for (i1 = 0; i1 <= 3; i1 = i1 + 1) begin
            pos[i1] = pos[i1] + 1;
            if(pos[i1] == 12) begin
                pos[i1] = 0;
            end
        end   
    end   
end

always @(posedge clk) begin
    if(P) begin
        R[0] = num1[pos[0]];
        R[1] = num1[pos[1]];
        R[2] = num1[pos[2]];
        R[3] = num1[pos[3]];
    end
    else begin
        R[0] = num2[pos[0]];
        R[1] = num2[pos[1]];
        R[2] = num2[pos[2]];
        R[3] = num2[pos[3]];
    end   
end

endmodule