`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2022 12:32:36 AM
// Design Name: 
// Module Name: fulladder32bit
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


module fulladder32bit(
input [31:0] x,
    input [31:0] y,
    output reg [31:0] sum
    );
//    wire xy0, xy1, xy2, xy3, xy4, xy5, xy6, xy7, xy8, xy9, xy10, xy11,
//    xy12, xy13, xy14, xy15, xy16, xy17, xy18, xy19, xy20, xy21, xy22,
//    xy23, xy24, xy25, xy27, xy28, xy29, xy30, xy31;
//    wire xc0, xc1, xc2, xc3, xc4, xc5, xc6, xc7, xc8, xc9, xc10, xc11, 
//    xc12, xc13, xc14, xc15, xc16, xc17, xc18, xc19, xc20, xc21, xc22, 
//    xc23, xc24, xc25, xc27, xc28, xc29, xc30, xc31;
//    wire yc0, yc1, yc2, yc3, yc4, yc5, yc6, yc7, yc8, yc9, yc10, yc11, 
//    yc12, yc13, yc14, yc15, yc16, yc17, yc18, yc19, yc20, yc21, yc22, 
//    yc23, yc24, yc25, yc27, yc28, yc29, yc30, yc31;
    integer i = 0;
    reg cin;
    reg cout;
//    reg [31:0] summ;
//    reg [31:0] xx;
//    reg [31:0] yy;
//    initial begin
//        and(xy0, x[0], y[0]); and(xy1, x[1], y[1]); and(xy2, x[2], y[2]); and(xy3, x[3], y[3]);
////        and(xy0, x[0], y[0]);and(xy0, x[0], y[0]);and(xy0, x[0], y[0]);and(xy0, x[0], y[0]);
////        and(xy0, x[0], y[0]);and(xy0, x[0], y[0]);and(xy0, x[0], y[0]);and(xy0, x[0], y[0]);
////        and(xy0, x[0], y[0]);and(xy0, x[0], y[0]);and(xy0, x[0], y[0]);and(xy0, x[0], y[0]);
        
//    end
        
    initial begin
        sum[0] = x[0] ^ y[0] ^ 0;
        cout = (x[0] & y[0]);
        cin = cout;
        i = 1;
        while (i < 32) begin
            sum[i] = x[i] ^ y[i] ^ cin;
            cout = (x[i] & y[i]) | (x[i] & cin) | (y[i] & cin);
            cin = cout;
            i = i + 1;
        end
        #10;
    end

endmodule
