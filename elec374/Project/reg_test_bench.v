`timescale  1ns/10ps
module reg_test_bench;

	reg[31:0] reg_in ;
	reg reg_clr, clk, wr_en;
	wire[31:0] reg_out ;

	register reg_instance(reg_in, reg_clr, clk, reg_out);
	
	
	always
			#5 clk = ~clk;	
	
	initial begin
		clk = 0;
		wr_en = 1;
		#20
		reg_in = 7;
		#20
		reg_clr = 1;
		#20
		wr_en = 0;
		#20
		reg_in = 15;
		#20
		wr_en = 1;
		#20
		reg_in = 56;
		#20
		$finish;
	end
	
	initial begin
	#20 $display(" val:  %d", reg_out);
	#20 $display(" val:  %d", reg_out);
	#40 $display(" val:  %d", reg_out);
	#40 $display(" val:  %d", reg_out);
	end
	
	
endmodule
