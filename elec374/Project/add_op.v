`timescale 1ns / 1ps

module add_op(
  input wire [31:0] a,
  input wire [31:0] b,
  input wire  c_in,
  output wire c_out,
  output wire [31:0] s,
	);
	
	genvar x;
  reg carry;
	generate
    for (x=0; x<32; x=x+1) begin
      fulladder_op inst(
        .a(a[x]), 
        .b(b[x]),
        .c_in(c_in),
        .c_out(carry),
        .s(s[x])  
      );
      assign c_in = carry;
      
		end
	endgenerate
endmodule
