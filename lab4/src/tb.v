//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/10/28 21:35:31
// Design Name:
// Module Name: tb
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
`include "lab4.v"
`default_nettype none
`timescale 1ns / 1ps

module tb();

reg clock, reset, up_down;
wire [3:0] Q;
wire CA, CB, CC, CD, CE, CF, CG, AN0;

lab4 lab4_inst(
         .clock(clock),
         .reset(reset),
         .up_down(up_down),
         .Q(Q),
         .CA(CA),
         .CB(CB),
         .CC(CC),
         .CD(CD),
         .CE(CE),
         .CF(CF),
         .CG(CG),
         .AN0(AN0)
     );


// Define the clock period
localparam CLK_PERIOD = 10;

// Generate the clock signal
always #(CLK_PERIOD/2) clock = ~clock;

initial begin
    // Initialize signals
    clock = 0;
    reset = 1;
    up_down = 1;

    // Apply reset
    #200 reset = 1;
    #200 reset = 0;

    // Finish simulation
    #1000 $finish;
end

endmodule
