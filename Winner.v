`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Winner(Out_cr,Out_wr,Clock);
	input[9:0]Out_cr;
	input Clock;
	output reg[1:0]Out_wr;//01-10-11
	
	reg [3:0]counter_first;
	reg [3:0]counter_second;
	
	initial begin
		counter_first=2'b00;
		counter_second=2'b00;
		Out_wr=2'b00;
	end
	
	integer i;
	always@(posedge Clock)begin
		counter_first=0;
		counter_second=0;
		
		for(i=0;i<9;i=i+1)begin
			if(Out_cr[i]==1)
				counter_first=counter_first+1;
			i=i+1;	
			if(Out_cr[i]==1)
				counter_second=counter_second+1;
		end
		
		if(counter_first>counter_second)
			Out_wr=2'b01;
		else if(counter_first<counter_second)
			Out_wr=2'b10;
		else
			Out_wr=2'b11;
	end
endmodule
