module mul (input [31:0] multiplicand_a, multiplicand_b, output [63:0] prod_z)
	
	reg [1:0] booth_bit;
	reg [63:0] partial_prod;
	
	inital begin
		state = 0;		
		partial_prod = 0;
	end
	
	always @ (posedge clk)begin
		