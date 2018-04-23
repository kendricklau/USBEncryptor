// $Id: $
// File name:   sb4.sv
// Created:     4/17/2018
// Author:      Jonathan Reitz
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: substitution block 4

module sb4
(
	input wire [5:0] sub_in,
	output wire [3:0] sub_out
);
	reg [3:0] sb4f;
	always_comb begin : substitution
		case (sub_in)
			
			6'd0: sb4f = 4'd7;
			6'd1: sb4f = 4'd13;
			6'd2: sb4f = 4'd13;
			6'd3: sb4f = 4'd8;
			6'd4: sb4f = 4'd14;
			6'd5: sb4f = 4'd11;
			6'd6: sb4f = 4'd3;
			6'd7: sb4f = 4'd5;
			6'd8: sb4f = 4'd0;
			6'd9: sb4f = 4'd6;
			6'd10: sb4f = 4'd6;
			6'd11: sb4f = 4'd15;
			6'd12: sb4f = 4'd9;
			6'd13: sb4f = 4'd0;
			6'd14: sb4f = 4'd10;
			6'd15: sb4f = 4'd3;
			6'd16: sb4f = 4'd1;
			6'd17: sb4f = 4'd4;
			6'd18: sb4f = 4'd2;
			6'd19: sb4f = 4'd7;
			6'd20: sb4f = 4'd8;
			6'd21: sb4f = 4'd2;
			6'd22: sb4f = 4'd5;
			6'd23: sb4f = 4'd12;
			6'd24: sb4f = 4'd11;
			6'd25: sb4f = 4'd1;
			6'd26: sb4f = 4'd12;
			6'd27: sb4f = 4'd10;
			6'd28: sb4f = 4'd4;
			6'd29: sb4f = 4'd14;
			6'd30: sb4f = 4'd15;
			6'd31: sb4f = 4'd9;
			6'd32: sb4f = 4'd10;
			6'd33: sb4f = 4'd3;
			6'd34: sb4f = 4'd6;
			6'd35: sb4f = 4'd15;
			6'd36: sb4f = 4'd9;
			6'd37: sb4f = 4'd0;
			6'd38: sb4f = 4'd0;
			6'd39: sb4f = 4'd6;
			6'd40: sb4f = 4'd12;
			6'd41: sb4f = 4'd10;
			6'd42: sb4f = 4'd11;
			6'd43: sb4f = 4'd1;
			6'd44: sb4f = 4'd7;
			6'd45: sb4f = 4'd13;
			6'd46: sb4f = 4'd13;
			6'd47: sb4f = 4'd8;
			6'd48: sb4f = 4'd15;
			6'd49: sb4f = 4'd9;
			6'd50: sb4f = 4'd1;
			6'd51: sb4f = 4'd4;
			6'd52: sb4f = 4'd3;
			6'd53: sb4f = 4'd5;
			6'd54: sb4f = 4'd14;
			6'd55: sb4f = 4'd11;
			6'd56: sb4f = 4'd5;
			6'd57: sb4f = 4'd12;
			6'd58: sb4f = 4'd2;
			6'd59: sb4f = 4'd7;
			6'd60: sb4f = 4'd8;
			6'd61: sb4f = 4'd2;
			6'd62: sb4f = 4'd4;
			6'd63: sb4f = 4'd14;
		endcase
	end

	assign sub_out = sb4f;
endmodule
