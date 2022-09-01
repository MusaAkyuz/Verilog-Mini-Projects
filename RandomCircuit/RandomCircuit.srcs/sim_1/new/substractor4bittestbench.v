`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 09:10:48 PM
// Design Name: 
// Module Name: substractor4bittestbench
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


module substractor4bittestbench();
    reg [3:0] in1;
    reg [3:0] in2;
    reg [3:0] bin;
    wire [3:0] diff;
    wire [3:0] bout;
    integer i=0, x=0, y=0;
    tumleyenlicikarma uut(.x(in1), .y(in2), .cin(bin), .cout(bout), .sum(diff));
    initial begin
    y = 0;
        while(y<8) begin
        x = 0;
        in1 = y;
        y = y + 1;
            while(x<8) begin
            i = 0;
            in2 = x;
            x = x + 1;
                while(i<2) begin
                    bin = i;
                    i = i + 1;
                    #10;    
                end
            end
        end
    end
endmodule
