`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
module Test_Correlation;

	// Inputs
	reg [5:0] First_Num;
	reg [5:0] Second_Num;
	reg [5:0] Target_Num;
	reg Clock;
	reg Reset;
	
	parameter size=6;
	
	// Outputs
	wire [1:0] Correct_guess;
	wire [9:0] Out_cr;
	//wire [size-1:0]num_First_Num,num_Second_Num;
	
	// Instantiate the Unit Under Test (UUT)
	Correlation uut (
		.First_Num(First_Num), 
		.Second_Num(Second_Num), 
		.Target_Num(Target_Num), 
		.Clock(Clock), 
		.Reset(Reset), 
		.Correct_guess(Correct_guess), 
		.Out_cr(Out_cr)
		//.num_First_Num(num_First_Num),
		//.num_Second_Num(num_Second_Num)
	);

	initial begin
		// Initialize Inputs
		First_Num = 0;
		Second_Num = 0;
		Target_Num = 6'b000111;
		Clock = 1;
		Reset = 0;
		forever #10 Clock=~Clock;
   end
	 
	always @(posedge Clock)begin
		$display("%b : %b at Time %t",Correct_guess,Out_cr,$time);
	end
	initial begin
		//Test_1
		First_Num=6'b000_001;//4
		Second_Num=6'b000_000;//3
		#20;
		First_Num=6'b110_011;//3
		Second_Num=6'b001_101;//4
		#20;
		First_Num=6'b001_101;//4
		Second_Num=6'b110_011;//3
		#20;
		First_Num=6'b101010;//2
		Second_Num=6'b010101;//4
		#20;
		First_Num=6'b000110;//5
		Second_Num=6'b000100;//4
		#20;
		//Test_2
		Reset=1;
		#2;
		Reset=0;
		#18;
		First_Num=6'b001_101;
		Second_Num=6'b110_011;
		#20;
		First_Num=6'b101010;
		Second_Num=6'b010101;
		#20;
		First_Num=6'b000110;
		Second_Num=6'b000111;//OK
		#20;
		//Test_3
		Reset=1;
		#2;
		Reset=0;
		#18;
		First_Num=6'b000_000;
		Second_Num=6'b000_000;
		#20;
		First_Num=6'b001_101;
		Second_Num=6'b110_011;
		#20;
		First_Num=6'b001_101;
		Second_Num=6'b110_011;
		#20;
		First_Num=6'b101010;
		Second_Num=6'b010101;
		#20;
		First_Num=6'b000110;
		Second_Num=6'b000111;//OK
		#20;
		Reset=1;
		#2;
		Reset=0;
		#18;
		//Test_4
		First_Num=6'b000_111;//OK
		Second_Num=6'b110_011;
		#20;
		Reset=1;
		#2;
		Reset=0;
		#18;
		//Test_5
		First_Num=6'b001_100;
		Second_Num=6'b110_001;
		#20;	
		First_Num=6'b101_010;
		Second_Num=6'b000_111;//OK
		#20;
		Reset=1;
		#2;
		Reset=0;
		#18;
		//Test_6
		First_Num=6'b110_011;
		Second_Num=6'b001_111;
		#20;
		First_Num=6'b101_011;
		Second_Num=6'b010_101;
		#20;
		First_Num=6'b000_111;//OK
		Second_Num=6'b000_111;//OK
		#20;
		Reset=1;
		#2;
		Reset=0;
		#18;
		//Test_7
		First_Num=6'b000_001;//4
		Second_Num=6'b000_000;//3
		#20;
		First_Num=6'b110_011;//3
		Second_Num=6'b001_101;//4
		#20;
		First_Num=6'b001_101;//4
		Second_Num=6'b110_011;//3
		#20;
		First_Num=6'b101010;//2
		Second_Num=6'b010101;//4
		#20;
		First_Num=6'b000110;//5
		Second_Num=6'b000100;//4
	end
   
	
endmodule

