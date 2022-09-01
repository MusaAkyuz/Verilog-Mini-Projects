`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 10:42:45 AM
// Design Name: 
// Module Name: otopark_tb
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


module otopark_tb();
reg girissensor;
reg bariyersensor;
wire kirmiziled;
wire yesilled;
wire bariyer;
wire [4:0] aracsayisi;
integer i = 0;

mainn uut(.girissensor(girissensor), .bariyersensor(bariyersensor), 
          .kirmiziled(kirmiziled), .yesilled(yesilled), .bariyer(bariyer),
          .aracsayisi(aracsayisi));

initial begin
    //girissensor = 0 ve bariyer sensor = 0 iken
    girissensor = 0; bariyersensor = 0;
    #20;
    girissensor = 1; bariyersensor = 0;
    #20;
    girissensor = 1; bariyersensor = 1;
    #20;
    girissensor = 1; bariyersensor = 0;
    #20;
    while(i < 20) begin
        girissensor = 0;
        #30;
        girissensor = 1;
        #30;
        i = i + 1;
    end         
end
endmodule
