`timescale 1ns / 1ps

module PARK_FSM(
    input clk,
    input rst,
    input [3:0] count,
    output [1:0] floor,
    output full
    );
    
localparam FLOOR0=2'b00;
localparam FLOOR1=2'b01;
localparam FLOOR2=2'b10;
localparam FULL=2'b11;

reg [1:0] state,state_next;

always@(posedge clk)
begin
if(rst==1)
    begin
        state<=FLOOR0;
    end
else state<=state_next;
end

always@(*)
begin
state_next=state;
case(state)
    FLOOR0: begin
            if(count<=4) state_next=FLOOR0;
            else
            if(count>4) state_next=FLOOR1;
            end
    FLOOR1: begin
            if(count<=4) state_next=FLOOR0;
            else
            if(count<=8) state_next=FLOOR1;
            else
            if(count>8) state_next=FLOOR2;
            end
    FLOOR2: begin
            if(count<=8) state_next=FLOOR1;
            else
            if(count<12) state_next=FLOOR2;
            else
            if(count==12) state_next=FULL;
            end
      FULL: begin
            if(count<12) state_next=FLOOR2;
            else
            if(count==12) state_next=FULL;
            end
    default: state_next=FLOOR0;

endcase
end

assign floor=(state==FLOOR0)? 0 : (state==FLOOR1)? 1: (state==FLOOR2)? 2: (state==FULL)? 2:0;
assign full=(state==FULL);

endmodule
