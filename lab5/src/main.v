`include "four_bit_ring_counter.v"
`include "ssd_driver.v"
`include "divider1Hz.v"
`include "divider500Hz.v"
`include "timer.v"
`include "reverse_tri_state_buffer.v"

module main(
           input clk,
           input rst,
           output wire a1, a2, a3, a4,
           output wire [6:0] c
       );

wire clk_500Hz, clk_1Hz;
wire [6:0] c1, c2, c3, c4;
wire [3:0] q_l, q_r;

divider500Hz div500Hz(
                 .clk(clk),
                 .reset(rst),
                 .nclk(clk_500Hz)
             );

divider1Hz div1Hz(
               .clk(clk_500Hz),
               .reset(rst),
               .nclk(clk_1Hz)
           );

four_bit_ring_counter counter(
                          .clk(clk_500Hz),
                          .rst(rst),
                          .q({a4, a3, a2, a1})
                      );

timer timer(
          .clk(clk_1Hz),
          .reset(rst),
          .o1(q_r),
          .o0(q_l)
      );

ssd_driver ssd_ones(
               .B(q_l),
               .C(c4)
           );

ssd_driver ssd_tens(
               .B(q_r),
               .C(c3)
           );

reverse_tri_state_buffer buffer1(
                             .data_in(c1),
                             .disable_(a1),
                             .data_out(c)
                         );

reverse_tri_state_buffer buffer2(
                             .data_in(c2),
                             .disable_(a2),
                             .data_out(c)
                         );

reverse_tri_state_buffer buffer3(
                             .data_in(c3),
                             .disable_(a3),
                             .data_out(c)
                         );

reverse_tri_state_buffer buffer4(
                             .data_in(c4),
                             .disable_(a4),
                             .data_out(c)
                         );

assign c2 = 7'b1111111;
assign c1 = 7'b1111111;

endmodule
