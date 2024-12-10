`include "ssd_driver.v"

module output_encoder(
           // Inputs
           input wire [3:0] R0, R1, R2, R3, // roller outputs
           input wire [3:0] sum, // simple_calculator output
           input wire overflow, // simple_calculator output
           input wire M, // mode control
           // Outputs
           output wire [6:0] C3, C2, C1, C0, // SSD outputs
           output wire overflow_led // overflow LED
       );

wire [6:0] RC0, RC1, RC2, RC3;
wire [6:0] sum_C;
wire [3:0] sum_numeric;

assign sum_numeric = sum[3] ? (4'b1000 - {1'b0, sum[2:0]}) : {1'b0, sum[2:0]};

// SSD drivers
ssd_driver ssd0(R0, RC0);
ssd_driver ssd1(R1, RC1);
ssd_driver ssd2(R2, RC2);
ssd_driver ssd3(R3, RC3);
ssd_driver ssd_sum(sum_numeric, sum_C);

assign C0 = M ? sum_C : RC0;
assign C1 = M ? {6'b111111, !sum[3]} : RC1;
assign C2 = M ? 7'b1111111 : RC2;
assign C3 = M ? 7'b1111111 : RC3;

assign overflow_led = M ? overflow : 1'b0;

endmodule
