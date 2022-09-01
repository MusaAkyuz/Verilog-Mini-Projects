`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2022 01:16:35 PM
// Design Name: 
// Module Name: twosCompliment
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


module twosCompliment(in,result);

    input [7:0] in;
    
    output [7:0] result;
    reg result;
    
    always@ (*) begin
        result = ~in+1;
    end
endmodule
