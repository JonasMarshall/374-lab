module regLO(input [31:0] reg_LO_in, input clr, clk, wr_en, output [31:0] reg_LO_out);
	always @ (posedge clk)begin
	reg reg_LO_in, reg_LO_out;
		if (clr == 1'b1)begin
			reg_LO_out <= 0;
			end
		else if (wr_en == 1'b1)begin
			reg_LO_out <= reg_LO_in;
		
		end
	end
endmodule
