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
	input wire full,
	input wire empty,
	//figure out output signals
	input wire encrypt_sync,
	output wire count_enable,
	output wire reverse,
	output wire des_start,
	output wire data_out
);

	typedef enum logic [3:0] {IDLE, LOAD, PERMUTE WAIT, START_ROUND, KEYGEN, ROUND_COMP, CHECK_DONE, INV_PERMUTE_WAIT, DATA_READY} state_type; //maybe save room for some ERROR states
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
				if (full == 1)
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
					nextstate = INV_PERMUTE;
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
		count_enable = 0;
		des_start = 0;
		data_out = 0;
		case (state)
			
			PERMUTE_WAIT: begin
				des_start = 1
			end

			START_ROUND: begin
				count_enable = 1;
			end

			DATA_READY: begin
				data_out = 1;
			end	
		endcase
	end

	assign reverse = encrypt_sync;
endmodule
