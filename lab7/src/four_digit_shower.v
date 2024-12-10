`include "four_bit_ring_counter.v"
`include "reverse_tri_state_buffer.v"

module four_digit_shower(
    input wire clk_500Hz, rst,
    input wire [6:0] C3, C2, C1, C0,
    output wire AN3, AN2, AN1, AN0,
    output wire [6:0] C
);

four_bit_ring_counter counter(
    .clk(clk_500Hz),
    .rst(rst),
    .q({AN3, AN2, AN1, AN0})
);

reverse_tri_state_buffer buffer0(
    .data_in(C0),
    .disable_(AN0),
    .data_out(C)
);

reverse_tri_state_buffer buffer1(
    .data_in(C1),
    .disable_(AN1),
    .data_out(C)
);

reverse_tri_state_buffer buffer2(
    .data_in(C2),
    .disable_(AN2),
    .data_out(C)
);

reverse_tri_state_buffer buffer3(
    .data_in(C3),
    .disable_(AN3),
    .data_out(C)
);

endmodule
