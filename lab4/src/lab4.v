`include "counter_4bit.v"
`include "ssd_driver.v"

module lab4 (
           input clock, reset, up_down,
           output wire [3:0] Q,
           output wire CA, CB, CC, CD, CE, CF, CG, AN0
       );

counter_4bit counter_4bit_inst(
                 .clock(clock),
                 .reset(reset),
                 .Q(Q),
                 .up_down(up_down)
             );

ssd_driver ssd_driver_inst(
               .B(Q),
               .CA(CA),
               .CB(CB),
               .CC(CC),
               .CD(CD),
               .CE(CE),
               .CF(CF),
               .CG(CG)
           );

assign AN0 = 1;

endmodule
