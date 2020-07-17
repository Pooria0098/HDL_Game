`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:48:13 06/22/2020
// Design Name:   Winner
// Module Name:   C:/Xilinx/Projects/Game/Test_Winner.v
// Project Name:  Game
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Winner
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Winner;

	// Inputs
	reg [9:0] Out_cr;
	reg Clock;

	// Outputs
	wire [1:0] Out_wr;
	wire [3:0] counter_first;
	wire [3:0] counter_second;
	
	// Instantiate the Unit Under Test (UUT)
	Winner uut (
		.Out_cr(Out_cr), 
		.Out_wr(Out_wr), 
		.Clock(Clock),
		.counter_first(counter_first),
		.counter_second(counter_second)
	);

	initial begin
		// Initialize Inputs
		Out_cr = 0;
		Clock = 1;
		forever #50 Clock=~Clock;
    end
	
	always @(posedge Clock)begin
		$display("%b : %b at Time %t",Out_cr,Out_wr,$time);
	end
	
	initial begin
		Out_cr=10'b10011_00110;//10
		#100;
		Out_cr=10'b10011_00111;//11
		#100;
		Out_cr=10'b10011_00101;//01
		#100;
	end
      
endmodule

