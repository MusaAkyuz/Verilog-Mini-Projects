`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 04:10:54 PM
// Design Name: 
// Module Name: halfaddertestbench
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


module halfaddertestbench();
    reg first;
    reg second;
    wire sum;
    wire carryout;
    
    halfadder uut(.first(first), .second(second), .sum(sum), .carryout(carryout));
    
    initial begin
        first <= 0; second <= 0; #100;
        first <= 0; second <= 1; #100;
        first <= 1; second <= 0; #100;
        first <= 1; second <= 1; #100;
    end
endmodule
