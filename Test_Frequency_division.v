`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:13:32 06/22/2020
// Design Name:   Frequency_division
// Module Name:   C:/Xilinx/Projects/Game/Test_Frequency_division.v
// Project Name:  Game
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Frequency_division
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Frequency_division;

	// Inputs
	reg Clock;
	reg Reset;

	// Outputs
	wire Clock_division;

	// Instantiate the Unit Under Test (UUT)
	Frequency_division uut (
		.Clock(Clock), 
		.Reset(Reset), 
		.Clock_division(Clock_division)
	);

	initial begin
		// Initialize Inputs
		Clock = 1;
		Reset = 0;
		#40;
		Reset=1;
		#10;
		Reset=0;
	end
	
	always @(posedge Clock)begin
		$display("%b at Time %t",Clock_division,$time);
	end
	
	initial repeat(50) #10 Clock=~Clock;
      
endmodule

