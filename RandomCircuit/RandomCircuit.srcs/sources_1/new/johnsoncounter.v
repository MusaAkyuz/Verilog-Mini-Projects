`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 07:22:01 PM
// Design Name: 
// Module Name: johnsoncounter
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


module johnsoncounter(input [3:0] d, input clk, input rst, output reg [3:0] q);
reg [3:0] dtemp;
reg [3:0] qtemp;
    initial begin
        dtemp = d;
    end
    always @ (posedge clk or negedge rst) begin
        if(!rst) begin
            qtemp = 4'b0000;
        end
        else begin
//            qtemp[0] <= dtemp[0];
//            qtemp[1] <= dtemp[1];
//            qtemp[2] <= dtemp[2];
//            qtemp[3] <= dtemp[3];
//            dtemp[0] <= ~qtemp[3];
//            qtemp = {qtemp[2:0], ~qtemp[3]};
            
        end
        q <= qtemp;
    end 

endmodule
