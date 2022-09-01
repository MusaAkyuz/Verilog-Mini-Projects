`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2022 12:43:04 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET) ;
 
    //initializing inputs
    input [2:0] INADDRESS;
    input [2:0] OUT1ADDRESS;
    input [2:0] OUT2ADDRESS;
    input WRITE;
    input CLK;
    input RESET;
    input [7:0] IN;
    
    //initializing outputs
    output [7:0] OUT1;
    output [7:0] OUT2;
     
    //initializing register variables
    integer i;
     
    //creating the register array
    reg [7:0] regFile [0:7];
     
    //resetting the registers if the reset is 1 as a level triggered input
    always@ (*) begin
        if (RESET == 1) begin 
            #2
            for (i = 0; i < 8; i = i + 1) begin
                regFile [i] = 8'b00000000 ; 
            end 
        end 
    end
    
    /*
        this always block runs of the positive edge of the clock and write to the register if write is ennable
        load ve mov komutlarý için registera veri yüklerken kullanýlýr
    */
    always@ (posedge CLK) begin 
        if(WRITE == 1'b1 && RESET == 1'b0) begin
            #2 
            regFile [INADDRESS] = IN; //this includes the write reg delay
            //$monitor($time," %b",regFile [INADDRESS]);
        end 
    end
    
    /*
        this is for reading the inputs from the registers
        registerlardan veri okumak için
    */
    assign #2 OUT1 = regFile[OUT1ADDRESS];
    assign #2 OUT2 = regFile[OUT2ADDRESS];
endmodule
