`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2023 23:30:05
// Design Name: 
// Module Name: slowclk100Hz
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


module slowclk100Hz(   //let frequency of board be 100Mhz
    input clk_in,      //consider slow clock to have a frequency of 100Hz
    output reg clk_out
    );
    reg [20:0] period_count=0; //checking for the number of bits(20 bits)
    always @(posedge clk_in)
    if(period_count!=500000-1)
    begin
    period_count<= period_count +1;//period_count acts as a step counter 
    clk_out=0;
    end
    else
    begin
    period_count <=0;
    clk_out <=1;
    end
    
    
endmodule
