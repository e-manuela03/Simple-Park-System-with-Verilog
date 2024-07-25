`timescale 1ns / 1ps


module TOP(
    input clk,
    input rst_clk,
    input rst_park,
    input car_out,
    input car_in,
    output clk_delay,
    output [6:0] spots_7seg,
    output [2:0] floor_decoded,
    output full_garage,
    output spots_available
    );

wire [3:0] free_spots;
wire [1:0] floor;
wire full;

CLK_DELAY CLK_DELAY0(
    .clk(clk),
    .rst(rst_clk),
    .clk_delay(clk_delay)
);

PARK_SYSTEM PARK_SYSTEM0(
          .clk(clk_delay),                   
          .rst(rst_park),                   
          .car_out(car_out),               
          .car_in(car_in),                
          .free_spots(free_spots),     
          .current_floor(floor),  
          .parking_full(full)  
         );      
         
TRANSCODOR_7SEG TRANSCODOR0(
    .in(free_spots),
    .out(spots_7seg)
);

FLOOR_DECODER DECODER0(
    .floor(floor),
    .full(full),
    .floor_decoded(floor_decoded)
);

assign full_garage=full;
assign spots_available=~full;
endmodule
