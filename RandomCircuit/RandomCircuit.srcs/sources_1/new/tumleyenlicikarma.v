`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2022 02:26:34 AM
// Design Name: 
// Module Name: tumleyenlicikarma
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


module tumleyenlicikarma(
    input [3:0] x,
    input [3:0] y,
    output [3:0] sum,
    input [3:0] cin,
    output [3:0] cout
    );
    assign sum = x + (~y+1) + cin;
    assign cout = (x & ~y+1) | (x & cin) | (~y+1 & cin);
endmodule


