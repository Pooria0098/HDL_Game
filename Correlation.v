`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Correlation(First_Num,Second_Num,Target_Num,
	Clock,Reset,Correct_guess,Out_cr);
	
	parameter size=6;
	input[size-1:0]First_Num,Second_Num,Target_Num;
	input Clock,Reset;//clk=20ns
	output reg[1:0]Correct_guess;//01-10-11
	output reg[9:0]Out_cr;
	
	wire[size-1:0]num_First_Num,num_Second_Num;
	
	assign num_First_Num = calculate_correlation(First_Num,Target_Num);
	assign num_Second_Num = calculate_correlation(Second_Num,Target_Num);
	
	integer i;
	
	initial begin
		i=0;
		Out_cr=10'b000_000_0000;
		Correct_guess=2'b00;
	end
	
	always @(posedge Clock)begin
		Out_cr[i]<=1'b0;
		Out_cr[i+1]<=1'b0;
		if(!Reset)begin
			//num_First_Num<=calculate_correlation(First_Num,Target_Num);
			//num_Second_Num<=calculate_correlation(Second_Num,Target_Num);
			
			if(num_Second_Num>num_First_Num)begin
				Out_cr[i]<=1'b0;
				Out_cr[i+1]<=1'b1;
			end
			else if(num_Second_Num<num_First_Num)begin
				Out_cr[i]<=1'b1;
				Out_cr[i+1]<=1'b0;
			end
			else begin
				Out_cr[i]<=1'b1;
				Out_cr[i+1]<=1'b1;
			end
			
			if(num_Second_Num==size & num_First_Num==size )
				Correct_guess<=2'b11;
			else if(num_First_Num==size)
				Correct_guess<=2'b01;
			else if(num_Second_Num==size)
				Correct_guess<=2'b10;
			else
				Correct_guess<=2'b00;
			i<=i+2;
		end
		else begin
			Out_cr<=10'b000_000_0000;
			Correct_guess<=2'b00;
			i<=0;
			//num_First_Num<=0;
			//num_Second_Num<=0;
		end
	end
	
	function [size-1:0] calculate_correlation;
		reg [size-1:0]counter;
		reg[size-1:0]cal_xor;
		input[size-1:0] XOR_inputNum,XOR_targetNum; 
		integer i;
		begin
			counter=0;
			for(i=0;i<size;i=i+1)begin
				cal_xor[i]=XOR_inputNum[i]^XOR_targetNum[i];
				if(cal_xor[i]==1'b0)
					counter=counter+1;
			end	
			calculate_correlation=counter;
		end
	endfunction

endmodule
