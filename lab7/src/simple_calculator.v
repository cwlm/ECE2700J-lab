module simple_calculator(
    input wire [3:0] addend,
    input wire clk, rst, enb,
    output wire [3:0] sum,
    output wire overflow
);

reg [4:0] real_sum;

always @(posedge clk) begin
    if (rst) begin
        real_sum <= 5'b0;
    end
    else begin
        if (enb) begin
            real_sum <= sum + addend;
        end
    end
end

assign sum = real_sum[3:0];
assign overflow = real_sum[4];
    
endmodule