module register (input [31:0] reg_in, input clr, clk, wr_en, output [31:0] reg_out);
	
	reg reg_out, reg_in;
	
	always @ (posedge clk) begin
		if (clr == 1'b1) begin
			reg_out <= 0;
			end
		else if (wr_en == 1'b1) begin
			reg_out <= reg_in;
		
		end
	end
endmodule
