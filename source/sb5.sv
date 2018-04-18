// $Id: $
// File name:   sb1.sv
// Created:     4/17/2018
// Author:      Jonathan Reitz
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: substitution block 1

module sb1
(
	input wire [5:0] sub_in,
	output wire [3:0] sub_out
);
	reg [3:0] sub_out_reg;
	always_comb begin : substitution
		case (sub_in)
			
			6'd0: sub_out_reg = 4'd14;
			6'd1: sub_out_reg = 4'd0;
			6'd2: sub_out_reg = 4'd4;
			6'd3: sub_out_reg = 4'd15;
			6'd4: sub_out_reg = 4'd13;
			6'd5: sub_out_reg = 4'd7;
			6'd6: sub_out_reg = 4'd1;
			6'd7: sub_out_reg = 4'd4;
			6'd8: sub_out_reg = 4'd2;
			6'd9: sub_out_reg = 4'd14;
			6'd10: sub_out_reg = 4'd15;
			6'd11: sub_out_reg = 4'd2;
			6'd12: sub_out_reg = 4'd11;
			6'd13: sub_out_reg = 4'd13;
			6'd14: sub_out_reg = 4'd8;
			6'd15: sub_out_reg = 4'd1;
			6'd16: sub_out_reg = 4'd3;
			6'd17: sub_out_reg = 4'd10;
			6'd18: sub_out_reg = 4'd10;
			6'd19: sub_out_reg = 4'd6;
			6'd20: sub_out_reg = 4'd6;
			6'd21: sub_out_reg = 4'd12;
			6'd22: sub_out_reg = 4'd12;
			6'd23: sub_out_reg = 4'd11;
			6'd24: sub_out_reg = 4'd5;
			6'd25: sub_out_reg = 4'd9;
			6'd26: sub_out_reg = 4'd9;
			6'd27: sub_out_reg = 4'd5;
			6'd28: sub_out_reg = 4'd0;
			6'd29: sub_out_reg = 4'd3;
			6'd30: sub_out_reg = 4'd7;
			6'd31: sub_out_reg = 4'd8;
			6'd32: sub_out_reg = 4'd4;
			6'd33: sub_out_reg = 4'd15;
			6'd34: sub_out_reg = 4'd1;
			6'd35: sub_out_reg = 4'd12;
			6'd36: sub_out_reg = 4'd14;
			6'd37: sub_out_reg = 4'd8;
			6'd38: sub_out_reg = 4'd8;
			6'd39: sub_out_reg = 4'd2;
			6'd40: sub_out_reg = 4'd13;
			6'd41: sub_out_reg = 4'd4;
			6'd42: sub_out_reg = 4'd6;
			6'd43: sub_out_reg = 4'd9;
			6'd44: sub_out_reg = 4'd2;
			6'd45: sub_out_reg = 4'd1;
			6'd46: sub_out_reg = 4'd11;
			6'd47: sub_out_reg = 4'd7;
			6'd48: sub_out_reg = 4'd15;
			6'd49: sub_out_reg = 4'd5;
			6'd50: sub_out_reg = 4'd12;
			6'd51: sub_out_reg = 4'd11;
			6'd52: sub_out_reg = 4'd9;
			6'd53: sub_out_reg = 4'd3;
			6'd54: sub_out_reg = 4'd7;
			6'd55: sub_out_reg = 4'd14;
			6'd56: sub_out_reg = 4'd3;
			6'd57: sub_out_reg = 4'd10;
			6'd58: sub_out_reg = 4'd10;
			6'd59: sub_out_reg = 4'd0;
			6'd60: sub_out_reg = 4'd5;
			6'd61: sub_out_reg = 4'd6;
			6'd62: sub_out_reg = 4'd0;
			6'd63: sub_out_reg = 4'd13;
		endcase
	end

	assign sub_out = sub_out_reg;
endmodule
