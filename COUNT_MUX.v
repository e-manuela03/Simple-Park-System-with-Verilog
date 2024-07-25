`timescale 1ns / 1ps


module COUNT_MUX (
    input in0,
    input in1,
    input sel,
    output reg out
    );
    
always@(*)
begin
case(sel)
    0: begin
        out=in0;
       end
    1: begin
        out=in1;
       end
   default: out=0;
endcase
end    
    
endmodule
