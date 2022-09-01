`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 08:45:33 PM
// Design Name: 
// Module Name: johnsen_tb
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


module johnsen_tb();
reg clk;
reg rst;
wire [3:0] q;
johnson uut(.clk(clk), .rst(rst), .q(q));
initial begin
    {clk,rst} <= 0;     
    #200;             //ilk 200ns bekle
    rst <= 1;           //saymayý baþlamasý için
                      //rst kaldýrýlýr.
end
always #20 clk = ~clk;
endmodule