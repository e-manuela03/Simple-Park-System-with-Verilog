`timescale 1ns / 1ps


module COUNTER(
input clk,
input rst,
input count_down,
input count_up,
output reg [3:0] count
    );
    
always@(posedge clk)
begin
if(rst==1) 
    begin
        count<=0;
    end
else 
        if(count_down==1 & count!=0)
        begin
            count<=count-1;
        end
     else if(count_up==1)
                begin
                    count<=count+1;
                end
    
end
endmodule
