module connect(
    input [3:0] a,
    input [3:0] whichcon,
    output reg [3:0] b
);

    integer i;

    always @(*) begin
        b = 4'b0; 
        for (i = 0; i < 4; i = i + 1) begin
            if (i == whichcon[3:2]) begin
                b[i] = a[whichcon[1:0]];
            end
        end
    end

endmodule