`timescale 1ps/1ps
module sequence_tb();
    reg [0:0]clk,reset;
    reg x;
    wire y1;
    wire [6:0]save1;

    always #5 clk=~clk;

    initial begin
        clk=1'b0;
        reset=1'b1;
        #2 reset=1'b0;
        #2 reset=1'b1;
        //     x=0;
        // #6  x=1;
        // #30 x=0;
        // #20 x=1;
        // #10 x=0;
        #300000
        $finish;
    end

    always@(negedge clk)begin
        x<=$random;
    end
    sequencer u1(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y1)
    );
    shift_reg u2(
        .clk(clk),
        .reset(reset),
        .x(x),
        .save(save1)
    );
  always @(posedge clk) begin
    if(y1==1)
        if(save1==7'b1110010)
            $display("%t is rihgt",$time);
        else
            $display("%t is error",$time);
  end
    initial begin
        $vcdpluson;
    end
endmodule