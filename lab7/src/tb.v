`include "main.v"

module testbench;

reg clk, button, reset, P, M;
reg [3:0] addend;
wire [6:0] C3, C2, C1, C0; // SSD outputss
wire overflow_led; // overflow LED

main main1(
    .clk(clk),
    .btn(button),
    .rst(reset),
    .P(P),
    .M(M),
    .addend(addend),
    .C3(C3),
    .C2(C2),
    .C1(C1),
    .C0(C0),
    .overflow_led(overflow_led)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    button = 0;
    reset = 0;
    P = 0;
    M = 0;
    addend = 4'b0000;

    #100 P = 1;
    #100 P = 0;
    #100 P = 1;

    //display mode end, calculator mode start
    #100 M = 1;

    #10 addend = 4'b1000;
    #10 button = 1;
    #10 button = 0;

    #100 addend = 4'b0011;
    #10 button = 1;
    #10 button = 0;

    #100;
    #10 button = 1;
    #10 button = 0;

    #100;
    #10 button = 1;
    #10 button = 0;

    #100;
    #10 button = 1;
    #10 button = 0;

    #100 reset = 1;
    #100 reset = 0;

    #100;
    #10 button = 1;
    #10 button = 0;

    #100;
    #10 button = 1;
    #10 button = 0;
end

endmodule