`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:07:12 06/23/2020
// Design Name:   Decision
// Module Name:   C:/Xilinx/Projects/Game/Test_Decision.v
// Project Name:  Game
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decision
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////



module Test_Decision;

	// Inputs
	reg [1:0] Out_wr;
	reg [1:0] Correct_guess;
	reg Clock;

	// Outputs
	wire [1:0] Result;

	// Instantiate the Unit Under Test (UUT)
	Decision uut (
		.Out_wr(Out_wr), 
		.Correct_guess(Correct_guess), 
		.Clock(Clock), 
		.Result(Result)
	);

	initial begin
		// Initialize Inputs
		Out_wr = 0;
		Correct_guess = 0;
		Clock = 1;
		forever #10 Clock=~Clock;
	end
	always @(posedge Clock)begin
		$display("%b at Time %t",Result,$realtime);
	end
	initial begin
		Correct_guess=2'b01;
		Out_wr=2'b10;
		#20;
		Correct_guess=2'b10;
		Out_wr=2'b01;
		#20;
		Correct_guess=2'b11;
		Out_wr=2'b01;
		#100;
		Correct_guess=2'b00;
		Out_wr=2'b01;
		#100;
		Correct_guess=2'b00;
		Out_wr=2'b10;
		#100;
		Correct_guess=2'b00;
		Out_wr=2'b11;
		#20;
		Correct_guess=2'b00;
		Out_wr=2'b00;
	end
      
endmodule

