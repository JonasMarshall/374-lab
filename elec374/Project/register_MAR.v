module regMAR(input [31:0] reg_MAR_in, input clr, clk, wr_en, output [31:0] reg_MAR_out);
	always @ (posedge clk)begin
	reg reg_MAR_in, reg_MAR_out;
		if (clr == 1'b1)begin
			reg_MAR_out <= 0;
			end
		else if (wr_en == 1'b1)begin
			reg_MAR_out <= reg_MAR_in;
		
		end
	end
endmodule
