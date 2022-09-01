`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 11:37:32 PM
// Design Name: 
// Module Name: fulladder32
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


module fulladder32(
    input [31:0] x,
    input [31:0] y,
    input cin,
    output cout,
    output [31:0] sum
    );
    assign sum = x ^ y ^ cin;
    assign cout = (x & y) | (x & cin) | (y & cin);
endmodule
