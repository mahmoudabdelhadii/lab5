module fast_to_slow_sync (fast_clk, slow_clk, d, q);
	parameter N = 12;
	input fast_clk, slow_clk;
	input [N-1:0] d;
	output [N-1:0] q;

	logic [N-1] q1, q1, q3, E;
	
	always_ff @ (posedge fast_clk or posedge E) begin
		if (E) q2 <= {N{1'b0}};
		else q2 <= q1;
	end

	always_ff @ (posedge  fast_clk) begin
		q1 <= d;
	end

	always_ff @ (posedge ~fast_clk) begin
		slow_clk <= q3;
		q3 <= E;
	end

	always_ff @ (posedge slow_clk) begin
		q <= q2;
	end
endmodule
	

module slow_to_fast_sync (fast_clk, slow_clk, d, q);
	parameter N = 12;
	input fast_clk, slow_clk;
	input [N-1:0] d;
	output [N-1:0] q;

	logic [N-1] q1, q1, q3, E;
	
	always_ff @ (posedge slow_clk or posedge E) begin
		if (E) q2 <= {N{1'b0}};
		else q2 <= q1;
	end

	always_ff @ (posedge  slow_clk) begin
		q1 <= d;
	end

	always_ff @ (posedge ~slow_clk) begin
		slow_clk <= q3;
		q3 <= E;
	end

	always_ff @ (posedge fast_clk) begin
		q <= q2;
	end
endmodule
	

