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
	input wire [4:0] round_count,
	input wire [1:0] key_count,
	output wire [47:0] subkey
);
	//solitary first key, the 2nd and third keys will be generated from the first
	//key
	logic [63:0] key0;	//generate the other keys probably using assign statements
	logic [63:0] key1;
	logic [63:0] key2;
	logic [63:0] keyOut;
	logic [63:0] keyNext;
	logic [27:0] left;
	logic [27:0] right;
	logic [27:0] nxtleft;
	logic [27:0] nxtright;
	logic [63:0] keyOutR;
	
	function [57:0] perm1;
		input [63:0] inNum;
		begin
			perm1 = {inNum[56],inNum[48],inNum[40],inNum[32],inNum[24],inNum[16],inNum[8],
					inNum[0],inNum[57],inNum[49],inNum[41],inNum[33],inNum[25],inNum[17],
					inNum[9],inNum[1],inNum[58],inNum[50],inNum[42],inNum[34],inNum[26],
					inNum[18],inNum[10],inNum[2],inNum[59],inNum[51],inNum[43],inNum[35],
					inNum[62],inNum[54],inNum[46],inNum[38],inNum[30],inNum[22],inNum[14],
					inNum[6],inNum[61],inNum[53],inNum[45],inNum[37],inNum[29],inNum[21],
					inNum[13],inNum[5],inNum[60],inNum[52],inNum[44],inNum[36],inNum[28],
					inNum[20],inNum[12],inNum[4],inNum[27],inNum[19],inNum[20],inNum[3]};
		end
	endfunction
	
	function [47:0] perm2;
		input [55:0] inNum;
		begin
			perm2 = {inNum[13],inNum[16],inNum[10],inNum[23],inNum[0],inNum[4],
					inNum[2],inNum[27],inNum[14],inNum[5],inNum[20],inNum[9],
					inNum[22],inNum[18],inNum[11],inNum[3],inNum[25],inNum[7],
					inNum[15],inNum[6],inNum[26],inNum[19],inNum[12],inNum[1],
					inNum[40],inNum[51],inNum[30],inNum[36],inNum[46],inNum[54],
					inNum[29],inNum[39],inNum[50],inNum[44],inNum[32],inNum[47],
					inNum[43],inNum[48],inNum[38],inNum[55],inNum[33],inNum[52],
					inNum[45],inNum[41],inNum[49],inNum[35],inNum[28],inNum[31]};
		end
	endfunction

	function [63:0] rev;
		input [63:0] inKey;
		begin
			logic [6:0] i;
			for (i = 0; i < 64; i = i+1)
				rev[i] <= inKey[63-i];
		end
	endfunction

	assign key0 = 64'hCA3A_3E98_9AA7_AE58;
	//generate the 2nd and 3rd keys
	assign key1 = key0 ^ '1 ^ 64'hDE45_AC29_45FE_96E3; //value is EB80_6D4E_20A6_C744
	assign rkey1 = rev(key1);
	assign key2 = key1 ^ 64'hCAF3_385A_438B_D219; //value is 2173_5514_632D_155D
	
	always_ff @(posedge clk, negedge n_rst)
	begin : keyOutReg
		if(n_rst == 1'b0)
		begin
			keyOut <= key0;
			keyOutR <= rev(key0);
			{left, right} <= perm1(key0);
		end else begin
			keyOut <= keyNext;
			keyOutR <= rev(keyNext);
			left <= nxtleft;
			right <= nxtright;
		end
	end

	always_comb begin : keyNextLogic
		keyNext = keyOut;
		if (key_rollover == 1)
		begin
			keyNext = key0;
		end else if ((key_count == 2'b0) & (cnt_rollover == 1))
		begin
			keyNext = rkey1;
		end else if ((key_count == 2'b01) & (cnt_rollover == 1))
		begin
			keyNext = key2;
		end
	end

	always_comb begin : subkeyNext
		nxtleft = {left[25:0],left[27:26]};
		nxtright = {right[25:0],right[27:26]};
		if (round_count == 0)
		begin
			{nxtleft,nxtright} = perm1(keyOut);
			if (reverse == 1)
			begin
				{nxtleft, nxtright} = perm1(keyOutR); //decryption
			end
		end else if (round_count == 1 || round_count == 2 || round_count == 9 || round_count == 16)
		begin
			nxtleft = {left[26:0],left[27]};
			nxtright = {right[26:0],right[27]};
		end
	end

	assign subkey = perm2({left,right});

endmodule
