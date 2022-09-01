`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 08:03:10 AM
// Design Name: 
// Module Name: jkflipflop
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


module jkflipflop(
    input j,
    input k,
    input clk,
    output q
    );
    reg q;
    always @ (posedge clk)
        case ({j, k})
            2'b00 : q <= q; 
            //j = 0, k = 0 iken clk sinyalinin 
            //yükselen kenarýnda durum deðiþmez
            2'b01 : q <= 0;
            //j = 0, k = 1 iken clk sinyalinin
            //yükselen kenarýnda çýkýþ 0 olur
            2'b10 : q <= 1;
            //j = 1, k = 0 iken clk sinyalinin
            //yükselen kenarýnda çýkýþ 1 olur
            2'b11 : q <= ~q;
            //j = 1, k = 1 iken clk sinyalinin
            //yükselen kenarýnda durum NOT'lanýr
        endcase
endmodule


