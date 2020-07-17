`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Frequency_division(Clock,Reset,Clock_division);
	input Clock,Reset;
	output Clock_division;
	reg [2:0] counter;
	reg result_one_zero;
	
	initial begin
		counter=0;
	end
	
	always@(posedge Clock)begin
		if(!Reset)begin
			if(counter==4)begin
				if(Clock)begin
					result_one_zero<=Clock;
					#10;
					result_one_zero<=~Clock;
					counter<=0;
				end 
				//else begin
				//	result_one_zero<=0;
				//end
			end
			else begin
				counter<=counter+1;
			end
		end
		else begin
			counter<=0;
			result_one_zero<=0;
		end
	end
	
	assign Clock_division=result_one_zero;
	
endmodule
