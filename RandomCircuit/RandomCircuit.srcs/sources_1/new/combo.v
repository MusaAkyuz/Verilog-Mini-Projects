`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 07:12:52 AM
// Design Name: 
// Module Name: combo
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


module combo(
    input a,
    input b,
    input c,
    input d,
    output reg o  //bu kýsýmdaki hatayý açýklayabilir misiniz? neden register olmak zorunda
                  //prosedurel asignment ne demek
    );
    always @ (a or b or c or d) begin
        o <= ~((a & b) | (c ^ d));
        //prosedurel assignment to a non-register o is not permitted
        //left hand side register/integer/time/genvar
    end
endmodule
