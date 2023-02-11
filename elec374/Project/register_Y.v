module regY(input [31:0] reg_Y_in, input clr, clk, wr_en, output [31:0] reg_Y_out);
	always @ (posedge clk)begin
	reg reg_Y_out, reg_Y_in;
		if (clr == 1'b1)begin
			reg_Y_out <= 0;
			end
		else if (wr_en == 1'b1)begin
			reg_Y_out <= reg_Y_in;
		
		end
	end
endmodule
