module register (input [31:0] reg_in, input clr, clk, wr_en, output wire[31:0] reg_out);
	
	reg [31:0] reg_temp;
	
	always @ (posedge clk) begin
		if (clr == 1'b1) begin
			reg_temp = 0;
			end
		else if (wr_en == 1'b1) begin
			reg_temp = reg_in;
		
		end
	end
	assign reg_out = reg_temp;
endmodule
