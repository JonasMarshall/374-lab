module regHI(input [31:0] reg_HI_in, input clr, clk, wr_en, output [31:0] reg_HI_out);
	always @ (posedge clk)begin
	reg reg_HI_in, reg_HI_out;
		if (clr == 1'b1)begin
			reg_HI_out <= 0;
			end
		else if (wr_en == 1'b1)begin
			reg_HI_out <= reg_HI_in;
		
		end
	end
endmodule
