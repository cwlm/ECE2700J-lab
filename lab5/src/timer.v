module timer(
           input clk,
           input reset,
           output reg [3:0] o1, o0 // o1 is the most significant digit, o0 is the least significant digit
       );

initial begin
    o1 <= 4'b0000;
    o0 <= 4'b0000;
end

always @(posedge clk or posedge reset) begin
    if(reset) begin
        o1 <= 4'b0000;
        o0 <= 4'b0000;
    end
    else if (o1 == 5 && o0 == 9) begin
        o1 <= 4'b0000;
        o0 <= 4'b0000;
    end
    else if (o0 == 9 ) begin
        o0 <= 4'b0000;
        o1 <= o1 + 1;
    end
    else
        o0 <= o0 + 1;
end

endmodule
