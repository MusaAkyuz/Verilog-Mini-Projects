`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2022 08:50:00 AM
// Design Name: 
// Module Name: testBench
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


module testBench();
    reg a;
    reg b;
    wire c;
    
    mainCode uut(
    .x(a),
    .y(b),
    .z(c)
    );
    
    initial begin
        #100;
        a = 1; b = 1;
        #100;
        a = 0; b = 1;
        #100;
        a = 1; b = 0;
        #100;
        a = 0; b = 0;
        #100;
    end
endmodule
