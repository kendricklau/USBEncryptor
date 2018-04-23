// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     2/25/2018
// Author:      Jonathan Reitz
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Test bench for the top level USB block
`timescale 1ns / 10ps

module tb_usb_receiver();

	parameter CLK_PERIOD = 10.42; //96MHz
	parameter DATA_PERIOD = (8*CLK_PERIOD);

	localparam OUTPUT_DELAY = (CLK_PERIOD - 0.2);

	//Test inputs
	reg tb_clk, tb_n_rst, tb_d_plus, tb_d_minus, tb_r_enable, tb_test_stop_bit, tb_test_data_read;

	//Test outputs
	wire [7:0] tb_r_data;
	wire tb_full, tb_r_error, tb_rcving, tb_empty;

	//Test case number
	integer tb_test_case;
	integer i;

	//Expected output values
	reg [7:0] tb_exp_r_data;
	reg tb_exp_r_error, tb_exp_rcving, tb_exp_full, tb_exp_empty;

	usb_receiver DUT (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.d_plus(tb_d_plus),
		.d_minus(tb_d_minus),
		.r_data(tb_r_data),
		.full(tb_full),
		.empty(tb_empty),
		.r_enable(tb_r_enable),
		.r_error(tb_r_error),
		.rcving(tb_rcving));

	task reset;
	begin
		tb_n_rst = 0;

		@(posedge tb_clk);
		@(posedge tb_clk);

		@(negedge tb_clk);
		tb_n_rst = 1;

		@(posedge tb_clk);
		@(posedge tb_clk);
		
	end
	endtask
	
	task endpacket;
	begin
		@(negedge tb_clk)
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(DATA_PERIOD);
		#(DATA_PERIOD);
		tb_d_plus = 1;
		@(negedge tb_clk);
	end
	endtask


	task check_outputs;
		input [7:0] exp_r_data;
		input exp_rcving;
		input exp_r_error;
		input exp_empty;
		input exp_full;
	begin
		
		if(exp_r_data == tb_r_data)
			$info("Test case %d: Test Data correctly received", tb_test_case);
		else
			$error("Test case %d: Test Data incorrectly received", tb_test_case);
		
		if(exp_r_error == tb_r_error)
			$info("Test case %d: Test r_error correctly set", tb_test_case);
		else
			$error("Test case %d: Test r_error incorrectly set", tb_test_case);
		
		if(exp_rcving == tb_rcving)
			$info("Test case %d: Test rcving correctly set", tb_test_case);
		else
			$error("Test case %d: Test rcving incorrectly set", tb_test_case);

		if(exp_empty == tb_empty)
			$info("Test case %d: Test empty correctly set", tb_test_case);
		else
			$error("Test case %d: Test empty incorrectly set", tb_test_case);
		
		if(exp_full == tb_full)
			$info("Test case %d: Test full correctly set", tb_test_case);
		else
			$error("Test case %d: Test full incorrectly set", tb_test_case);
	end
	endtask
	
	task sendbyte;
		input [7:0] data;
	begin
		for (i = 0; i < 8; i = i + 1) begin
			@(negedge tb_clk)
			tb_d_plus = data[i];
			tb_d_minus = ~data[i];
			#(DATA_PERIOD);
		end
	end
	endtask

	task earlyeop;
	begin
		for (i = 0; i < 4; i = i + 1) begin
			@(negedge tb_clk)
			tb_d_plus = 1;
			tb_d_minus = 0;
			#(DATA_PERIOD);
		end
		endpacket;
	end
	endtask

	task readFIFO;
	begin
		@(negedge tb_clk)
		tb_r_enable = 1;
		@(negedge tb_clk)
		tb_r_enable = 0;
	end
	endtask
		


	always begin: CLK_GENERATOR
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2);
	end

	initial begin
		tb_n_rst = 1;
		tb_d_plus = 1;
		tb_d_minus = 0;
		tb_r_enable = 0;

		#0.1;
		
		//Test 0, reset
		tb_test_case = 0;

		tb_r_enable = 0;

		tb_exp_r_data = 0;
		tb_exp_r_error = 0;
		tb_exp_rcving = 0;
		tb_exp_empty = 1;
		tb_exp_full = 0;

		reset;

		check_outputs(tb_exp_r_data, tb_exp_rcving, tb_exp_r_error, tb_exp_empty, tb_exp_full);

		//Test 1, 1 byte packet

		tb_test_case = tb_test_case + 1;
		tb_exp_r_data = 8'b00000100;
		tb_exp_r_error = 0;
		tb_exp_rcving = 0;
		tb_exp_empty = 0;
		tb_exp_full = 0;
		
		//Send the sync byte
		sendbyte(8'b00101010);
		sendbyte(8'b10101101);
		endpacket;
		@(negedge tb_clk);
		
		tb_d_plus = 1'b1;
		tb_d_minus = 1'b0;
		@(negedge tb_clk);
		check_outputs(tb_exp_r_data, tb_exp_rcving, tb_exp_r_error, tb_exp_empty, tb_exp_full);

		readFIFO;
		

		tb_d_plus = 1;
		tb_d_minus = 0;
		#(DATA_PERIOD);
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);

		//Test 2, 1 byte error, bad sync byte packet

		tb_test_case = tb_test_case + 1;
		tb_exp_r_data = 8'b00001001;
		tb_exp_r_error = 0;
		tb_exp_rcving = 0;
		tb_exp_empty = 1;
		tb_exp_full = 0;
		
		//Send the sync byte
		sendbyte(8'b00101110);
		sendbyte(8'b10101101);
		endpacket;
		@(negedge tb_clk);
		
		tb_d_plus = 1'b1;
		tb_d_minus = 1'b0;
		@(negedge tb_clk);
		check_outputs(tb_exp_r_data, tb_exp_rcving, tb_exp_r_error, tb_exp_empty, tb_exp_full);

		readFIFO;
		
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(DATA_PERIOD);
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);

		tb_exp_r_data = 8'b00000100;
		tb_exp_r_error = 0;
		tb_exp_rcving = 0;
		tb_exp_empty = 0;
		tb_exp_full = 0;
		
		//Send the sync byte
		sendbyte(8'b00101010);
		sendbyte(8'b10101101);
		endpacket;
		@(negedge tb_clk);
		
		tb_d_plus = 1'b1;
		tb_d_minus = 1'b0;
		@(negedge tb_clk);
		check_outputs(tb_exp_r_data, tb_exp_rcving, tb_exp_r_error, tb_exp_empty, tb_exp_full);

		readFIFO;

		//Test 3, 1 byte error, early eop byte packet

		tb_test_case = tb_test_case + 1;
		tb_exp_r_data = 8'b00001001;
		tb_exp_r_error = 0;
		tb_exp_rcving = 0;
		tb_exp_empty = 1;
		tb_exp_full = 0;
		
		//Send the sync byte
		sendbyte(8'b00101010);
		earlyeop;
		@(negedge tb_clk);
		
		tb_d_plus = 1'b1;
		tb_d_minus = 1'b0;
		@(negedge tb_clk);
		check_outputs(tb_exp_r_data, tb_exp_rcving, tb_exp_r_error, tb_exp_empty, tb_exp_full);

		readFIFO;
		
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(DATA_PERIOD);
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);

		tb_exp_r_data = 8'b00000100;
		tb_exp_r_error = 0;
		tb_exp_rcving = 0;
		tb_exp_empty = 0;
		tb_exp_full = 0;
		
		//Send the sync byte
		sendbyte(8'b00101010);
		sendbyte(8'b10101101);
		endpacket;
		@(negedge tb_clk);
		
		tb_d_plus = 1'b1;
		tb_d_minus = 1'b0;
		@(negedge tb_clk);
		check_outputs(tb_exp_r_data, tb_exp_rcving, tb_exp_r_error, tb_exp_empty, tb_exp_full);

		readFIFO;
	end

endmodule
