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
        Bilgisauarý baþtan baþlatmak için kullanýlýr
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
        Saatin yükselen kenarýnda
        program counter alýnýr ve devam eder
    */
    always@ (posedge CLK) begin
        #1
        PC = PCRESULT;
    end
    
    /*
        Komutlar deðiþtikçe blok çalýþýr
        24 - 31. bitleri arasýndaki opcode a göre iþlem yapýlýr
    */
    always @ (INSTRUCTION) begin
    
        // taking the opcode from the instruction
        OPCODE = INSTRUCTION[31:24];
        #1
                
        /*
            Opcode çözülür
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
        Komutlar deðiþtikçe blok çalýþýr
        Gelen komut parçalara ayrýlýr
        0-7 arasý anlýk deðer
        0-2 arasý source2 address
        8-10 arasý source1 address
        16-18 arasý destination adress
    */
    always@ (INSTRUCTION) begin
        DESTINATION  = INSTRUCTION[18:16];
        SOURCE1   = INSTRUCTION[10:8];
        SOURCE2 = INSTRUCTION[2:0];
        immediateVal =INSTRUCTION[7:0];
    end
    
    /*
        Sub komutu için
        çýkarma iþlemi için ikinci tümleyeni alma modülü
    */
    twosCompliment mytwo(OUT2,minusVal);
    
    /*
        Toplama veya çýkarma iþleminin sonucunu seçmek için mux
    */
    mux2_1 mymux1(OUT2,minusVal,isAdd,mux1out);
     
    /*
     anlýk deðer yada register seçmek için mux
    */
    mux2_1 mymux2(immediateVal,mux1out,isImediate,mux2out);
     
    //allu module
    alu myalu(OUT1,mux2out,ALURESULT,aluOp);
    
    always@ (ALURESULT) begin
        IN = ALURESULT;  //setting the reg input with the alu result
    end
endmodule
