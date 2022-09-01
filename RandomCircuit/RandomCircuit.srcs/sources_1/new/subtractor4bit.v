`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 09:05:11 PM
// Design Name: 
// Module Name: subtractor4bit
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


module subtractor4bit(
    input [3:0] in1,
    input [3:0] in2,
    output [3:0] diff,
    input bin,
    output bout
    );
    assign diff = in1 ^ in2 ^ bin;
    assign bout = (~in1 & bin) | (~in1 & in2) | (in2 & bin);
endmodule

//primitive fortable(bout, in1, in2);
//output bout;
//input in1, in2;
//table
//0 0 : 0;
//0 1 : 1;
//1 0 : 0;
//1 1 : 0;
//endtable
//endprimitive
