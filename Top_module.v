`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Top_module(First_Num,Second_Num,Target_Num,
	Clock,Reset,Result);
	parameter size=6;
	input[size-1:0]First_Num,Second_Num,Target_Num;
	input Clock,Reset;//clk=20ns
	output[1:0]Result;//10-01-11
	
	// Internal Variables
	wire [1:0]Correct_guess;
	wire [9:0]Out_cr;
	wire Clock_division;
	wire [1:0]Out_wr;
	
	// Instantiate the Unit Under Test (UUT)
	Correlation uut_correlation (
		.First_Num(First_Num), 
		.Second_Num(Second_Num), 
		.Target_Num(Target_Num), 
		.Clock(Clock), 
		.Reset(Reset), 
		.Correct_guess(Correct_guess), 
		.Out_cr(Out_cr)
	);
	Frequency_division uut_frequency_division (
		.Clock(Clock), 
		.Reset(Reset), 
		.Clock_division(Clock_division)
	);
	Winner uut_winer (
		.Out_cr(Out_cr), 
		.Out_wr(Out_wr), 
		.Clock(Clock_division)
	);
	Decision uut_decision (
		.Out_wr(Out_wr), 
		.Correct_guess(Correct_guess), 
		.Clock(Clock), 
		.Result(Result)
	);
	
endmodule
