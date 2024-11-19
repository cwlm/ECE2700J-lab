module ssd_driver (
           input [3:0] B,
           output reg [6:0] C
       );

always @(*) begin
    case (B)
        4'b0000: C = 7'b0000001; // Display 0
        4'b0001: C = 7'b1001111; // Display 1
        4'b0010: C = 7'b0010010; // Display 2
        4'b0011: C = 7'b0000110; // Display 3
        4'b0100: C = 7'b1001100; // Display 4
        4'b0101: C = 7'b0100100; // Display 5
        4'b0110: C = 7'b0100000; // Display 6
        4'b0111: C = 7'b0001111; // Display 7
        4'b1000: C = 7'b0000000; // Display 8
        4'b1001: C = 7'b0000100; // Display 9
        4'b1010: C = 7'b0001000; // Display A
        4'b1011: C = 7'b1100000; // Display B
        4'b1100: C = 7'b0110001; // Display C
        4'b1101: C = 7'b1000010; // Display D
        4'b1110: C = 7'b0110000; // Display E
        4'b1111: C = 7'b0111000; // Display F
        default: C = 7'b1111111; // Display off
    endcase
end

endmodule