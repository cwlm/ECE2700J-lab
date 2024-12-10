`include "simple_calculator.v"
`include "output_encoder.v"
`include "roller.v"
`include "button_sync.v"
`include "divider5Hz.v"
`include "divider500Hz.v"
`include "four_digit_shower.v"

module main (
           input wire clk, btn, rst, P, M,
           input wire [3:0] addend,
           output wire [6:0] C, // SSD outputs
           output wire AN3, AN2, AN1, AN0, // SSD anodes
           output wire overflow_led // overflow LED
       );

wire btn_sync, clk_5Hz, clk_500Hz;
wire overflow;
wire [3:0] R0, R1, R2, R3;
wire [6:0] C0, C1, C2, C3;
wire [3:0] sum;

divider5Hz divider5Hz1(.clk(clk), .reset(rst), .nclk(clk_5Hz));
divider500Hz divider500Hz1(.clk(clk), .reset(rst), .nclk(clk_500Hz));
button_sync button_sync1(.btn(btn), .clk(clk), .rst(rst), .btn_sync(btn_sync));
roller roller1(.P(P), .clk_5Hz(clk_5Hz), .R0(R0), .R1(R1), .R2(R2), .R3(R3));
simple_calculator simple_calculator1(.addend(addend), .clk(clk), .rst(rst), .enb(btn_sync), .sum(sum), .overflow(overflow));
output_encoder output_encoder1(.R0(R0), .R1(R1), .R2(R2), .R3(R3), .sum(sum), .overflow(overflow), .M(M), .C3(C3), .C2(C2), .C1(C1), .C0(C0), .overflow_led(overflow_led));
four_digit_shower four_digit_shower1(.clk_500Hz(clk_500Hz), .rst(rst), .C3(C3), .C2(C2), .C1(C1), .C0(C0), .C(C), .AN3(AN3), .AN2(AN2), .AN1(AN1), .AN0(AN0));

endmodule
