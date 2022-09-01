`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 01:00:50 PM
// Design Name: 
// Module Name: dflipfloptestbench
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


module dflipfloptestbench();
    reg rst;
    reg clk;
    wire [3:0] q; 
//    wire [3:0] z;
//    wire [3:0] k;
    dflipflop uut(.rst(rst), .clk(clk), .q(q));
    
    initial clk = 0;
    always #10 clk = ~clk;
endmodule
