`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 01:14:06 PM
// Design Name: 
// Module Name: dflipflopsimulation
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


module dflipflopsimulation();
        reg d;
        reg rst;
        reg clk;
        wire q;
        integer i;
        
        dflipflop uut(.d(d), .rst(rst), .clk(clk), .q(q));
        
        initial begin
            d <= 0; i = 0;
            while(i < 11) begin
                clk = i; #1;
                i = i + 1;
            end
                
            d <= 1; i = 0;
            while(i < 11) begin
                clk = i; #1; 
                i = i + 1; 
            end
            
            rst <= 1; i=0;
            while(i < 11) begin
                clk = i; #1
                i = i + 1;
            end  
            
            rst <= 0; i=0;
            while(i < 11) begin
                 clk = i; #1
                 i = i + 1;
            end 
        end
endmodule
