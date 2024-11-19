module ssd_driver (
           input [3:0] B,
           output reg CA, CB, CC, CD, CE, CF, CG
       );

always @(*) begin
    case (B)
        4'b0000: {CA, CB, CC, CD, CE, CF, CG} = 7'b0000001; // Display 0
        4'b0001: {CA, CB, CC, CD, CE, CF, CG} = 7'b1001111; // Display 1
        4'b0010: {CA, CB, CC, CD, CE, CF, CG} = 7'b0010010; // Display 2
        4'b0011: {CA, CB, CC, CD, CE, CF, CG} = 7'b0000110; // Display 3
        4'b0100: {CA, CB, CC, CD, CE, CF, CG} = 7'b1001100; // Display 4
        4'b0101: {CA, CB, CC, CD, CE, CF, CG} = 7'b0100100; // Display 5
        4'b0110: {CA, CB, CC, CD, CE, CF, CG} = 7'b0100000; // Display 6
        4'b0111: {CA, CB, CC, CD, CE, CF, CG} = 7'b0001111; // Display 7
        4'b1000: {CA, CB, CC, CD, CE, CF, CG} = 7'b0000000; // Display 8
        4'b1001: {CA, CB, CC, CD, CE, CF, CG} = 7'b0000100; // Display 9
        4'b1010: {CA, CB, CC, CD, CE, CF, CG} = 7'b0001000; // Display A
        4'b1011: {CA, CB, CC, CD, CE, CF, CG} = 7'b1100000; // Display B
        4'b1100: {CA, CB, CC, CD, CE, CF, CG} = 7'b0110001; // Display C
        4'b1101: {CA, CB, CC, CD, CE, CF, CG} = 7'b1000010; // Display D
        4'b1110: {CA, CB, CC, CD, CE, CF, CG} = 7'b0110000; // Display E
        4'b1111: {CA, CB, CC, CD, CE, CF, CG} = 7'b0111000; // Display F
        default: {CA, CB, CC, CD, CE, CF, CG} = 7'b1111111; // Off or error state
    endcase
end

endmodule

