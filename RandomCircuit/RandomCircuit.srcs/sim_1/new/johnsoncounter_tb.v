`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 07:39:12 PM
// Design Name: 
// Module Name: johnsoncounter_tb
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


module johnsoncounter_tb();
reg [3:0] d;
reg clk;
reg rst;
wire [3:0] q;
johnsoncounter uut(.d(d), .clk(clk), .rst(rst), .q(q));

initial begin
    d <= 4'b0001;
    rst = 1;
    clk = 0;
    #40;
    rst = 0;
end

always #10 clk = ~clk;
endmodule
