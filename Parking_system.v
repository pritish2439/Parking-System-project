`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2023 23:54:47
// Design Name: 
// Module Name: Parking_system
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Parking_system(
    input clock,
    input [4:0] parking_slots,
    output reg [4:0] parking_slots_available,
    output [6:0] seg,
    output reg [3:0] an //enable option
    );
    reg [3:0] display; //for OPEn or FULL
    seven_seg ss0(display,seg);//instantiating seven segment display
    
    wire slowclock_100Hz;
    slowclk100Hz(clock,slowclock_100Hz);//instantiating slow clock
    
    reg[1:0] enable=0; //declaring enable input each for each segment
    
    //if a parking slot is occupied then turn the LED off else if it is empty then keep it on
    always @(parking_slots)
    case(parking_slots)//taking all the cases
    0:parking_slots_available=5'b11111;
    1:parking_slots_available=5'b11110;
    2:parking_slots_available=5'b11101;
    3:parking_slots_available=5'b11100;
    4:parking_slots_available=5'b11011;
    5:parking_slots_available=5'b11010;
    6:parking_slots_available=5'b11001;
    7:parking_slots_available=5'b11000;
    8:parking_slots_available=5'b10111;
    9:parking_slots_available=5'b10110;
    10:parking_slots_available=5'b10101;
    11:parking_slots_available=5'b10100;
    12:parking_slots_available=5'b10011;
    13:parking_slots_available=5'b10010;
    14:parking_slots_available=5'b10001;
    15:parking_slots_available=5'b10000;
    16:parking_slots_available=5'b01111;
    17:parking_slots_available=5'b01110;
    18:parking_slots_available=5'b01101;
    19:parking_slots_available=5'b01100;
    20:parking_slots_available=5'b01011;
    21:parking_slots_available=5'b01010;
    22:parking_slots_available=5'b01001;
    23:parking_slots_available=5'b01000;
    24:parking_slots_available=5'b00111;
    25:parking_slots_available=5'b00110;
    26:parking_slots_available=5'b00101;
    27:parking_slots_available=5'b00100;
    28:parking_slots_available=5'b00011;
    29:parking_slots_available=5'b00010;
    30:parking_slots_available=5'b00001;
    31:parking_slots_available=5'b00000;
    endcase
    //creating a counter to logic the 4 seven segments
    always @(posedge slowclock_100Hz)
    begin
    enable<=enable+1;
    end
    
    //enabling one segment at a time and displaying the character
    always @(posedge slowclock_100Hz)
    begin
    //if all the parking slots are occupied
    if(parking_slots[0] & parking_slots[1] & parking_slots[2] & parking_slots[3] & parking_slots[4])
    begin 
    case(enable)
    2'b00:
    begin
    display=0;//should show L
    an=4'b1110;//rightmost seven segment is enabled
    end 
    
     2'b01:
    begin
    display=0;//should show L
    an=4'b1101;//second from right of the seven segment is enabled
    end 
    
     2'b10:
    begin
    display=2;//should show U
    an=4'b1011;//second from left of the seven segment is enabled
    end 
    
    2'b11:
    begin
    display=1;//should show F
    an=4'b0111;//leftmost seven segment is enabled
    end
    endcase
    end
    //case for atleast one of them being unoccupied
    else if(parking_slots[0] & parking_slots[1] & parking_slots[2] & parking_slots[3] &parking_slots[4]!=1)
    begin
    case(enable)
   2'b00:
   begin
   display=6;// should show n
   an=4'b1110;//rightmost seven segment is enabled
   end 
   
   2'b01:
   begin
   display=5;//should show E
   an=4'b1101;//second from right of the seven segment is enabled
   end
   
   2'b10:
   begin
   display=4;//should show P
   an=4'b1011;//second from left of the seven segment is enabled
   end 
   
   2'b11:
   begin
   display=3;//should show O
   an=4'b0111;//leftmost seven segment is enabled
   end 
   endcase
   end 
   end  
   
   endmodule
   
   
     
    
    
    
    
    
    