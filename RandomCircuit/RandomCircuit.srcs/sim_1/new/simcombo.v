`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 07:16:36 AM
// Design Name: 
// Module Name: simcombo
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


module simcombo();
    reg a;
    reg b;
    reg c;
    reg d;
    wire o;
    
    combo uut(.a(a), .b(b), .c(c), .d(d), .o(o));
    
    initial begin
        a <= 0;
        #100;
        b <= 0;
        #100; 
        c <= 0;
        #100; 
        d <= 0;
        c <= 1;
        #100;
        a = 1;
        #100;
        b = 1;
        #100;
        c = 1;
        #100;
        d = 1;
        #100;
    end
endmodule
