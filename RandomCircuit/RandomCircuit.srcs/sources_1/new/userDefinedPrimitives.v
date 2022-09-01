`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2022 09:45:33 AM
// Design Name: 
// Module Name: userDefinedPrimitives
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


module userDefinedPrimitives(
    input x,
    input y,
    output z
    );
    compare c0(z, x, y);
endmodule

//primitive fonksiyonunu nerede tanýmlamalýyýz?
//primitive not supported hatasý
//implement etmeye çalýþýrken

primitive compare(out, in1, in2);
    output out;
    input in1, in2;

    table
    0 0 : 1;
    0 1 : 0;
    1 0 : 0;
    1 1 : 1;
    endtable
    
endprimitive