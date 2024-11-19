module divider10kHz(
           input clk,
           input reset,
           output reg nclk
       );
reg [13:0] number;

initial begin
    number = 1;
    nclk = 0;
end


always @(posedge clk or posedge reset) begin
    if(reset) begin
        number <= 1;
        nclk <= 0;
    end
    else if (number == 10000) begin
        number <= 1;
        nclk <= ~ nclk;
    end
    else begin
        number <= number + 1;
        nclk <= 0;
    end
end

endmodule
