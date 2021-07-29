module clock_generator#(
	parameter counter_width = 64,
	parameter clock_freq = 25000000,
	parameter target_freq = 12500000,
	parameter [counter_width * 2 - 1:0] inc_val = (1 << counter_width) / (clock_freq / target_freq)
) (
	input i_clk,
	output o_active
);

	reg [counter_width - 1:0] counter;

	initial begin
		counter = 0;
	end

	always_ff @(posedge i_clk) begin
		{o_active, counter} <= counter + inc_val[counter_width - 1:0];
	end
endmodule