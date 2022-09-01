`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 01:46:56 PM
// Design Name: 
// Module Name: trafik_tb
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


module trafik_tb();
reg clk;
wire [32:0] lamb1_3;
wire [32:0] lamb2_4;
integer i;
reg [31:0] x;
mainn uut(.clk(clk), .lamb1_3(lamb1_3), .lamb2_4(lamb2_4));
initial begin
    clk = 0;
    i = {$random}%3;
    x = i;
    #100;
     i = {$random}%3;
       #100;
        i = $();
          #100;
           i = {$random}%3;
           //lamb1_3 = i;
             #100;
end
always #1 clk = ~clk;
endmodule
