`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2022 09:03:49 AM
// Design Name: 
// Module Name: whileForUsage
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


module whileForUsage(
    input x,
    input y,
    output z
    );
    assign z = (~x & ~y) | (x & y);
endmodule
