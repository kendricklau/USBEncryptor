// $Id: $
// File name:   des_controller.sv
// Created:     4/17/2018
// Author:      Jonathan Reitz
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: DES Computation Control Unit Block

module des_controller
(
	input wire clk,
	input wire n_rst,
	input wire receive,
	input wire empty,
	input wire key_rollover,
	//figure out output signals
	input wire encrypt_sync,
	output wire count_enable,
	output wire reverse,
	output wire des_start,
	output wire data_out,
	output wire des_enable,
	output wire key_enable
);

	reg count_enable_reg, des_start_reg, data_out_reg, des_enable_reg, key_enable_reg;
	typedef enum logic [3:0] {IDLE, LOAD, PERMUTE_WAIT, START_ROUND, KEYGEN, ROUND_COMP, CHECK_DONE, INV_PERMUTE_WAIT, DATA_READY} state_type; //maybe save room for some ERROR states
	state_type state;
	state_type nextstate;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (!n_rst)
		begin
			state <= IDLE;
		end else begin
			state <= nextstate;
		end
	end

	always_comb 
	begin : next_state
		nextstate = state;
		case (state)
			IDLE: begin
				if (receive == 1)
				begin
					nextstate = LOAD;
				end else begin
					nextstate = IDLE;
				end
			end
			
			LOAD: begin
				nextstate = PERMUTE_WAIT;
			end
			
			PERMUTE_WAIT: begin
				nextstate = START_ROUND;
			end

			START_ROUND: begin
				nextstate = KEYGEN;
			end

			KEYGEN: begin
				nextstate = ROUND_COMP;
			end

			ROUND_COMP: begin
				nextstate = CHECK_DONE;
			end

			CHECK_DONE: begin
				if (key_rollover == 1)
				begin
					nextstate = INV_PERMUTE_WAIT;
				end else begin
					nextstate = START_ROUND;
				end
			end

			INV_PERMUTE_WAIT: begin
				nextstate = DATA_READY;
			end

			DATA_READY: begin
				if(empty == 1)
				begin
					nextstate = IDLE;
				end else begin
					nextstate = DATA_READY;
				end
			end	
		endcase
	end
	
	always_comb 
	begin: outLogic
		count_enable_reg = 0;
		des_start_reg = 0;
		data_out_reg = 0;
		des_enable_reg = 0;
		key_enable_reg = 0;
		case (state)
			
			PERMUTE_WAIT: begin
				des_start_reg = 1;
			end

			START_ROUND: begin
				count_enable_reg = 1;
			end

			KEYGEN: begin
				key_enable_reg = 1;
			end
			
			ROUND_COMP: begin
				des_enable_reg = 1;
			end

			DATA_READY: begin
				data_out_reg = 1;
			end	
		endcase
	end

	assign key_enable = key_enable_reg;
	assign des_enable = des_enable_reg;
	assign reverse = ~encrypt_sync;
	assign count_enable = count_enable_reg;
	assign data_out = data_out_reg;
	assign des_start = des_start_reg;
endmodule
