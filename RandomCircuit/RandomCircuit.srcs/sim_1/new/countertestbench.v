`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 02:01:17 PM
// Design Name: 
// Module Name: countertestbench
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


module countertestbench();
    reg clk;                     
    reg rst;                      
    wire [3:0] out;              
 
    counter uut( .clk (clk), .rst (rst), .out (out));  

    always #5 clk = ~clk;  

    initial begin  
        clk <= 0;  
        rst <= 0;  
  
        #20;   rst <= 1;  
        #80;   rst <= 0;  
        #50;   rst <= 1;  
    end  
endmodule
