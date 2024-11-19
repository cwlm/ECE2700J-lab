module keypad_scanner (
           input wire clk, reset,
           input wire [3:0] row,
           output wire [3:0] col,
           output wire [3:0] code,
           output wire reg_load
       );
wire or_row = row[0] | row[1] | row[2] | row[3];

// State encoding
reg [3:0] current_state, next_state;
parameter IDLE = 4'b0000, COL0 = 4'b0001, COL1 = 4'b0010, COL2 = 4'b0011, COL3 = 4'b0100;
parameter COL0ON = 4'b0101, COL1ON = 4'b0110, COL2ON = 4'b0111, COL3ON = 4'b1000, WAIT = 4'b1001;

// State transition
always @ (posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= IDLE;
    end
    else begin
        current_state <= next_state;
    end
end

// State logic
always @(*) begin
    case (current_state)
        IDLE: begin
            if (or_row) begin
                next_state = COL0;
            end
            else begin
                next_state = IDLE;
            end
        end
        COL0: begin
            next_state = or_row ? COL0ON : COL1;
        end
        COL1: begin
            next_state = or_row ? COL1ON : COL2;
        end
        COL2: begin
            next_state = or_row ? COL2ON : COL3;
        end
        COL3: begin
            next_state = or_row ? COL3ON : IDLE;
        end
        COL0ON: begin
            next_state = WAIT;
        end
        COL1ON: begin
            next_state = WAIT;
        end
        COL2ON: begin
            next_state = WAIT;
        end
        COL3ON: begin
            next_state = WAIT;
        end
        WAIT: begin
            next_state = or_row ? WAIT : IDLE;
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

// Output logic
assign col = (current_state == COL0) ? 4'b0001 :
             (current_state == COL1) ? 4'b0010 :
             (current_state == COL2) ? 4'b0100 :
             (current_state == COL3) ? 4'b1000 : 4'b1111;
assign reg_load = (current_state == COL0ON) | (current_state == COL1ON) | (current_state == COL2ON) | (current_state == COL3ON);
assign code[3:2] = (current_state == COL0ON) ? 2'b00 :
                   (current_state == COL1ON) ? 2'b01 :
                   (current_state == COL2ON) ? 2'b10 :
                   (current_state == COL3ON) ? 2'b11 : 2'b11;
assign code[1:0] = row[0] ? 2'b00 :
                   row[1] ? 2'b01 :
                   row[2] ? 2'b10 :
                   row[3] ? 2'b11 : 2'b11;
endmodule
