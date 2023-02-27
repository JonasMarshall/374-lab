`timescale 1ns / 1ps

module neg_op(
	input wire [31:0] Ra,
	output wire [31:0] Rz
	);
	
	genvar x;
	generate
    for (x=0; x<32; x=x+1) begin
      if ((Ra[x]) == 1)
        assign Rz[x] = 0;
      else 
        assign Rz[x] =1;
		end
	endgenerate
  // flipped the bits now add 1
  
  	genvar x;
	generate
    for (x=0; x<32; x=x+1) begin
      if (x =  0)
        assign c = 1
      if ((Ra[x]+c) =2) begin 
        assign c= 1 
        assign Ra[x] =0 
       end 
      if ((Ra[x]+c) =1) begin
        assign c= 1 
        assign Ra[x] =0 
       end 
      if ((Ra[x]+c) =0) begin
        assign c= 0 
        assign Ra[x] =0 
       end 
 	endgenerate
endmodule
