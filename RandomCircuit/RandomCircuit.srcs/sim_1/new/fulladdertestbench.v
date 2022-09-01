`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 04:20:34 PM
// Design Name: 
// Module Name: fulladdertestbench
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


module fulladdertestbench();
    reg [31:0] first;
    reg [31:0] second;
    wire [31:0] sum;
    reg carryin;
    wire carryout;
    integer i = 0;
    integer x = 0;
    integer y = 0;
    fulladder uut(.first(first), .second(second), .sum(sum), .carryin(carryin), .carryout(carryout));
    
    initial begin
        while(i < 10) begin
        first = i;
        y = 0;
            while(y < 10) begin
                second = y;
                x = 0;
                while(x < 2) begin
                    carryin = x;
                    x = x + 1;
                    #1;
                end
                y = y + 1;
            end           
            i = i + 1;
        end
    end    
endmodule

