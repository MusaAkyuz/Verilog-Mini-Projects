`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 12:56:21 PM
// Design Name: 
// Module Name: dflipflop
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


module dflipflop(
    input rst,
    input clk,
    output [3:0] q
//    output [3:0] z, 
//    output [3:0] k
    );
    integer q1;
//    integer q2;
//    integer q3;
    always @ (posedge clk or negedge rst) begin
        if(!rst) begin
            q1 = 4'b0000;
//            q2 <= 4'b0000;
//            q3 <= 4'b0000;
        end
        else begin
            q1 = {q1[2:0], ~q1[3]};
//            q2 <= q2 + 1;
//            q3 <= {q3[2:0], ~q3[3]};
        end
    end
    assign q = q1;
//    assign z = q2;
//    assign k = q3;
endmodule
