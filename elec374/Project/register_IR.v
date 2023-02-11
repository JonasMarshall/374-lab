module regIR (input [31:0] IR_in, input IR_clr, clk, output [31:0] IR_out);
	always @ (posedge clk)begin
	reg IR_out, IR_in;
		if (IR_clr == 1'b1)begin
			IR_out <= 0;
		end
		IR_out <= IR_in;
	end
endmodule
