module regPC (input [31:0] PC_in, input PC_clr, clk, output [31:0] PC_out);
	always @ (posedge clk)begin
	reg PC_out, PC_in;
		if (PC_clr == 1'b1)begin
			PC_out <= 0;
		end
		PC_out <= PC_in;
	end
endmodule
