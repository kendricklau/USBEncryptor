// $Id: $
// File name:   tcu.sv
// Created:     2/20/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Receiver Control Unit Block

module tcu
(
	input wire clk,
	input wire n_rst,
	input wire status,
	// input wire sync_shift_enable,
	// input wire pid_shift_enable,
	// input wire crc5_shift_enable,
	// input wire crc16_shift_enable,
	// input wire data_shift_enable,
	
	input wire sync_bits_transmitted,
	input wire pid_bits_transmitted,
	input wire crc5_bits_transmitted,
	input wire crc16_bits_transmitted,
	input wire data_bits_transmitted,
	input wire eop_bits_transmitted
	output reg sync_transmitting,
	output reg pid_transmitting,
	output reg crc5_transmitting,
	output reg crc16_transmitting,
	output reg data_transmitting,
	output reg eop_transmitting,
	output reg sync_load,
	output reg pid_load,
	output reg crc5_load,
	output reg crc16_load,
	output reg data_load,
	output reg eop_load,
	output wire [7:0] trans_sync,
	output wire [7:0] trans_pid,
	output wire [4:0] trans_crc5,
	output wire [15:0] trans_crc16,
	output wire [63:0] trans_data,
);

	typedef enum logic [4:0] {TOKEN_IDLE,
		LOAD_TOKEN_SYNC,
		TRANSMIT_TOKEN_SYNC,
		LOAD_TOKEN_PID,
		TRANSMIT_TOKEN_PID,
		LOAD_TOKEN_CRC5,
		TRANSMIT_TOKEN_CRC5,
		TRANSMIT_TOKEN_EOP1,
		TRANSMIT_TOKEN_EOP2,
		EOP_TOKEN_DELAY1,
		EOP_TOKEN_DELAY2,
		LOAD_DATA_SYNC,
		TRANSMIT_DATA_SYNC,
		LOAD_DATA_PID,
		TRANSMIT_DATA_PID,
		LOAD_DATA_BITS,
		TRANSMIT_DATA_BITS,
		LOAD_DATA_CRC16,
		TRANSMIT_DATA_CRC16,
		TRANSMIT_DATA_EOP1,
		TRANSMIT_DATA_EOP2,
		EOP_DATA_DELAY1,
		EOP_DATA_DELAY2,
		LOAD_HANDSHAKE_SYNC,
		TRANSMIT_HANDSHAKE_SYNC,
		LOAD_HANDSHAKE_PID,
		TRANSMIT_HANDSHAKE_PID,
		TRANSMIT_HANDSHAKE_EOP1,
		TRANSMIT_HANDSHAKE_EOP2,
		EOP_HANDSHAKE_DELAY1,
		EOP_HANDSHAKE_DELAY2} state_type;	
	state_type state;
	state_type nextstate;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (!n_rst)
		begin
			state <= TOKEN_IDLE;
		end else begin
			state <= nextstate;
		end
	end
	
	always_comb 
	begin : next_state
		nextstate = state;
		// eop_transmitting = 0;
		case (state)
			// Start receiving Token packet
			TOKEN_IDLE: begin
				if (status == 1'b1)
				begin
					nextstate = TRANSMIT_TOKEN_SYNC;
				end else begin
					nextstate = TOKEN_IDLE;
				end
			end
			LOAD_TOKEN_SYNC: begin
				trans_sync = 8'b10000000;
				nextstate = TRANSMIT_TOKEN_SYNC;
			end
			TRANSMIT_TOKEN_SYNC: begin
				if (sync_bits_transmitted)
				begin
					nextstate = TRANSMIT_TOKEN_PID;
				end else begin
					nextstate = TRANSMIT_TOKEN_SYNC;
				end
			end
			LOAD_TOKEN_PID: begin
				trans_pid = 8'b00011110
				nextstate = TRANSMIT_TOKEN_SYNC;
			end
			TRANSMIT_TOKEN_PID: begin
				if (pid_bits_transmitted)
				begin
					nextstate = TRANSMIT_TOKEN_CRC5;
				end else begin
					nextstate = TRANSMIT_TOKEN_PID;
				end
			end
			LOAD_TOKEN_CRC5: begin
				trans_crc5 = 5'b11111
				nextstate = TRANSMIT_TOKEN_SYNC;
			end
			TRANSMIT_TOKEN_CRC5: begin
				if (crc5_bits_transmitted)
				begin
					nextstate = TRANSMIT_TOKEN_EOP1;
				end else begin
					nextstate = TRANSMIT_TOKEN_CRC5;
				end
			end
			TRANSMIT_TOKEN_EOP1: begin
				nextstate = TRANSMIT_TOKEN_EOP2;
			end
			TRANSMIT_TOKEN_EOP2: begin
				nextstate = EOP_TOKEN_DELAY1;
			end
			EOP_TOKEN_DELAY1: begin
				nextstate =  EOP_TOKEN_DELAY2;
			end
			EOP_TOKEN_DELAY2: begin
				nextstate =  LOAD_HANDSHAKE_SYNC;
			end

			// Start receiving of Data Packet
			LOAD_DATA_SYNC: begin
				trans_sync = 8'b10000000;
				nextstate = TRANSMIT_TOKEN_SYNC;
			end
			TRANSMIT_DATA_SYNC: begin
				if (sync_bits_transmitted)
				begin
					nextstate = TRANSMIT_DATA_PID;
				end else begin
					nextstate = TRANSMIT_DATA_SYNC;
				end
			end
			LOAD_DATA_PID: begin
				trans_pid = 8'b00111100;
				nextstate = TRANSMIT_TOKEN_SYNC;
			end
			TRANSMIT_DATA_PID: begin
				if (pid_bits_transmitted)
				begin
					nextstate = TRANSMIT_DATA_BITS;
				end else begin
					nextstate = TRANSMIT_DATA_PID;
				end
			end
			LOAD_DATA_BITS: begin
				nextstate = TRANSMIT_TOKEN_SYNC;
			end
			TRANSMIT_DATA_BITS: begin
				if (data_bits_transmitted)
				begin
					nextstate = TRANSMIT_DATA_CRC16;
				end else begin
					nextstate = TRANSMIT_DATA_BITS;
				end
			end
			LOAD_DATA_CRC16: begin
				trans_crc16 = 16'b1111111111111111;
				nextstate = TRANSMIT_TOKEN_SYNC;
			end
			TRANSMIT_DATA_CRC16: begin
				if (crc16_bits_transmitted)
				begin
					nextstate = TRANSMIT_DATA_EOP1;
				end else begin
					nextstate = TRANSMIT_DATA_CRC16;
				end
			end
			TRANSMIT_DATA_EOP1: begin
				nextstate = TRANSMIT_DATA_EOP2;
			end
			TRANSMIT_DATA_EOP2: begin
				nextstate = EOP_DATA_DELAY1;
			end
			EOP_DATA_DELAY1: begin
				nextstate =  EOP_DATA_DELAY2;
			end
			EOP_DATA_DELAY2: begin
				nextstate =  LOAD_HANDSHAKE_SYNC;
			end

			// Start receiving of Handshake Packet
			LOAD_HANDSHAKE_SYNC: begin
				trans_sync = 8'b10000000;
				nextstate = TRANSMIT_TOKEN_SYNC;
			end
			TRANSMIT_HANDSHAKE_SYNC: begin
				if (sync_bits_transmitted)
				begin
					nextstate = TRANSMIT_HANDSHAKE_PID;
				end else begin
					nextstate = TRANSMIT_HANDSHAKE_SYNC;
				end
			end
			LOAD_HANDSHAKE_PID: begin
				trans_pid = 8'b00101101;
				nextstate = TRANSMIT_TOKEN_SYNC;
			end
			TRANSMIT_HANDSHAKE_PID: begin
				if (pid_bits_transmitted)
				begin
					nextstate = TRANSMIT_HANDSHAKE_EOP1;
				end else begin
					nextstate = TRANSMIT_HANDSHAKE_PID;
				end
			end
			TRANSMIT_HANDSHAKE_EOP1: begin
				nextstate = TRANSMIT_HANDSHAKE_EOP2;
			end
			TRANSMIT_HANDSHAKE_EOP2: begin
				nextstate = EOP_HANDSHAKE_DELAY1;
			end
			EOP_HANDSHAKE_DELAY1: begin
				nextstate = EOP_HANDSHAKE_DELAY2;
			end
			EOP_HANDSHAKE_DELAY2: begin
				nextstate =  TOKEN_IDLE;
			end
		endcase
	end

	assign sync_transmitting = ((state == TRANSMIT_TOKEN_SYNC) | (state == TRANSMIT_DATA_SYNC) | (state == TRANSMIT_HANDSHAKE_SYNC)) ? 1 : 0;
	assign pid_transmitting = ((state == TRANSMIT_TOKEN_PID) | (state == TRANSMIT_DATA_PID) | (state == TRANSMIT_HANDSHAKE_PID)) ? 1 : 0;
	assign crc5_transmitting = ((state == TRANSMIT_TOKEN_CRC5)) ? 1 : 0;
	assign crc16_transmitting = ((state == TRANSMIT_DATA_CRC16)) ? 1 : 0;
	assign data_transmitting = ((state == TRANSMIT_DATA_BITS)) ? 1 : 0;
	assign eop_transmitting = ((state == TRANSMIT_TOKEN_EOP) | (state == TRANSMIT_DATA_EOP) | (state == TRANSMIT_HANDSHAKE_EOP)) ? 1 : 0;

	assign sync_load = ((state == LOAD_TOKEN_SYNC) | (state == LOAD_DATA_SYNC) | (state == LOAD_HANDSHAKE_SYNC)) ? 1 : 0;
	assign pid_load = ((state == LOAD_TOKEN_PID) | (state == LOAD_DATA_PID) | (state == LOAD_HANDSHAKE_PID)) ? 1 : 0;
	assign crc5_load = ((state == LOAD_TOKEN_CRC5)) ? 1 : 0;
	assign crc16_load = ((state == LOAD_DATA_CRC16)) ? 1 : 0;
	assign data_load = ((state == LOAD_DATA_BITS)) ? 1 : 0;
	assign eop_load = ((state == LOAD_TOKEN_EOP) | (state == LOAD_DATA_EOP) | (state == LOAD_HANDSHAKE_EOP)) ? 1 : 0;
);
endmodule
