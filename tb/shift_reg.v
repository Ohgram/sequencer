module shift_reg (
    input   clk,
            reset,
            x,
    output reg[6:0] save
);
    // reg [6:0] save;
    always @(posedge clk or negedge reset) begin
        if(!reset)
            save<=7'b0;
        else
            save<={save[5:0],x};
    end
endmodule