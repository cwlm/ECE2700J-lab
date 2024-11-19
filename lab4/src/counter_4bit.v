module counter_4bit (
           input clock, reset, up_down,
           output reg [3:0] Q
       );

always @ (posedge reset or posedge clock)
    if (reset == 1'b1) Q <= 0;
    else Q <= Q + (up_down ? 1 : -1);

endmodule
