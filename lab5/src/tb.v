`include "main.v"
`include "ssd_decoder.v"
`timescale 1ps/1ps

module tb;

reg clk;
reg rst;
wire a1, a2, a3, a4;
wire [6:0] c;
wire [3:0] c_decoded;

main main(
         .clk(clk),
         .rst(rst),
         .a1(a1),
         .a2(a2),
         .a3(a3),
         .a4(a4),
         .c(c)
     );

ssd_decoder decoder(
                .C(c),
                .B(c_decoded)
            );

always #1 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
    #2000000 $finish;
end

endmodule
