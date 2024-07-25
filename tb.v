`timescale 1ns / 1ps

module tb();
reg clk_tb,rst_tb,car_in_tb,car_out_tb;
wire [3:0] free_spots_tb;
wire [1:0] current_floor_tb;
wire parking_full_tb;

PARK_SYSTEM PARK(
       .clk(clk_tb),                 
       .rst(rst_tb),                 
       .car_out(car_out_tb),             
       .car_in(car_in_tb),              
       .free_spots(free_spots_tb),   
       .current_floor(current_floor_tb),
       .parking_full(parking_full_tb)        
);

initial
begin
clk_tb=0;
forever #5 clk_tb=~clk_tb;
end

initial
begin
rst_tb=1;
car_in_tb=0;
car_out_tb=0;

#10
rst_tb=0;
#10
car_in_tb=1;
#140
car_in_tb=0;
#10
car_out_tb=1;
#20
car_out_tb=0;
car_in_tb=1;
#10
car_in_tb=0;
$stop();

end

endmodule
