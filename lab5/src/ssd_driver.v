module ssd_driver (
           input [3:0] B,
           output reg [6:0] C
       );

always @(*) begin
    case (B)
        4'b0000:
            C = 7'b0000001; // Display 0
        4'b0001:
            C = 7'b1001111; // Display 1
        4'b0010:
            C = 7'b0010010; // Display 2
        4'b0011:
            C = 7'b0000110; // Display 3
        4'b0100:
            C = 7'b1001100; // Display 4
        4'b0101:
            C = 7'b0100100; // Display 5
        4'b0110:
            C = 7'b0100000; // Display 6
        4'b0111:
            C = 7'b0001111; // Display 7
        4'b1000:
            C = 7'b0000000; // Display 8
        4'b1001:
            C = 7'b0000100; // Display 9
        default:
            C = 7'b1111111; // Off or error state
    endcase
end

endmodule

