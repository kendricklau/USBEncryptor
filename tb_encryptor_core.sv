// $Id: $
// File name:   tb_encryptor_core.sv
// Created:     4/22/2018
// Author:      Thomas Golden
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Test bench for the USB Encryptor Core operation.

`timescale 1ns / 10ps

module tb_encryptor_core
();
	reg tb_clk; //clock
	reg tb_n_rst; //reset
	reg tb_rcv_data_ready; //receive flag
	reg tb_encrypt; //asynchronous encrypt flag for sync_high
	reg tb_handshake_ack; //empty flag
	reg [63:0] tb_rcv_data; //data to be encrypted
	reg [63:0] tb_trans_data; //transmittable data
	reg tb_trans_data_ready; //transmittable data ready flag

	encryptor_core ENCRYPTOR_CORE (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.rcv_data_ready(tb_rcv_data_ready),
		.encrypt(tb_encrypt),
		.handshake_ack(tb_handshake_ack),
		.rcv_data(tb_rcv_data),
		.trans_data(tb_trans_data),
		.trans_data_ready(tb_trans_data_ready)
	);

	reg dummy_reg;	
	reg [63:0] encrypted_vals;
	reg tick;

	always begin
		tb_clk = 1'b1;
		#(2.5/2.0);
		tb_clk = 1'b0;
		#(2.5/2.0);
	end

	initial
	begin
		@(posedge tb_clk)
		tb_n_rst = 1;
		@(posedge tb_clk)
		tb_n_rst = 0;
		@(posedge tb_clk)
		tb_n_rst = 1;

		tb_rcv_data = 64'h9999999999999999; //8 bytes of 153
		@(posedge tb_clk)
		tb_rcv_data_ready = 1'b1; //Start encryption in encryptor_core
		@(posedge tb_clk)
		tb_rcv_data_ready = 1'b0;

		//wait until the beginning encryption steps are completed
			// -keygen, permutations, counters

		tick = 1'b1;

	//	while (tb_trans_data != 64'hb533f124beb485ec)
	//	begin
	//		#(1)
	//		if (tick == 1)
	//		begin
	//			tick = 0;
	//		end			
	//		else
	//		begin
	//			tick = 1;
	//		end
	//	end

		//KEYS: 64'hCA3A3E989AA7AE58
		//	64'hEB806D4E20A6C744
		//	54'h21735514632D155D			

		//ENCRYPTION	
		//Data before encryption: 64'b1001100110011001100110011...
		//			  64'h9999999999999999
		//Data after 1st encryption:
		//		64'h7f733851c5f235d9
		//Data after 2nd encryption: 
		//		64'h6ca7c3f173252118
		//Data after 3rd encryption:
		//		64'hb533f124beb485ec
	
		//encrypt, decrypt, encrypt

		encrypted_vals = tb_trans_data; //save encrypted data in a register

		while (tb_trans_data_ready == 0)
			#(1)
		
		if (tb_trans_data != 64'hb533f124beb485ec) //should equal expected encrypted string
		begin
			$error("Encryption Algorithm: not successful.");
		end
		else
		begin
			$info("Encryption Algorithm: successful.");
		end
		
		tb_rcv_data = tb_trans_data; //set up string to decrypt as being the encrypted string from the previous encryption process
			//value should yield original 64'h9999999999999999 number
		@(posedge tb_clk)
		tb_rcv_data_ready = 1'b1;
		@(posedge tb_clk)
		tb_rcv_data_ready = 1'b0;

		//wait again until decryption algorithm finishes its process

		while (tb_trans_data != 64'h9999999999999999)
		begin
			#(1)
			if (tick == 1)
				tick = 0;
			else
				tick = 1;
		end

		//KEYS: 64'hCA3A_3E98_9AA7_AE58
		//	64'hEB80_6D4E_20A6_C744
		//	54'h2173_5514_632D_155D
		
		//ENCRYPTION	
		//Data before encryption: 64'hb533f124beb485ec
		//
		//Data after 1st encryption: equal to data after 2nd encryption
		//		64'h6ca7c3f173252118
		//Data after 2nd encryption: equal to data after 1st encryption
		//		64'h7f733851c5f235d9
		//Data after 3rd encryption: equal to original data
		//		64'h9999999999999999

		if (tb_trans_data == 64'h9999999999999999)
		begin
			$info("Overall Algorithm: success.");
		end
		else
		begin
			if (tb_trans_data == encrypted_vals)
			begin
				$info("Decryption Algorithm: sucess, w/ encryption failure.");
			end
			else
			begin
				$error("Overall Algorithm: failed.");
			end
		end
	end
endmodule
