`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2022 12:55:00 PM
// Design Name: 
// Module Name: cpu
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


module cpu(PC,INSTRUCTION,CLK,RESET);
    
    input [31:0] INSTRUCTION;
    input CLK;
    input RESET;
    
    output [31:0] PC;
    
    reg [31:0] PC;
    wire [31:0] PCRESULT;
    reg writeEnable;
    reg isAdd;
    reg isImediate;
    reg [2:0] aluOp;
    reg [2:0] regRead1Addres;
    reg [2:0] regRead2Addres;
    reg [2:0] writeRegAddres;
    reg [7:0] immediateVal;
    wire [7:0] mux1out;
    wire [7:0] mux2out;
    wire [7:0] ALURESULT;
    wire [7:0] minusVal;
    reg [7:0] IN;
    wire [7:0] OUT1;
    wire [7:0] OUT2;
    reg [7:0] OPCODE; 
    reg [2:0] DESTINATION;  
    reg [2:0] SOURCE1; 
    reg [2:0] SOURCE2;
    
    /*
        Bilgisauar� ba�tan ba�latmak i�in kullan�l�r
    */
    always@ (RESET) begin
        if (RESET ==1) begin
            PC =-4;
        end
    end
    
    /*
        Program counter +4 +4 +4 +4
    */
    adder myadder(PC,PCRESULT);
    
    /*
        Saatin y�kselen kenar�nda
        program counter al�n�r ve devam eder
    */
    always@ (posedge CLK) begin
        #1
        PC = PCRESULT;
    end
    
    /*
        Komutlar de�i�tik�e blok �al���r
        24 - 31. bitleri aras�ndaki opcode a g�re i�lem yap�l�r
    */
    always @ (INSTRUCTION) begin
    
        // taking the opcode from the instruction
        OPCODE = INSTRUCTION[31:24];
        #1
                
        /*
            Opcode ��z�l�r
        */
        case (OPCODE)
            8'b00000000:
            begin
                writeEnable = 1'b1;
                aluOp = 3'b000;
                isAdd = 1'b1;
                isImediate = 1'b1;
            end
            
            8'b00000001:
            begin
                writeEnable = 1'b1;  
                aluOp = 3'b000;
                isAdd = 1'b1;
                isImediate = 1'b0;
            end
            
            8'b00000010:
            begin
                writeEnable = 1'b1;
                aluOp = 3'b001;
                isAdd = 1'b1;
                isImediate = 1'b0;
            end
            
            8'b00000011:
            begin
                writeEnable = 1'b1;
                aluOp = 3'b001;
                isAdd = 1'b0;
                isImediate = 1'b0;
            end
            
            8'b00000100:
            begin
                writeEnable = 1'b1;
                aluOp = 3'b010;
                isAdd = 1'b1;
                isImediate = 1'b0; 
            end
            
            8'b00000101:
            begin
                writeEnable = 1'b1;
                aluOp = 3'b011;
                isAdd  =1'b1;
                isImediate = 1'b0; 
            end     
        endcase        
    end
    
    //including the register file
    reg_file myReg(IN,OUT1,OUT2,DESTINATION,SOURCE1,SOURCE2,writeEnable,CLK,RESET);
    
    /*
        Komutlar de�i�tik�e blok �al���r
        Gelen komut par�alara ayr�l�r
        0-7 aras� anl�k de�er
        0-2 aras� source2 address
        8-10 aras� source1 address
        16-18 aras� destination adress
    */
    always@ (INSTRUCTION) begin
        DESTINATION  = INSTRUCTION[18:16];
        SOURCE1   = INSTRUCTION[10:8];
        SOURCE2 = INSTRUCTION[2:0];
        immediateVal =INSTRUCTION[7:0];
    end
    
    /*
        Sub komutu i�in
        ��karma i�lemi i�in ikinci t�mleyeni alma mod�l�
    */
    twosCompliment mytwo(OUT2,minusVal);
    
    /*
        Toplama veya ��karma i�leminin sonucunu se�mek i�in mux
    */
    mux2_1 mymux1(OUT2,minusVal,isAdd,mux1out);
     
    /*
     anl�k de�er yada register se�mek i�in mux
    */
    mux2_1 mymux2(immediateVal,mux1out,isImediate,mux2out);
     
    //allu module
    alu myalu(OUT1,mux2out,ALURESULT,aluOp);
    
    always@ (ALURESULT) begin
        IN = ALURESULT;  //setting the reg input with the alu result
    end
endmodule
