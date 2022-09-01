`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 10:51:10 AM
// Design Name: 
// Module Name: soru1testbench
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


module soru1testbench();
    reg a;
    reg b;
    reg c;
    wire z;
    integer i = 0, x = 0, y = 0;
    soru1 uut(.a(a), .b(b), .c(c), .z(z));
    
    initial begin
        i = 0;
        while(i<2) begin
        a = i;
        x = 0;
        i = i + 1;
            while(x < 2) begin
                b = x;
                x = x + 1;
                y = 0;
                while(y < 2) begin
                     c = y;
                     y = y + 1;
                     #20;
                 end
            end
        end 
        
    end
endmodule
