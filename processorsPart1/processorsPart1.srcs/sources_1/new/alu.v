`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2022 12:10:33 PM
// Design Name: 
// Module Name: alu
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


module alu(DATA1, DATA2, RESULT, SELECT, ZERO);
    
    //initializing the inputs and outputs
    input [7:0] DATA1;
    input [7:0] DATA2;
    input [2:0] SELECT;
    output [7:0] RESULT;
    output ZERO;
  
    reg [7:0] RESULT;
    reg ZERO; 
    reg [7:0] RshiftResult;

    /*
    Program belleði
    Barrel Shifter
    */
    barrelShifter myRightLogicalShifter(DATA1,DATA2[7:5],RshiftResult);
    
    /*
        ALU
        Veri deðiþimini algýladýðý anda çalýþan blok
    */
    always @ (DATA1,DATA2,SELECT) begin
    
    /*
        Yapýlacak iþlem þeçimi
        000 mov, loadi
        001 add, sub
        010 and
        011 or
        1xx empty (future)
    */
    case (SELECT)
        3'b000:
        #1 RESULT = DATA2; //Forward function
        3'b001:
        #2 RESULT = DATA1 + DATA2; //Add and Sub function
        3'b010:
        #1 RESULT = DATA1 & DATA2; //AND and Sub function
        3'b011:
        #1 RESULT = DATA1 | DATA2; //OR and Sub function
        3'b100:
        RESULT = RshiftResult; 
        3'b101:
        RESULT = 8'b00000000; 
        3'b110:
        RESULT = 8'b00000000; 
        3'b111:
        RESULT = 8'b00000000; 
        endcase 
    end
    
    /*
        beq komutu için 
        tüm sonuçlar 0 ise ZERO = 1 olur
        xor ~| 
    */
    always@ (RESULT) begin
        ZERO = RESULT[0] ~| RESULT[1] ~| RESULT[2] ~| RESULT[3] ~| RESULT[4] ~| RESULT[5] ~| RESULT[6] ~| RESULT[7];
    end
endmodule