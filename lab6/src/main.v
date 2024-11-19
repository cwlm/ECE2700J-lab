`include "divider10kHz.v"
`include "keypad_scanner.v"
`include "ssd_driver.v"

module main (
    input wire clk, reset,
    input wire [3:0] row,
    output wire [3:0] col,
    output reg [6:0] C
);

wire clk_10k, reg_load;
wire [3:0] code;
reg [3:0] ssd_code;

divider10kHz div10k(
    .clk(clk),
    .reset(reset),
    .nclk(clk_10k)
);

keypad_scanner keypad(
    .clk(clk_10k),
    .reset(reset),
    .row(row),
    .col(col),
    .code(code),
    .reg_load(reg_load)
);

always @(posedge clk_10k) begin
    if (reg_load) begin
        ssd_code <= code;
    end
end

ssd_driver ssd(
    .B(ssd_code),
    .C(C)
);

endmodule