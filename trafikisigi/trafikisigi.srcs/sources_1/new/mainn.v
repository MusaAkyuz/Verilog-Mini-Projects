`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 01:27:00 PM
// Design Name: 
// Module Name: mainn
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


module mainn(
    input clk,
    output [1:0] lamb1_3,
    output [1:0] lamb2_4
    );
    reg [1:0] lamb1_3temp;
    reg [1:0] lamb2_4temp;

    always @ (posedge clk) begin
        lamb1_3temp = 0; //k�rm�z�
        lamb2_4temp = 2; //sar�
        #5;
        lamb1_3temp = 0; //k�rm�z�
        lamb2_4temp = 3; //ye�il
        #5;
        lamb1_3temp = 0; //k�rm�z�
        lamb2_4temp = 3; //ye�il
        #5;
        lamb1_3temp = 0; //k�rm�z�
        lamb2_4temp = 2; //sar�
        #5;
        lamb1_3temp = 2; //sar�
        lamb2_4temp = 0; //k�rm�z�
        #5;
        lamb1_3temp = 3; //ye�il
        lamb2_4temp = 0; //k�rm�z�
        #5;
        lamb1_3temp = 3; //ye�il
        lamb2_4temp = 0; //k�rm�z�
        #5;
        lamb1_3temp = 2; //sar�
        lamb2_4temp = 0; //k�rm�z�
        #5;
    end
    assign lamb1_3 = lamb1_3temp;
    assign lamb2_4 = lamb2_4temp;
endmodule
