`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 12:14:21 PM
// Design Name: 
// Module Name: johnsondevresi
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


module johnsondevresi(
   input rst,
 input clk,
 output [3:0] q
//    output [3:0] z, 
//    output [3:0] k
 );
 reg [3:0] q1;
//    integer q2;
//    integer q3;
 always @ (posedge clk or negedge rst) begin
     if(!rst) begin
         q1 = 4'b0000;
//            q2 <= 4'b0000;
//            q3 <= 4'b0000;
     end
     else begin
         q1 = 4'b0011;
     end
 end
 assign q = q1;
//    assign z = q2;
//    assign k = q3;
endmodule
