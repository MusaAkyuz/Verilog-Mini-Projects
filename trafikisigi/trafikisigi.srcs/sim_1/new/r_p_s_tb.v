`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 10:51:30 PM
// Design Name: 
// Module Name: r_p_s_tb
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


module r_p_s_tb();
reg clk;
reg [1:0] player;
reg [1:0] computer;
wire winner;
wire [3:0] scoreplayer;
wire [3:0] scorecomputer;
rockpaperscissors uut(.clk(clk), .player(player), .computer(computer), .winner(winner),
                      .scoreplayer(scoreplayer), .scorecomputer(scorecomputer));

initial begin
    clk = 1;
    player = $random%3;
    computer = $random%3;
end

always #5 begin
    clk = ~clk;
    player = $random%3;
    computer = $random%3;
end
endmodule
