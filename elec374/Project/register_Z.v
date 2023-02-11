module regZ(input [31:0] reg_Z_in, input clr, clk, wr_en, output [31:0] reg_Z_out);
	always @ (posedge clk)begin
	reg reg_Z_out, reg_Z_in;
		if (clr == 1'b1)begin
			reg_Z_out <= 0;
			end
		else if (wr_en == 1'b1)begin
			reg_Z_out <= reg_Z_in;
		
		end
	end
endmodule
