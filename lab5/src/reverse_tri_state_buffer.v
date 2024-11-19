module reverse_tri_state_buffer(
           input wire [6:0] data_in,
           input wire disable_,
           output wire [6:0] data_out
       );

assign data_out = disable_ ? 7'bZZZZZZZ : data_in;

endmodule
