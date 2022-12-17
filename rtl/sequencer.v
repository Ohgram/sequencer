//this module is used to check sequence 111_0010
module sequencer (
    input   clk,
            reset,
            x,
    output  y
);
reg [2:0] state,next_state;

localparam  s0='b000,
            s1='b001,
            s2='b010,
            s3='b011,
            s4='b100,
            s5='b101,
            s6='b110,
            s7='b111;

always @(posedge clk or negedge reset) begin
    if(!reset)
        state<=s0;
    else
        state<=next_state;
end

always @(*) begin
    case (state)
        s0:next_state<=(x)?s1:s0;
        s1:next_state<=(x)?s2:s0;
        s2:next_state<=(x)?s3:s0;
        s3:next_state<=(x)?s3:s4;
        s4:next_state<=(x)?s1:s5;
        s5:next_state<=(x)?s6:s0;
        s6:next_state<=(x)?s2:s7;
        s7:next_state<=(x)?s1:s0;
        default:next_state<=s0;
    endcase
end

assign y=(state==s7)?1:0;

endmodule