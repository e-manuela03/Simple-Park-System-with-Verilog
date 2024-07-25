`timescale 1ns / 1ps


module PARK_SYSTEM(
    input clk,
    input rst,
    input car_out,
    input car_in,
    output [3:0] free_spots,
    output [1:0] current_floor,
    output parking_full
    );
    
wire count_up_wire; 
wire [3:0] car_count;
wire count_sel;  

assign count_sel=~(car_count<12);


assign free_spots=4'd12-car_count;


COUNT_MUX COUNT_MUX(
    .in0(car_in),
    .in1(0),
    .sel(count_sel),
    .out(count_up_wire)
);  
    
COUNTER CAR_COUNTER(
     .clk(clk),               
     .rst(rst),               
     .count_down(car_out),        
     .count_up(count_up_wire),          
     .count(car_count)    
);


PARK_FSM FSM(
        .clk(clk),         
        .rst(rst),         
        .count(car_count), 
        .floor(current_floor),
        .full(parking_full)        
);

   
endmodule
