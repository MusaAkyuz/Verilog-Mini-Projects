`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 10:20:10 AM
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
    input girissensor,
    input bariyersensor,
    output kirmiziled,
    output yesilled,
    output bariyer,
    output [4:0] aracsayisi
    );
    //baþlangýç deðerleri
    reg [4:0] aracsayisitemp = 2'b00000;
    reg bariyertemp = 0;
    reg yesilledtemp = 1;
    reg kirmiziledtemp = 0;
    
    //giriþ yapan araç sayýsýný veren kodlar
    always @ (posedge girissensor) begin
        aracsayisitemp = aracsayisitemp + 1;
        //bariyeri 20 nanosaniye açýk tutma
        bariyertemp = 1;
        #20;
        if (girissensor == 1 & bariyersensor == 1) begin
            #10;  //fazladan 10 nanosaniye verilir
        end
        bariyertemp = 0;
        if(aracsayisitemp >= 20) begin
           yesilledtemp = 0;
           kirmiziledtemp = 1;
        end 
    end
    
    assign aracsayisi = aracsayisitemp;
    assign bariyer = bariyertemp;
    assign yesilled = yesilledtemp;
    assign kirmiziled = kirmiziledtemp;
endmodule
