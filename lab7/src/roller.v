module roller(
           input wire P, clk_2Hz, rst,
           output reg [3:0] R3, R2, R1, R0       // 4 digits for the SSD
       );

reg [3:0] num1 [0:11];
reg [3:0] num2 [0:11];
reg [3:0] pos [0:3];          // Position for the number list

integer i;

initial begin
    num1[0] = 4'h5;
    num1[1] = 4'h2;
    num1[2] = 4'h3;
    num1[3] = 4'h3;
    num1[4] = 4'h7;
    num1[5] = 4'h0;
    num1[6] = 4'h9;
    num1[7] = 4'h1;
    num1[8] = 4'h0;
    num1[9] = 4'h2;
    num1[10] = 4'h1;
    num1[11] = 4'h7;

    num2[0] = 4'h5;
    num2[1] = 4'h2;
    num2[2] = 4'h3;
    num2[3] = 4'h3;
    num2[4] = 4'h7;
    num2[5] = 4'h0;
    num2[6] = 4'h9;
    num2[7] = 4'h1;
    num2[8] = 4'h0;
    num2[9] = 4'h2;
    num2[10] = 4'h1;
    num2[11] = 4'h8;

    pos[0] = 4'h0;
    pos[1] = 4'h1;
    pos[2] = 4'h2;
    pos[3] = 4'h3;
end

always @(posedge clk_2Hz) begin
    if (rst) begin
        pos[0] = 4'h0;
        pos[1] = 4'h1;
        pos[2] = 4'h2;
        pos[3] = 4'h3;
    end
    else for (i = 0; i <= 3; i = i + 1) begin
        pos[i] = pos[i] + 1;
        if (pos[i] == 12) begin
            pos[i] = 0; // mod 12
        end
    end
end

always @(*) begin
    if (P) begin
        R3 = num1[pos[0]];
        R2 = num1[pos[1]];
        R1 = num1[pos[2]];
        R0 = num1[pos[3]];
    end
    else begin
        R3 = num2[pos[0]];
        R2 = num2[pos[1]];
        R1 = num2[pos[2]];
        R0 = num2[pos[3]];
    end
end

endmodule
