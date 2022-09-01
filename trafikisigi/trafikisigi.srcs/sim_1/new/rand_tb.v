`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 02:51:08 PM
// Design Name: 
// Module Name: rand_tb
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


module rand_tb();
reg [7:0] playerinput;
reg [1:0] computerinput;
//wire winner;
//wire [3:0] score;
wire [7:0] deneme;
wire [1:0] cdeneme;

baska uut(.playerinput(playerinput), .computerinput(computerinput), .deneme(deneme), .cdeneme(cdeneme));
initial begin
     cdeneme = 1;
end
   
    //deneme = $getc();
endmodule  
