// $Id: $
// File name:   sb1.sv
// Created:     4/17/2018
// Author:      Jonathan Reitz
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: substitution block 1

module sb1();
function [3:0] sb1f;
	input [5:0] sub_in;
		case (sub_in)
			
			6'd0: sb1f = 4'd14;
			6'd1: sb1f = 4'd0;
			6'd2: sb1f = 4'd4;
			6'd3: sb1f = 4'd15;
			6'd4: sb1f = 4'd13;
			6'd5: sb1f = 4'd7;
			6'd6: sb1f = 4'd1;
			6'd7: sb1f = 4'd4;
			6'd8: sb1f = 4'd2;
			6'd9: sb1f = 4'd14;
			6'd10: sb1f = 4'd15;
			6'd11: sb1f = 4'd2;
			6'd12: sb1f = 4'd11;
			6'd13: sb1f = 4'd13;
			6'd14: sb1f = 4'd8;
			6'd15: sb1f = 4'd1;
			6'd16: sb1f = 4'd3;
			6'd17: sb1f = 4'd10;
			6'd18: sb1f = 4'd10;
			6'd19: sb1f = 4'd6;
			6'd20: sb1f = 4'd6;
			6'd21: sb1f = 4'd12;
			6'd22: sb1f = 4'd12;
			6'd23: sb1f = 4'd11;
			6'd24: sb1f = 4'd5;
			6'd25: sb1f = 4'd9;
			6'd26: sb1f = 4'd9;
			6'd27: sb1f = 4'd5;
			6'd28: sb1f = 4'd0;
			6'd29: sb1f = 4'd3;
			6'd30: sb1f = 4'd7;
			6'd31: sb1f = 4'd8;
			6'd32: sb1f = 4'd4;
			6'd33: sb1f = 4'd15;
			6'd34: sb1f = 4'd1;
			6'd35: sb1f = 4'd12;
			6'd36: sb1f = 4'd14;
			6'd37: sb1f = 4'd8;
			6'd38: sb1f = 4'd8;
			6'd39: sb1f = 4'd2;
			6'd40: sb1f = 4'd13;
			6'd41: sb1f = 4'd4;
			6'd42: sb1f = 4'd6;
			6'd43: sb1f = 4'd9;
			6'd44: sb1f = 4'd2;
			6'd45: sb1f = 4'd1;
			6'd46: sb1f = 4'd11;
			6'd47: sb1f = 4'd7;
			6'd48: sb1f = 4'd15;
			6'd49: sb1f = 4'd5;
			6'd50: sb1f = 4'd12;
			6'd51: sb1f = 4'd11;
			6'd52: sb1f = 4'd9;
			6'd53: sb1f = 4'd3;
			6'd54: sb1f = 4'd7;
			6'd55: sb1f = 4'd14;
			6'd56: sb1f = 4'd3;
			6'd57: sb1f = 4'd10;
			6'd58: sb1f = 4'd10;
			6'd59: sb1f = 4'd0;
			6'd60: sb1f = 4'd5;
			6'd61: sb1f = 4'd6;
			6'd62: sb1f = 4'd0;
			6'd63: sb1f = 4'd13;
		endcase
endfunction
endmodule
