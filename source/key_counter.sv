module key_counter
(
	input wire clk,
	input wire n_rst,
	input wire count_enable,
	output wire [1:0] key_count,
	output wire key_rollover
);

reg [1:0] key_reg;
reg rollover_reg;
reg [1:0] next_count = 0;
reg next_rollover = 0;
assign key_rollover = rollover_reg;
assign key_count = key_reg;


always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
	begin
		//<Flip-Flop Signal Name> <= <reset value>;
		key_reg <= '0;
		rollover_reg <= '0;
	end
	else 
	begin
		//<Flip-Flop Signal Name> <= <Flip-Flop input signal>
		key_reg <= next_count;
		rollover_reg <= next_rollover;
	end
end

always_comb
begin
	next_count = key_reg;
	next_rollover = rollover_reg;	

	if (count_enable == 1)
	begin
		if (next_rollover == 0 && count_enable == 1)	
		begin
			next_count =  key_reg + 1;	
		end
		else if (rollover_reg == 1 && count_enable == 1)
		begin
			next_count = 0;
			next_rollover = 0;
		end
		if (key_reg == 2'b10 && count_enable == 1)
		begin
			next_rollover = 1;
		end
		
	end
end

endmodule
