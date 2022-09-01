`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 10:31:52 AM
// Design Name: 
// Module Name: soru1
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


module soru1(
    input a,
    input b,
    input c,
    output z
    );
    wire a_and_b, b_and_c, ab_or_bc, cnot, a_and_cnot;
    and(a_and_b, a, b);
    and(b_and_c, b, c);
    not(cnot, c);
    and(a_and_cnot, a, cnot);
    or(ab_or_bc, a_and_b, b_and_c);
    or(z, ab_or_bc, a_and_cnot);    
endmodule
