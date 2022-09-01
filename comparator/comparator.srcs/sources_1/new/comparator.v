`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2022 10:19:46 AM
// Design Name: 
// Module Name: comparator
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


module comparator(
    input clk,
    input clk2,
    input x,
    input y,
    output z,
    output zz
    );
    reg z2;
    reg z3;
    //xor
    
    always @ (posedge clk) begin
        z2 = x & y;
    end
    
    always @ (posedge clk2) begin
        z3 = x | y;
    end
    
    assign z = z2;
    assign zz = z3;
endmodule