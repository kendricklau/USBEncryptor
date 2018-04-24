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
	input wire des_enable,
	input wire [63:0] des_in,
	input wire [47:0] subkey,
	output wire [63:0] des_curr
);
	function [3:0] sb1f;
		input [5:0] sub_in;
		begin
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
		end
	endfunction

	function [3:0] sb2f;
	input [5:0] sub_in;
	begin
		case (sub_in)
			
			6'd0: sb2f = 4'd15;
			6'd1: sb2f = 4'd3;
			6'd2: sb2f = 4'd1;
			6'd3: sb2f = 4'd13;
			6'd4: sb2f = 4'd8;
			6'd5: sb2f = 4'd4;
			6'd6: sb2f = 4'd14;
			6'd7: sb2f = 4'd7;
			6'd8: sb2f = 4'd6;
			6'd9: sb2f = 4'd15;
			6'd10: sb2f = 4'd11;
			6'd11: sb2f = 4'd2;
			6'd12: sb2f = 4'd3;
			6'd13: sb2f = 4'd8;
			6'd14: sb2f = 4'd4;
			6'd15: sb2f = 4'd14;
			6'd16: sb2f = 4'd9;
			6'd17: sb2f = 4'd12;
			6'd18: sb2f = 4'd7;
			6'd19: sb2f = 4'd0;
			6'd20: sb2f = 4'd2;
			6'd21: sb2f = 4'd1;
			6'd22: sb2f = 4'd13;
			6'd23: sb2f = 4'd10;
			6'd24: sb2f = 4'd12;
			6'd25: sb2f = 4'd6;
			6'd26: sb2f = 4'd0;
			6'd27: sb2f = 4'd9;
			6'd28: sb2f = 4'd5;
			6'd29: sb2f = 4'd11;
			6'd30: sb2f = 4'd10;
			6'd31: sb2f = 4'd5;
			6'd32: sb2f = 4'd0;
			6'd33: sb2f = 4'd13;
			6'd34: sb2f = 4'd14;
			6'd35: sb2f = 4'd8;
			6'd36: sb2f = 4'd7;
			6'd37: sb2f = 4'd10;
			6'd38: sb2f = 4'd11;
			6'd39: sb2f = 4'd1;
			6'd40: sb2f = 4'd10;
			6'd41: sb2f = 4'd3;
			6'd42: sb2f = 4'd4;
			6'd43: sb2f = 4'd15;
			6'd44: sb2f = 4'd13;
			6'd45: sb2f = 4'd4;
			6'd46: sb2f = 4'd1;
			6'd47: sb2f = 4'd2;
			6'd48: sb2f = 4'd5;
			6'd49: sb2f = 4'd11;
			6'd50: sb2f = 4'd8;
			6'd51: sb2f = 4'd6;
			6'd52: sb2f = 4'd12;
			6'd53: sb2f = 4'd7;
			6'd54: sb2f = 4'd6;
			6'd55: sb2f = 4'd12;
			6'd56: sb2f = 4'd9;
			6'd57: sb2f = 4'd0;
			6'd58: sb2f = 4'd3;
			6'd59: sb2f = 4'd5;
			6'd60: sb2f = 4'd2;
			6'd61: sb2f = 4'd14;
			6'd62: sb2f = 4'd15;
			6'd63: sb2f = 4'd9;
		endcase
	end
	endfunction
	
	function [3:0] sb3f;
	input [5:0] sub_in;
	begin
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
			6'd37: sb3f = 4'd13;
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
	endfunction
	
	function [3:0] sb4f;
	input [5:0] sub_in;
	begin
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
	endfunction

	
	function [3:0] sb5f;
	input [5:0] sub_in;
	begin
		case (sub_in)
			
			6'd0: sb5f = 4'd2;
			6'd1: sb5f = 4'd14;
			6'd2: sb5f = 4'd12;
			6'd3: sb5f = 4'd11;
			6'd4: sb5f = 4'd4;
			6'd5: sb5f = 4'd2;
			6'd6: sb5f = 4'd1;
			6'd7: sb5f = 4'd12;
			6'd8: sb5f = 4'd7;
			6'd9: sb5f = 4'd4;
			6'd10: sb5f = 4'd10;
			6'd11: sb5f = 4'd7;
			6'd12: sb5f = 4'd11;
			6'd13: sb5f = 4'd13;
			6'd14: sb5f = 4'd6;
			6'd15: sb5f = 4'd1;
			6'd16: sb5f = 4'd8;
			6'd17: sb5f = 4'd5;
			6'd18: sb5f = 4'd5;
			6'd19: sb5f = 4'd0;
			6'd20: sb5f = 4'd3;
			6'd21: sb5f = 4'd15;
			6'd22: sb5f = 4'd15;
			6'd23: sb5f = 4'd10;
			6'd24: sb5f = 4'd13;
			6'd25: sb5f = 4'd3;
			6'd26: sb5f = 4'd0;
			6'd27: sb5f = 4'd9;
			6'd28: sb5f = 4'd14;
			6'd29: sb5f = 4'd8;
			6'd30: sb5f = 4'd9;
			6'd31: sb5f = 4'd6;
			6'd32: sb5f = 4'd4;
			6'd33: sb5f = 4'd11;
			6'd34: sb5f = 4'd2;
			6'd35: sb5f = 4'd8;
			6'd36: sb5f = 4'd1;
			6'd37: sb5f = 4'd12;
			6'd38: sb5f = 4'd11;
			6'd39: sb5f = 4'd7;
			6'd40: sb5f = 4'd10;
			6'd41: sb5f = 4'd1;
			6'd42: sb5f = 4'd13;
			6'd43: sb5f = 4'd14;
			6'd44: sb5f = 4'd7;
			6'd45: sb5f = 4'd2;
			6'd46: sb5f = 4'd8;
			6'd47: sb5f = 4'd13;
			6'd48: sb5f = 4'd15;
			6'd49: sb5f = 4'd6;
			6'd50: sb5f = 4'd9;
			6'd51: sb5f = 4'd15;
			6'd52: sb5f = 4'd12;
			6'd53: sb5f = 4'd0;
			6'd54: sb5f = 4'd5;
			6'd55: sb5f = 4'd9;
			6'd56: sb5f = 4'd6;
			6'd57: sb5f = 4'd10;
			6'd58: sb5f = 4'd3;
			6'd59: sb5f = 4'd4;
			6'd60: sb5f = 4'd0;
			6'd61: sb5f = 4'd5;
			6'd62: sb5f = 4'd14;
			6'd63: sb5f = 4'd3;
		endcase
	end
	endfunction
	
	function [3:0] sb6f;
	input [5:0] sub_in;
	begin
		case (sub_in)
			
			6'd0: sb6f = 4'd12;
			6'd1: sb6f = 4'd10;
			6'd2: sb6f = 4'd1;
			6'd3: sb6f = 4'd15;
			6'd4: sb6f = 4'd10;
			6'd5: sb6f = 4'd4;
			6'd6: sb6f = 4'd15;
			6'd7: sb6f = 4'd2;
			6'd8: sb6f = 4'd9;
			6'd9: sb6f = 4'd7;
			6'd10: sb6f = 4'd2;
			6'd11: sb6f = 4'd12;
			6'd12: sb6f = 4'd6;
			6'd13: sb6f = 4'd9;
			6'd14: sb6f = 4'd8;
			6'd15: sb6f = 4'd5;
			6'd16: sb6f = 4'd0;
			6'd17: sb6f = 4'd6;
			6'd18: sb6f = 4'd13;
			6'd19: sb6f = 4'd1;
			6'd20: sb6f = 4'd3;
			6'd21: sb6f = 4'd13;
			6'd22: sb6f = 4'd4;
			6'd23: sb6f = 4'd14;
			6'd24: sb6f = 4'd14;
			6'd25: sb6f = 4'd0;
			6'd26: sb6f = 4'd7;
			6'd27: sb6f = 4'd11;
			6'd28: sb6f = 4'd5;
			6'd29: sb6f = 4'd3;
			6'd30: sb6f = 4'd11;
			6'd31: sb6f = 4'd8;
			6'd32: sb6f = 4'd9;
			6'd33: sb6f = 4'd4;
			6'd34: sb6f = 4'd14;
			6'd35: sb6f = 4'd3;
			6'd36: sb6f = 4'd15;
			6'd37: sb6f = 4'd2;
			6'd38: sb6f = 4'd5;
			6'd39: sb6f = 4'd12;
			6'd40: sb6f = 4'd2;
			6'd41: sb6f = 4'd9;
			6'd42: sb6f = 4'd8;
			6'd43: sb6f = 4'd5;
			6'd44: sb6f = 4'd12;
			6'd45: sb6f = 4'd15;
			6'd46: sb6f = 4'd3;
			6'd47: sb6f = 4'd10;
			6'd48: sb6f = 4'd7;
			6'd49: sb6f = 4'd11;
			6'd50: sb6f = 4'd0;
			6'd51: sb6f = 4'd14;
			6'd52: sb6f = 4'd4;
			6'd53: sb6f = 4'd1;
			6'd54: sb6f = 4'd10;
			6'd55: sb6f = 4'd7;
			6'd56: sb6f = 4'd1;
			6'd57: sb6f = 4'd6;
			6'd58: sb6f = 4'd13;
			6'd59: sb6f = 4'd0;
			6'd60: sb6f = 4'd11;
			6'd61: sb6f = 4'd8;
			6'd62: sb6f = 4'd6;
			6'd63: sb6f = 4'd13;
		endcase
	end
	endfunction

	function [3:0] sb7f;
	input [5:0] sub_in;
	begin
		case (sub_in)
			
			6'd0: sb7f = 4'd4;
			6'd1: sb7f = 4'd13;
			6'd2: sb7f = 4'd11;
			6'd3: sb7f = 4'd0;
			6'd4: sb7f = 4'd2;
			6'd5: sb7f = 4'd11;
			6'd6: sb7f = 4'd14;
			6'd7: sb7f = 4'd7;
			6'd8: sb7f = 4'd15;
			6'd9: sb7f = 4'd4;
			6'd10: sb7f = 4'd0;
			6'd11: sb7f = 4'd9;
			6'd12: sb7f = 4'd8;
			6'd13: sb7f = 4'd1;
			6'd14: sb7f = 4'd13;
			6'd15: sb7f = 4'd10;
			6'd16: sb7f = 4'd3;
			6'd17: sb7f = 4'd14;
			6'd18: sb7f = 4'd12;
			6'd19: sb7f = 4'd3;
			6'd20: sb7f = 4'd9;
			6'd21: sb7f = 4'd5;
			6'd22: sb7f = 4'd7;
			6'd23: sb7f = 4'd12;
			6'd24: sb7f = 4'd5;
			6'd25: sb7f = 4'd2;
			6'd26: sb7f = 4'd10;
			6'd27: sb7f = 4'd15;
			6'd28: sb7f = 4'd6;
			6'd29: sb7f = 4'd8;
			6'd30: sb7f = 4'd1;
			6'd31: sb7f = 4'd6;
			6'd32: sb7f = 4'd1;
			6'd33: sb7f = 4'd6;
			6'd34: sb7f = 4'd4;
			6'd35: sb7f = 4'd11;
			6'd36: sb7f = 4'd11;
			6'd37: sb7f = 4'd13;
			6'd38: sb7f = 4'd13;
			6'd39: sb7f = 4'd8;
			6'd40: sb7f = 4'd12;
			6'd41: sb7f = 4'd1;
			6'd42: sb7f = 4'd3;
			6'd43: sb7f = 4'd4;
			6'd44: sb7f = 4'd7;
			6'd45: sb7f = 4'd10;
			6'd46: sb7f = 4'd14;
			6'd47: sb7f = 4'd7;
			6'd48: sb7f = 4'd10;
			6'd49: sb7f = 4'd9;
			6'd50: sb7f = 4'd15;
			6'd51: sb7f = 4'd5;
			6'd52: sb7f = 4'd6;
			6'd53: sb7f = 4'd0;
			6'd54: sb7f = 4'd8;
			6'd55: sb7f = 4'd15;
			6'd56: sb7f = 4'd0;
			6'd57: sb7f = 4'd14;
			6'd58: sb7f = 4'd5;
			6'd59: sb7f = 4'd2;
			6'd60: sb7f = 4'd9;
			6'd61: sb7f = 4'd3;
			6'd62: sb7f = 4'd2;
			6'd63: sb7f = 4'd12;
		endcase
	end
	endfunction

	function [3:0] sb8f;
	input [5:0] sub_in;
	begin
		case (sub_in)
			
			6'd0: sb8f = 4'd13;
			6'd1: sb8f = 4'd1;
			6'd2: sb8f = 4'd2;
			6'd3: sb8f = 4'd15;
			6'd4: sb8f = 4'd8;
			6'd5: sb8f = 4'd13;
			6'd6: sb8f = 4'd4;
			6'd7: sb8f = 4'd8;
			6'd8: sb8f = 4'd6;
			6'd9: sb8f = 4'd10;
			6'd10: sb8f = 4'd15;
			6'd11: sb8f = 4'd3;
			6'd12: sb8f = 4'd11;
			6'd13: sb8f = 4'd7;
			6'd14: sb8f = 4'd1;
			6'd15: sb8f = 4'd4;
			6'd16: sb8f = 4'd10;
			6'd17: sb8f = 4'd12;
			6'd18: sb8f = 4'd9;
			6'd19: sb8f = 4'd5;
			6'd20: sb8f = 4'd3;
			6'd21: sb8f = 4'd6;
			6'd22: sb8f = 4'd14;
			6'd23: sb8f = 4'd11;
			6'd24: sb8f = 4'd5;
			6'd25: sb8f = 4'd0;
			6'd26: sb8f = 4'd0;
			6'd27: sb8f = 4'd14;
			6'd28: sb8f = 4'd12;
			6'd29: sb8f = 4'd9;
			6'd30: sb8f = 4'd7;
			6'd31: sb8f = 4'd2;
			6'd32: sb8f = 4'd7;
			6'd33: sb8f = 4'd2;
			6'd34: sb8f = 4'd11;
			6'd35: sb8f = 4'd1;
			6'd36: sb8f = 4'd4;
			6'd37: sb8f = 4'd14;
			6'd38: sb8f = 4'd1;
			6'd39: sb8f = 4'd7;
			6'd40: sb8f = 4'd9;
			6'd41: sb8f = 4'd4;
			6'd42: sb8f = 4'd12;
			6'd43: sb8f = 4'd10;
			6'd44: sb8f = 4'd14;
			6'd45: sb8f = 4'd8;
			6'd46: sb8f = 4'd2;
			6'd47: sb8f = 4'd13;
			6'd48: sb8f = 4'd0;
			6'd49: sb8f = 4'd15;
			6'd50: sb8f = 4'd6;
			6'd51: sb8f = 4'd12;
			6'd52: sb8f = 4'd10;
			6'd53: sb8f = 4'd9;
			6'd54: sb8f = 4'd13;
			6'd55: sb8f = 4'd0;
			6'd56: sb8f = 4'd15;
			6'd57: sb8f = 4'd3;
			6'd58: sb8f = 4'd3;
			6'd59: sb8f = 4'd5;
			6'd60: sb8f = 4'd5;
			6'd61: sb8f = 4'd6;
			6'd62: sb8f = 4'd8;
			6'd63: sb8f = 4'd11;
		endcase
	end
	endfunction

	function [47:0] expand;
		input [31:0] rightIn;
		begin
			expand = {rightIn[0],rightIn[31],rightIn[30],rightIn[29],rightIn[28],rightIn[27],
					  rightIn[28],rightIn[27],rightIn[26],rightIn[25],rightIn[24],rightIn[23],
					  rightIn[24],rightIn[23],rightIn[22],rightIn[21],rightIn[20],rightIn[19],
					  rightIn[20],rightIn[19],rightIn[18],rightIn[17],rightIn[16],rightIn[15],
					  rightIn[16],rightIn[15],rightIn[14],rightIn[13],rightIn[12],rightIn[11],
					  rightIn[12],rightIn[11],rightIn[10],rightIn[9],rightIn[8],rightIn[7],
					  rightIn[8],rightIn[7],rightIn[6],rightIn[5],rightIn[4],rightIn[3],
					  rightIn[4],rightIn[3],rightIn[2],rightIn[1],rightIn[0],rightIn[31]};
		end
	endfunction

	function [31:0] perm;
		input [31:0] subOut;
		begin
			perm = {subOut[16],subOut[25],subOut[12],subOut[11],subOut[3],subOut[20],subOut[4],subOut[15],
					subOut[31],subOut[17],subOut[9],subOut[6],subOut[27],subOut[14],subOut[1],subOut[22],
					subOut[30],subOut[24],subOut[8],subOut[18],subOut[0],subOut[5],subOut[29],subOut[23],
					subOut[13],subOut[19],subOut[2],subOut[26],subOut[10],subOut[21],subOut[28],subOut[7]};
		end
	endfunction
//-----------------------------------------------------
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
			nxtLeft = left;
			nxtRight = right;
			if(des_enable == 1)
			begin
				nxtLeft = right;
				nxtRight = right;
				expandRight = expand(nxtRight);
				expandRight = expandRight ^ subkey;
				 //do the substitution here
				nxtRight[31:28] = sb1f(expandRight[47:42]);
				nxtRight[27:24] = sb2f(expandRight[41:36]);
				nxtRight[23:20] = sb3f(expandRight[35:30]);
				nxtRight[19:16] = sb4f(expandRight[29:24]);
				nxtRight[15:12] = sb5f(expandRight[23:18]);
				nxtRight[11:8] = sb6f(expandRight[17:12]);
				nxtRight[7:4] = sb7f(expandRight[11:6]);
				nxtRight[3:0] = sb8f(expandRight[5:0]);
				nxtRight = perm(nxtRight);
				nxtRight = left ^ nxtRight;
			end
		end
	end
	
endmodule
