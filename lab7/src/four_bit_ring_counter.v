module four_bit_ring_counter(
           input clk,
           input rst,
           output reg [3:0] q
       );

always @(posedge clk or posedge rst) begin
    if(rst)
        q <= 4'b0111;
    else
        q <= {q[2:0], q[3]};
end

endmodule
