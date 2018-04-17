module round_counter
(
	input wire clk,
	input wire n_rst,
	input wire count_enable
	output reg [3:0] round_count,
	output reg cnt_rollover,
);

reg [3:0] compare_val = 4'b1111
reg [3:0] next_count = 0;
reg next_rollover = 0;


always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
	begin
		//<Flip-Flop Signal Name> <= <reset value>;
		count_out <= '0;
		cnt_rollover <= '0;
	end
	else 
	begin
		//<Flip-Flop Signal Name> <= <Flip-Flop input signal>
		round_count <= next_count;
		cnt_rollover <= next_rollover;
	end
end

always_comb
begin
	next_count = round_count;
	next_rollover = cnt_rollover;	

	if (count_enable == 1)
	begin
		if (next_rollover == 0 && count_enable == 1)	
		begin
			next_count = (count_out + 1);	
		end
		else if (cnt_rollover == 1 && count_enable == 1)
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
