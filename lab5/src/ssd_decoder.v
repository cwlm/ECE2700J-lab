module ssd_decoder (
           input [6:0] C,
           output reg [3:0] B
       );

always @(C) begin
    case(C)
        7'b0000001:
            B <= 4'b0000; // 0
        7'b1001111:
            B <= 4'b0001; // 1
        7'b0010010:
            B <= 4'b0010; // 2
        7'b0000110:
            B <= 4'b0011; // 3
        7'b1001100:
            B <= 4'b0100; // 4
        7'b0100100:
            B <= 4'b0101; // 5
        7'b0100000:
            B <= 4'b0110; // 6
        7'b0001111:
            B <= 4'b0111; // 7
        7'b0000000:
            B <= 4'b1000; // 8
        7'b0000100:
            B <= 4'b1001; // 9
        default:
            B <= 4'b1111; // invalid
    endcase
end

endmodule

