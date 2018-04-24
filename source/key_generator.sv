// $Id: $
// File name:   key_generator.sv
// Created:     4/12/2018
// Author:      Jonathan Reitz
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Generates the appropriate subkeys
// 


module key_generator
(
	input wire clk,
	input wire n_rst,
	input wire reverse,
	input wire cnt_rollover,
	input wire key_rollover,
	input wire key_enable,
	input wire [4:0] round_count,
	input wire [1:0] key_count,
	output wire [47:0] subkey
);
	//solitary first key, the 2nd and third keys will be generated from the first
	//key
	logic [63:0] key0;	
	logic [63:0] key1;
	logic [63:0] key2;
	logic [63:0] keyOut;
	logic [63:0] keyNext;
	logic [27:0] left;
	logic [27:0] right;
	logic [27:0] nxtleft;
	logic [27:0] nxtright;
	
	function [57:0] perm1;
		input [63:0] inNum;
		begin
			perm1 = {inNum[7],inNum[15],inNum[23],inNum[31],inNum[39],inNum[47],inNum[55],
					inNum[63],inNum[6],inNum[14],inNum[22],inNum[30],inNum[38],inNum[46],
					inNum[54],inNum[62],inNum[5],inNum[13],inNum[21],inNum[29],inNum[37],
					inNum[45],inNum[53],inNum[61],inNum[4],inNum[12],inNum[20],inNum[28],
					inNum[1],inNum[9],inNum[17],inNum[25],inNum[33],inNum[41],inNum[49],
					inNum[57],inNum[2],inNum[10],inNum[18],inNum[26],inNum[34],inNum[42],
					inNum[50],inNum[58],inNum[3],inNum[11],inNum[19],inNum[27],inNum[35],
					inNum[43],inNum[51],inNum[59],inNum[36],inNum[44],inNum[52],inNum[60]};
		end
	endfunction
	
	function [47:0] perm2;
		input [55:0] inNum;
		begin
			perm2 = {inNum[42],inNum[39],inNum[45],inNum[32],inNum[55],inNum[51],
					inNum[53],inNum[28],inNum[41],inNum[50],inNum[35],inNum[46],
					inNum[33],inNum[37],inNum[44],inNum[52],inNum[30],inNum[48],
					inNum[40],inNum[49],inNum[29],inNum[36],inNum[43],inNum[54],
					inNum[15],inNum[4],inNum[25],inNum[19],inNum[9],inNum[1],
					inNum[26],inNum[16],inNum[5],inNum[11],inNum[23],inNum[8],
					inNum[12],inNum[7],inNum[17],inNum[0],inNum[22],inNum[3],
					inNum[10],inNum[14],inNum[6],inNum[20],inNum[27],inNum[24]};
		end
	endfunction

	assign key0 = 64'hCA3A_3E98_9AA7_AE58;
	//generate the 2nd and 3rd keys
	assign key1 = key0 ^ '1 ^ 64'hDE45_AC29_45FE_96E3; //value is 7ae0_04b1_d057_0e72
	assign key2 = key1 ^ 64'hCAF3_385A_438B_D219; //value is b013_3ceb_93dc_dc6b
	
	always_ff @(posedge clk, negedge n_rst)
	begin : keyOutReg
		if(n_rst == 1'b0)
		begin
			if (reverse == 0) begin
				keyOut <= key0;
				{left, right} <= perm1(key0);
			end else begin
				keyOut <= key2;
				{left, right} <= perm1(key2);
			end	
		end else begin
			keyOut <= keyNext;
			left <= nxtleft;
			right <= nxtright;
		end
	end

	always_comb begin : keyNextLogic
		keyNext = keyOut;
		if (reverse == 0) begin
			if (key_count == 0) begin
				keyNext = key0;
			end
			if (key_rollover == 1)
			begin
				keyNext = key0;
			end else if ((key_count == 2'b0) & (cnt_rollover == 1))
			begin
				keyNext = key1;
			end else if ((key_count == 2'b01) & (cnt_rollover == 1))
			begin
				keyNext = key2;
			end
		end else begin
			if (key_count == 0) begin
				keyNext = key2;
			end
			if (key_rollover == 1)
			begin
				keyNext = key2;
			end else if ((key_count == 2'b0) & (cnt_rollover == 1))
			begin
				keyNext = key1;
			end else if ((key_count == 2'b01) & (cnt_rollover == 1))
			begin
				keyNext = key0;
			end
		end
			
	end

	always_comb begin : subkeyNext
		nxtleft = left;
		nxtright = right;
		// if we are decrypting, we need to reverse the subkey order of the function
		if (key_enable == 1) begin
			if (((key_count == 0 || key_count == 2) && reverse == 0) || (key_count == 1 && reverse == 1)) begin	
				nxtleft = {left[25:0],left[27],left[26]}; 
				nxtright = {right[25:0],right[27],right[26]};
				if (round_count == 0)
				begin
					{nxtleft,nxtright} = perm1(keyOut);
				end else if (round_count == 1) begin
					{nxtleft, nxtright} = perm1(keyOut);
					nxtleft = {nxtleft[26:0],nxtleft[27]};
					nxtright = {nxtright[26:0],nxtright[27]};
				
				//end else if (round_count == 1) begin
				//	{nxtleft[26:0],nxtleft[27],nxtright[26:0], nxtright[27]} = perm1(keyOut);
				end else if (round_count == 2 || round_count == 9 || round_count == 16)
				begin
					nxtleft = {left[26:0],left[27]};
					nxtright = {right[26:0],right[27]};
				end
			end else begin
				nxtleft = {left[1], left[0],left[27:2]}; 
				nxtright = {right[1],right[0], right[27:2]};
				if (round_count == 0 || round_count == 1)
				begin
					{nxtleft,nxtright} = perm1(keyOut);
					//nxtleft = {nxtleft[26:0],nxtleft[27]};
					//nxtright = {nxtright[26:0],nxtright[27]};
				end else if (round_count == 2 || round_count == 9 || round_count == 16)
				begin
					nxtleft = {left[0],left[27:1]};
					nxtright = {right[0],right[27:1]};
				end
			end
		end
	end

	assign subkey = perm2({left,right});

endmodule
