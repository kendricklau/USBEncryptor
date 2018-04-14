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
	// input wire [7:0] rcv_sync,
	// input wire [7:0] rcv_pid,
	// input wire [4:0] rcv_crc5,
	// input wire [15:0] rcv_crc16,
	// input wire [63:0] rcv_data,
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
);

	typedef enum logic [4:0] {TOKEN_IDLE, TRANSMIT_TOKEN_SYNC, TRANSMIT_TOKEN_PID, TRANSMIT_TOKEN_CRC5, TRANSMIT_TOKEN_EOP, EOP_TOKEN_DELAY, TRANSMIT_DATA_SYNC, TRANSMIT_DATA_PID, TRANSMIT_DATA_BITS, TRANSMIT_DATA_CRC16, TRANSMIT_DATA_EOP, EOP_DATA_DELAY, TRANSMIT_HANDSHAKE_SYNC, TRANSMIT_HANDSHAKE_PID, TRANSMIT_HANDSHAKE_EOP, EOP_HANDSHAKE_DELAY, EIDLE} state_type;	
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
				if (status == "DATA_READY")
				begin
					nextstate = TRANSMIT_TOKEN_SYNC;
				end else begin
					nextstate = TOKEN_IDLE;
				end
			end
			TRANSMIT_TOKEN_SYNC: begin
				if (sync_bits_transmitted)
				begin
					nextstate = TRANSMIT_TOKEN_PID;
				end else begin
					nextstate = TRANSMIT_TOKEN_SYNC;
				end
			end
			TRANSMIT_TOKEN_PID: begin
				if (pid_bits_transmitted)
				begin
					nextstate = TRANSMIT_TOKEN_CRC5;
				end else begin
					nextstate = TRANSMIT_TOKEN_PID;
				end
			end
			TRANSMIT_TOKEN_CRC5: begin
				if (crc5_bits_transmitted)
				begin
					nextstate = TRANSMIT_TOKEN_EOP;
				end else begin
					nextstate = TRANSMIT_TOKEN_CRC5;
				end
			end
			TRANSMIT_TOKEN_EOP: begin
				if (eop_bits_transmitted)
				begin
					nextstate = EOP_TOKEN_DELAY;
				end else begin
					nextstate = TRANSMIT_TOKEN_EOP;
				end
			end
			EOP_TOKEN_DELAY: begin
				// Two clock cycles, then advance to data sync
			end

			// Start receiving of Data Packet
			TRANSMIT_DATA_SYNC: begin
				if (sync_bits_transmitted)
				begin
					nextstate = TRANSMIT_DATA_PID;
				end else begin
					nextstate = TRANSMIT_DATA_SYNC;
				end
			end
			TRANSMIT_DATA_PID: begin
				if (pid_bits_transmitted)
				begin
					nextstate = TRANSMIT_DATA_BITS;
				end else begin
					nextstate = TRANSMIT_DATA_PID;
				end
			end
			TRANSMIT_DATA_BITS: begin
				if (data_bits_transmitted)
				begin
					nextstate = TRANSMIT_DATA_CRC16;
				end else begin
					nextstate = TRANSMIT_DATA_BITS;
				end
			end
			TRANSMIT_DATA_CRC16: begin
				if (crc16_bits_transmitted)
				begin
					nextstate = TRANSMIT_DATA_EOP;
				end else begin
					nextstate = TRANSMIT_DATA_CRC16;
				end
			end
			TRANSMIT_DATA_EOP: begin
				if (eop_bits_transmitted)
				begin
					nextstate = EOP_DATA_DELAY;
				end else begin
					nextstate = TRANSMIT_DATA_EOP;
				end
			end
			EOP_DATA_DELAY: begin
				if (d_edge)
				begin
					nextstate = HANDSHAKE_IDLE;
				end else begin
					nextstate = EOP_DATA_DELAY;
				end
			end

			// Start receiving of Handshake Packet
			TRANSMIT_HANDSHAKE_SYNC: begin
				if (sync_bits_transmitted)
				begin
					nextstate = TRANSMIT_HANDSHAKE_PID;
				end else begin
					nextstate = TRANSMIT_HANDSHAKE_SYNC;
				end
			end
			TRANSMIT_HANDSHAKE_PID: begin
				if (pid_bits_transmitted)
				begin
					nextstate = TRANSMIT_HAND;
				end else begin
					nextstate = TRANSMIT_HANDSHAKE_PID;
				end
			end
			TRANSMIT_HANDSHAKE_EOP: begin
				if (eop_bits_transmitted)
				begin
					nextstate = EOP_HANDSHAKE_DELAY;
				end else begin
					nextstate = TRANSMIT_HANDSHAKE_EOP;
				end
			end
			EOP_HANDSHAKE_DELAY: begin
				if (d_edge)
				begin
					nextstate = TOKEN_IDLE;
				end else begin
					nextstate = EOP_HANDSHAKE_DELAY;
				end
			end
		endcase
	end

	assign sync_transmitting = ((state == TRANSMIT_TOKEN_SYNC) | (state == TRANSMIT_DATA_SYNC) | (state == TRANSMIT_HANDSHAKE_SYNC)) ? 1 : 0;
	assign pid_transmitting = ((state == TRANSMIT_TOKEN_PID) | (state == TRANSMIT_DATA_PID) | (state == TRANSMIT_HANDSHAKE_PID)) ? 1 : 0;
	assign crc5_transmitting = ((state == TRANSMIT_TOKEN_CRC5)) ? 1 : 0;
	assign crc16_transmitting = ((state == TRANSMIT_DATA_CRC16)) ? 1 : 0;
	assign data_transmitting = ((state == TRANSMIT_DATA_BITS)) ? 1 : 0;
	assign eop_transmitting = ((state == TRANSMIT_TOKEN_EOP) | (state == TRANSMIT_DATA_EOP) | (state == TRANSMIT_HANDSHAKE_EOP)) ? 1 : 0;

endmodule
