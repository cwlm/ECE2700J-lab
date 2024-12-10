module simple_calculator(
           input wire [3:0] addend,
           input wire clk, rst, enb,
           output reg [3:0] sum,
           output reg overflow
       );

reg [3:0] augend;

always @(posedge clk) begin
    if (rst) begin
        sum <= 4'b0;
        overflow <= 1'b0;
    end
    else begin
        if (enb) begin
            augend = sum;
            sum = augend + addend;
            overflow = (augend[3] == addend[3] && sum[3] != augend[3]);
        end
    end
end

endmodule
