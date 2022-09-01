`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2022 12:52:24 PM
// Design Name: 
// Module Name: adder
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


/*
Program counter
*/
module adder(PCINPUT,RESULT);
    input [31:0] PCINPUT;
    output [31:0] RESULT;
    reg RESULT;
    always@ (PCINPUT) begin
        RESULT = PCINPUT+ 4;
    end
endmodule
