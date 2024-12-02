module button_sync (
           input wire clk, rst, btn,
           output reg btn_sync
       );

reg [1:0] state;

always @(posedge clk) begin
    if (rst) begin
        state <= 2'b00;
    end
    else begin
        case (state)
            2'b00: begin
                if (btn) begin
                    state <= 2'b01;
                end
            end
            2'b01: begin
                if (!btn) begin
                    state <= 2'b10;
                end
            end
            2'b10: begin
                state <= 2'b00;
            end
            default: begin
                state <= 2'b00;
            end
        endcase
    end
end

always @(posedge clk) begin
    if (rst) begin
        btn_sync <= 1'b0;
    end
    else begin
        if (state == 2'b01) begin
            btn_sync <= 1'b1;
        end
        else begin
            btn_sync <= 1'b0;
        end
    end
end

endmodule
