module div_op (input [31:0] dividend_a, divisor_b, output wire [63:0] prod_z);

	reg [31:0] temp_divisor;
	reg [31:0] temp_remainder;
	reg [31:0] quotient;
	reg [63:0] shift_reg;
	
	initial begin
		if(dividend_a < 0)
			neg_op(dividend_a, quotient); //will need to edit this
		else
			quotient = dividend_a;
		
		if(divisor_b < 0)
			neg_op(divisor_b, temp_divisor); //will need to edit this
		else
			temp_divisor = divisor_b;
			
		temp_remainder = 0;
		shift_reg = {temp_remainder, quotient};
	end
	
	always @ (dividend_a, divisor_b)begin
		
		integer i = 0;
		
		for(i = 0; i < 31; i = i + 1)begin
			
			shift_reg = shift_reg << 1;
			temp_remainder = shift_reg >> 32;
			
			if(temp_remainder >= 0)begin
				temp_remainder = temp_remainder - temp_divisor;
				shift_reg[0] = 1;
			end
			else begin
				temp_remainder = temp_remainder + temp_divisor;
				shift_reg[0] = 0;
			end
			
			shift_reg = {temp_remainder, shift_reg[31:0]};
		
		end
		
		if(temp_remainder < 0)
			temp_remainder = temp_remainder + temp_divisor;
			
		quotient = shift_reg[31:0];
	end
	
	assign prod_z = {quotient, temp_remainder};
	
endmodule