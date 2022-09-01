`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2022 12:06:06 PM
// Design Name: 
// Module Name: primitives
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

module primitives(
	input x,
	input y,
	output z
);
compare c0(z, x, y);
endmodule
 
primitive compare(out, in1, in2);
	output out;
	input in1,in2;
 
table
// in1  in2  : out
    0    0   : 1; 
    0    1   : 0; 
    1    0   : 0; 
    1    1   : 1; 
endtable
endprimitive
