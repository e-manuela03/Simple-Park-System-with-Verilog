`timescale 1ns / 1ps


module CLK_DELAY(
    input clk,
    input rst,
    output clk_delay
    );
    
reg [31:0] count;

always@(posedge clk)
begin
if(rst==1)
    begin
    count<=0;
    end
else count<=count+1;
end    

assign clk_delay=count[27];

endmodule
