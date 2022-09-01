`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 08:06:19 AM
// Design Name: 
// Module Name: jkflipfloptestbench
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


module jkflipfloptestbench();
    reg j;
    reg k;
    reg clk;
    wire q;
    integer i = 0;
    jkflipflop uut(.j(j), .k(k), .clk(clk), .q(q));
    
    initial begin
        //j=0 ve k=1 iken q her zaman 1 çýkýþý verir
        j <= 0; k <= 1; i = 0;
        while(i < 10) begin
            clk = i; #1;
            i = i + 1;
        end
        //j ve k 0 iken q'nun son durumu ne ise ona eþittir, buradaki son durum 
        //baþlangýç deðeri verilmediði için tam ortadadýr. (2.5volt)
        j <= 0; k <= 0; i = 0;
        while(i < 10) begin
             clk = i; #1;
             i = i + 1;
        end
        //j=1 ve k=1 iken q her zaman 0 çýkýþý verir
        j <= 1; k <= 0; i = 0;
        while(i < 10) begin
            clk = i; #1; 
            i = i + 1; 
        end  
        //j ve k 1 durumunda q çýkýþý her saat sinyalinin yükselen kenarýnda 
        //toogle yapacaktýr yani en son hanig biti tutuyorsa tersine çevirecektir
        j <= 1; k <= 1; i = 0;
        while(i < 10) begin
            clk = i; #1;
            i = i + 1;
        end
    end
endmodule
