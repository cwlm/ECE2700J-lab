`include "simple_calculator.v"
`include "output_encoder.v"
`include "roller.v"
`include "button_sync.v"
`include "divider5Hz.v"

module main (
           input wire clk, btn, rst, P, M,
           input wire [3:0] addend,
           output wire [6:0] C3, C2, C1, C0, // SSD outputs
           output wire overflow_led // overflow LED
       );

wire btn_sync, clk_5Hz;
wire overflow;
wire [3:0] R0, R1, R2, R3;
wire [3:0] sum;

clk_divider5Hz clk_divider5Hz1(.clk(clk), .clk_5Hz(clk_5Hz));
button_sync button_sync1(.btn(btn), .clk(clk), .rst(rst), .btn_sync(btn_sync));
roller roller1(.P(P), .clk_5Hz(clk_5Hz), .R0(R0), .R1(R1), .R2(R2), .R3(R3));
simple_calculator simple_calculator1(.addend(addend), .clk(clk), .rst(rst), .enb(btn_sync), .sum(sum), .overflow(overflow));
output_encoder output_encoder1(.R0(R0), .R1(R1), .R2(R2), .R3(R3), .sum(sum), .overflow(overflow), .M(M), .C3(C3), .C2(C2), .C1(C1), .C0(C0), .overflow_led(overflow_led));

endmodule
