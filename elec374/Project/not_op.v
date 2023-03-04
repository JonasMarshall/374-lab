`timescale 1ns / 1ps

module not_op(
	input wire [31:0] Ra,
	output wire [31:0] Rz
	);
	
	genvar x;
	generate
    for (x=0; x<32; x=x+1) begin:
      if ((Ra[x]) == 1)
        assign Rz[x] = 0;
      else 
        assign Rz[x] =1;
		end
	endgenerate
endmodule
