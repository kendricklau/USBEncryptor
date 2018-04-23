// $Id: $
// File name:   sb3.sv
// Created:     4/17/2018
// Author:      Jonathan Reitz
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: substitution block 3

module sb3
(
	input wire [5:0] sub_in,
	output wire [3:0] sub_out
);
	reg [3:0] sb3f;
	always_comb begin : substitution
		case (sub_in)
			
			6'd0: sb3f = 4'd10;
			6'd1: sb3f = 4'd13;
			6'd2: sb3f = 4'd0;
			6'd3: sb3f = 4'd7;
			6'd4: sb3f = 4'd9;
			6'd5: sb3f = 4'd0;
			6'd6: sb3f = 4'd14;
			6'd7: sb3f = 4'd9;
			6'd8: sb3f = 4'd6;
			6'd9: sb3f = 4'd3;
			6'd10: sb3f = 4'd3;
			6'd11: sb3f = 4'd4;
			6'd12: sb3f = 4'd15;
			6'd13: sb3f = 4'd6;
			6'd14: sb3f = 4'd5;
			6'd15: sb3f = 4'd10;
			6'd16: sb3f = 4'd1;
			6'd17: sb3f = 4'd2;
			6'd18: sb3f = 4'd13;
			6'd19: sb3f = 4'd8;
			6'd20: sb3f = 4'd12;
			6'd21: sb3f = 4'd5;
			6'd22: sb3f = 4'd7;
			6'd23: sb3f = 4'd14;
			6'd24: sb3f = 4'd11;
			6'd25: sb3f = 4'd12;
			6'd26: sb3f = 4'd4;
			6'd27: sb3f = 4'd11;
			6'd28: sb3f = 4'd2;
			6'd29: sb3f = 4'd15;
			6'd30: sb3f = 4'd8;
			6'd31: sb3f = 4'd1;
			6'd32: sb3f = 4'd13;
			6'd33: sb3f = 4'd1;
			6'd34: sb3f = 4'd6;
			6'd35: sb3f = 4'd10;
			6'd36: sb3f = 4'd4;
			6'd37: sb3f = 4'd13; //start here
			6'd38: sb3f = 4'd9;
			6'd39: sb3f = 4'd0;
			6'd40: sb3f = 4'd8;
			6'd41: sb3f = 4'd6;
			6'd42: sb3f = 4'd15;
			6'd43: sb3f = 4'd9;
			6'd44: sb3f = 4'd3;
			6'd45: sb3f = 4'd8;
			6'd46: sb3f = 4'd0;
			6'd47: sb3f = 4'd7;
			6'd48: sb3f = 4'd11;
			6'd49: sb3f = 4'd4;
			6'd50: sb3f = 4'd1;
			6'd51: sb3f = 4'd15;
			6'd52: sb3f = 4'd2;
			6'd53: sb3f = 4'd14;
			6'd54: sb3f = 4'd12;
			6'd55: sb3f = 4'd3;
			6'd56: sb3f = 4'd5;
			6'd57: sb3f = 4'd11;
			6'd58: sb3f = 4'd10;
			6'd59: sb3f = 4'd5;
			6'd60: sb3f = 4'd14;
			6'd61: sb3f = 4'd2;
			6'd62: sb3f = 4'd7;
			6'd63: sb3f = 4'd12;
		endcase
	end

	assign sub_out = sb3f;
endmodule
