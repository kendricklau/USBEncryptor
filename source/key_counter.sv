module key_counter
(
	input wire clk,
	input wire n_rst,
	input wire count_enable,
	output reg [1:0] key_count,
	output reg key_rollover
);

reg [1:0] compare_val = 2'b11;
reg next_count = 0;
reg next_rollover = 0;
reg rollover_val;
reg count_out;


always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
	begin
		//<Flip-Flop Signal Name> <= <reset value>;
		key_count <= '0;
		key_rollover <= '0;
	end
	else 
	begin
		//<Flip-Flop Signal Name> <= <Flip-Flop input signal>
		key_count <= next_count;
		key_rollover <= next_rollover;
	end
end

always_comb
begin
	next_count = key_count;
	next_rollover = key_rollover;	

	if (count_enable == 1)
	begin
		if (next_rollover == 0 && count_enable == 1)	
		begin
			next_count = (count_out + 1);	
		end
		else if (key_rollover == 1 && count_enable == 1)
		begin
			next_count = 0;
		end
		if (next_count == rollover_val && count_enable == 1)
		begin
			next_rollover = 1;
		end
		
	end
end

endmodule
