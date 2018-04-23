module round_counter
(
	input wire clk,
	input wire n_rst,
	input wire count_enable,
	output wire [4:0] round_count,
	output wire cnt_rollover
);

reg [4:0] count_reg;
reg rollover_reg;
reg [4:0] next_count = 0;
reg next_rollover = 0;
assign round_count = count_reg;
assign cnt_rollover = rollover_reg;


always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
	begin
		//<Flip-Flop Signal Name> <= <reset value>;
		count_reg <= '0;
		rollover_reg <= '0;
	end
	else 
	begin
		//<Flip-Flop Signal Name> <= <Flip-Flop input signal>
		count_reg <= next_count;
		rollover_reg <= next_rollover;
	end
end

always_comb
begin
	next_count = count_reg;
	next_rollover = rollover_reg;	

	if (count_enable == 1)
	begin
		if (next_rollover == 0 && count_enable == 1)	
		begin
			next_count = (round_count + 1);	
		end
		else if (rollover_reg == 1 && count_enable == 1)
		begin
			next_count = 0;
			next_rollover = 0;
		end
		if (next_count == 5'b10000 && count_enable == 1)
		begin
			next_rollover = 1;
		end
	end
end

endmodule
