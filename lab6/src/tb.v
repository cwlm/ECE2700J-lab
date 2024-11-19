module tb_main;

    reg clk, reset;
    reg [3:0] row;
    wire [3:0] col;
    wire [6:0] C;

    main main(
        .clk(clk),
        .reset(reset),
        .row(row),
        .col(col),
        .C(C)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 0;

        integer i;
        reg [3:0]whichcon;
        whichcon = 4'b0000;
        connect connect( .a(C), .whichcon(i), .b(col));
   

        for (i = 0; i < 7; i = i + 1) begin
            whichcon = i;
            #10;
        end

        reset= 1;
        #70;
        reset = 0;

        #100;

        for (i = 7; i < 16; i = i + 1) begin
            whichcon = i;
            #10;
        end

        $finish;
        
  


    end

    



endmodule

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