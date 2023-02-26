`timescale 1ns / 1ps

module or_op(
	input wire [31:0] Ra,
	input wire [31:0] Rb,
	output wire [31:0] Rz
	);
	
	genvar x;
	generate
    for (x=0; x<32; x=x+1) begin : loop
      assign Rz[x] = ((Ra[x])|(Rb[x]));
		end
	endgenerate
endmodule
