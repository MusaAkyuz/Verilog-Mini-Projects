`timescale 01ps / 0.1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 04:43:36 PM
// Design Name: 
// Module Name: fulladdersim
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


module fulladdersim();  
    reg [3:0] first;  
    reg [3:0] second;  
    reg carryin;  
    wire [3:0] sum;  
    integer i;  
 
    fulladder uut(.first(first), .second(second), .sum(sum), .carryin(carryin), .carryout(carryout)); 
 
    initial begin  
        
    end  
endmodule
