`timescale 1ns / 1ps

module TRANSCODOR_7SEG(
    input [3:0] in,
    output reg [6:0] out
    );
    
always@(*)
begin
case(in)
    4'd0: begin
       out=7'b1000000;
       end
    4'd1: begin
        out=7'b1111001;
       end
    4'd2: begin
        out=7'b0100100;
       end
    4'd3: begin
        out=7'b0110000;
       end
    4'd4: begin
        out=7'b0011001;
       end
    4'd5: begin
        out=7'b0010010;
       end
    4'd6: begin
        out=7'b0000010;
       end
    4'd7: begin
        out=7'b1111000;
       end
    4'd8: begin
        out=7'b0000000;
       end
    4'd9: begin
        out=7'b0010000;
       end
    4'd10: begin
        out=7'b0001000;
       end
    4'd11: begin
        out=7'b0000011;
       end
    4'd12: begin
        out=7'b1000110;
       end     
    
       
    default: out=7'b1000000;

endcase
end    
endmodule
