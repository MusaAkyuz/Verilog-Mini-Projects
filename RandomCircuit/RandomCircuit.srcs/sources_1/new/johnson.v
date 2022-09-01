`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 08:41:09 PM
// Design Name: 
// Module Name: johnson
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


module johnson(
    input clk,
    input rst,
    output reg [3:0] q
    );
    reg [7:0] x = 8'b00001111;
    integer i;
    always @ (posedge clk) begin
        if(!rst) begin
            q <= 0;
            i = 0;
        end
        else begin
            q[0] = x[i%8];
            q[1] = x[(i+1)%8];
            q[2] = x[(i+2)%8];
            q[3] = x[(i+3)%8];
            i = i + 1;  
            if(i == 1000)
                i = 0;        
        end
    end
endmodule
