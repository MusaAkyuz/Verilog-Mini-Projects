`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2022 09:04:49 AM
// Design Name: 
// Module Name: whileForTestBench
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


module whileForTestBench();
    reg a;
    reg b;
    wire c;
    
    whileForUsage uut(.x(a), .y(b), .z(c));
    integer i = 0;
    initial begin
        while(i < 2) begin
            a = i;
            i = i + 1;
            #100;
        end
        
    end
endmodule
