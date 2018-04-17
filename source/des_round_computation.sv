// $Id: $
// File name:   des_round_computations
// Created:     4/12/2018
// Author:      Jonathan Reitz
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Des round Computation block
// 


module des_round_computations
(
	input wire clk,
	input wire n_rst,
	input wire des_start, //coming from the des controller
	input wire [4:0] round_count,
	input wire [1:0] key_count,
	input wire [63:0] des_in,
	input wire [47:0] subkey,
	output wire [63:0] des_curr
);

	function [47:0] expand;
		input [31:0] rightIn;
		begin
			expand = {rightIn[31],rightIn[0],rightIn[1],rightIn[2],rightIn[3],rightIn[4],
					  rightIn[3],rightIn[4],rightIn[5],rightIn[6],rightIn[7],rightIn[8],
					  rightIn[7],rightIn[8],rightIn[9],rightIn[10],rightIn[11],rightIn[12],
					  rightIn[11],rightIn[12],rightIn[13],rightIn[14],rightIn[15],rightIn[16],
					  rightIn[15],rightIn[16],rightIn[17],rightIn[18],rightIn[19],rightIn[20],
					  rightIn[19],rightIn[20],rightIn[21],rightIn[22],rightIn[23],rightIn[24],
					  rightIn[23],rightIn[24],rightIn[25],rightIn[26],rightIn[27],rightIn[28],
					  rightIn[27],rightIn[28],rightIn[29],rightIn[30],rightIn[31],rightIn[0]};
		end
	endfunction

	function [31:0] perm;
		input [31:0] subOut;
		begin
			perm = {subOut[15],subOut[6],subOut[19],subOut[20],subOut[28],subOut[11],subOut[27],subOut[16],
					subOut[0],subOut[14],subOut[22],subOut[25],subOut[4],subOut[17],subOut[30],subOut[9],
					subOut[1],subOut[7],subOut[23],subOut[13],subOut[31],subOut[26],subOut[2],subOut[8],
					subOut[18],subOut[12],subOut[29],subOut[5],subOut[21],subOut[10],subOut[3],subOut[24]};
		end
	endfunction

	logic [32:0] left, right, nxtLeft, nxtRight;
	logic [47:0] expandRight;
	
	assign des_curr = {left,right};

	always_ff @(posedge clk, negedge n_rst)
	begin : desCurrState
		if (n_rst == 0)
		begin
			{left, right} <= 0;
		end
		else begin
			left <= nxtLeft;
			right <= nxtRight;
		end
	end

	always_comb begin : DesCurrNext
		if (des_start == 1) //one clock cycle long, will require an extra state on the controller
		begin
			{nxtLeft, nxtRight} = des_in;
		end else begin
			nxtLeft = right;
			nxtRight = right;
			expandRight = expand(nxtRight);
			expandRight = expandRight ^ subkey;
			//nxtRight = substitution output(expandRight)
			nxtRight = perm(nxtRight);
			nxtRight = left ^ nxtRight;
		end
	end
		




	
endmodule
