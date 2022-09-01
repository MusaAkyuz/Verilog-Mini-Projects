`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 11:22:33 AM
// Design Name: 
// Module Name: fulladder32bit
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


module fulladder32bit(
    input [31:0] x,
    input [31:0] y,
    input cin,
    output [31:0] sum,
    output cout
    );
    integer i = 0;
    for(i = 0; i<32; i = i + 1) begin
        assign sum[i:0] = x[i:0] + y[i:0] + cin;
    end
    
endmodule
