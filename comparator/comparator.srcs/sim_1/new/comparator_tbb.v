`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2022 10:24:32 AM
// Design Name: 
// Module Name: comparator_tbb
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


module comparator_tbb;
// Inputs
    reg clk;
    reg clk2;
	reg x;
	reg y;
// Outputs
	wire z;
	wire zz;
// Instantiate the Unit Under Test (UUT)
	comparator uut (
	   .clk(clk),
	   .clk2(clk2),
		.x(x), 
		.y(y), 
		.z(z),
		.zz(zz)
	);
 
	initial begin
// Initialize Inputs
    x = 0; y = 0;
    #20;
    clk = 1;
    #20;
    x = 1
end 
 
initial begin
$monitor("x=%d,y=%d,z=%d \n",deneme,y,z);
end
 

endmodule
