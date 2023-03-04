`timescale 1ns / 1ps

module sub_32_bit(
  input wire [31:0] Ra,
  input wire [31:0] Rb,
  input wire cin,
  output wire [31:0] sum,
  output wire cout
);
	wire [31:0] tempVal; 
	neg_op neg(.Ra(Rb),.Rz(tempVal));
	fulladder add(.Ra(Ra), .Rb(tempVal),.cin(cin),.sum(sum),.cout(cout));
endmodule
