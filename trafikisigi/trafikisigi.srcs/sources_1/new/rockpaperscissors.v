`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 09:38:48 PM
// Design Name: 
// Module Name: rockpaperscissors
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


module rockpaperscissors(
    input clk,
    input [1:0] player,
    input [1:0] computer,
    output winner, //0 ise player 1 ise computer
    output [3:0] scoreplayer,
    output [3:0] scorecomputer
    );
    reg [3:0] scorecomputertemp = 0;
    reg [3:0] scoreplayertemp = 0;
    reg winnertemp;
    always @ (posedge clk) begin
        $display("Player : %d", scoreplayertemp);
        $display("Comp : %d", scorecomputertemp);
        if(player == 0) begin
            if(computer == 1) begin
                scorecomputertemp = scorecomputertemp + 1;
            end
            if(computer == 2) begin
                scoreplayertemp = scoreplayertemp + 1;
            end
        end
        if(player == 1) begin
            if(computer == 0) begin
                scoreplayertemp = scoreplayertemp + 1;
            end
            if(computer == 2) begin
                scorecomputertemp = scorecomputertemp + 1;
            end
        end
        if(player == 2) begin
            if(computer == 0) begin
                scorecomputertemp = scorecomputertemp + 1;
            end
            if(computer == 1) begin
                scoreplayertemp = scoreplayertemp + 1;
            end
        end
    end
    always #55 begin
        if(scorecomputertemp < scoreplayertemp) begin
            winnertemp = 0; 
            $display("Kazanan oyuncu, puaný : %d", scoreplayertemp);
        end
        if(scorecomputertemp > scoreplayertemp) begin
            winnertemp = 1;        
            $display("Kazanan bilgisayar, puaný : %d", scorecomputertemp);
        end
    end
    assign winner = winnertemp;
    assign scoreplayer = scoreplayertemp;
    assign scorecomputer = scoreplayertemp;
endmodule
