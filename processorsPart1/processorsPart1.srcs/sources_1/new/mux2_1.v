`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2022 01:13:59 PM
// Design Name: 
// Module Name: mux2_1
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


//this is a implementation of a 2 to 1 multiplexer
module mux2_1(in0,in1,se1,out);

    input se1;        //immediae value
    input [7:0] in0; 
    input [7:0] in1;  // register output
    
    output [7:0] out;
    reg out;
    
    always @ (in0,in1,se1) begin
        if(se1==1'b1) begin
            out = in0;
        end 
        else begin
            out = in1;
        end
    end    
endmodule