`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 03:08:57 PM
// Design Name: 
// Module Name: baska
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


module baska(
input [7:0] playerinput,
input [1:0] computerinput,
//output winner,
//output [3:0] score,
output [7:0] deneme,
output [1:0] cdeneme
);
assign deneme = playerinput;
assign cdeneme = computerinput;
endmodule
