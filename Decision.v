`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Decision(Out_wr,Correct_guess,Clock,Result);
	input Clock;
	input[1:0]Correct_guess,Out_wr;
	output[1:0]Result;
	reg [1:0]internal_result=2'b00;

	
	always@(posedge Clock)begin
		if(Correct_guess==2'b01)begin
			internal_result<=2'b01;
		end
		else if(Correct_guess==2'b10)begin
			internal_result<=2'b10;
		end
		else if(Correct_guess==2'b11)begin
			internal_result<=2'b11;
		end
		else begin
			internal_result<=2'bz;
			if(Out_wr==2'b01)
				internal_result<=Out_wr;
			else if(Out_wr==2'b10)
				internal_result<=Out_wr;
			else if(Out_wr==2'b11)
				internal_result<=Out_wr;
		end
	end

	assign Result=internal_result;

endmodule
