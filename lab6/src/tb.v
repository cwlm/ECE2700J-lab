`include "connect.v"

module tb_main;

reg clk, reset;
wire [3:0] row;
wire [3:0] col;
wire [6:0] C;

main main(
         .clk(clk),
         .reset(reset),
         .row(row),
         .col(col),
         .C(C)
     );

initial begin
    clk = 0;
    forever
        #5 clk = ~clk;
end

reg [3:0] i;
reg [3:0] whichcon;
connect connect(
            .a(col),
            .whichcon(i),
            .b(row)
        );

initial begin
    reset = 0;
    whichcon = 4'b0000;


    for (i = 0; i < 7; i = i + 1) begin
        whichcon = i;
        #10;
    end

    reset= 1;
    #70;
    reset = 0;

    #100;

    for (i = 7; i < 16; i = i + 1) begin
        whichcon = i;
        #10;
    end

    $finish;
end
endmodule
