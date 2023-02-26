module mul (input wire signed[31:0] multiplicand_a, multiplier_b, output wire signed[63:0] prod_z);
	
	reg [32:0] booth_temp_array;
	reg signed [63:0] booth_multiplicand;
	reg signed [63:0] partial_prod;

	
	initial begin		
		partial_prod = 0;
		booth_temp_array = multiplier_b<<1;
		booth_multiplicand = multiplicand_a;
	end

	always @ (multiplicand_a or multiplier_b)begin
		
		integer i;
		integer booth_counter = 0;
		
		for(i = 1; i < 32; i = i + 2)begin
			
			if(booth_temp_array[i+1] == 0 && booth_temp_array[i] == 0 && booth_temp_array[i-1] == 1)begin
				partial_prod = partial_prod + booth_multiplicand;
			end
			
			if(booth_temp_array[i+1] == 0 && booth_temp_array[i] == 1 && booth_temp_array[i-1] == 0)begin
				partial_prod = partial_prod + booth_multiplicand;
			end
			
			if(booth_temp_array[i+1] == 0 && booth_temp_array[i] == 1 && booth_temp_array[i-1] == 1)begin
				partial_prod = partial_prod + booth_multiplicand + booth_multiplicand;
			end
			
			if(booth_temp_array[i+1] == 1 && booth_temp_array[i] == 0 && booth_temp_array[i-1] == 0)begin
				partial_prod = partial_prod - booth_multiplicand - booth_multiplicand;
			end
			
			if(booth_temp_array[i+1] == 1 && booth_temp_array[i] == 0 && booth_temp_array[i-1] == 1)begin
				partial_prod = partial_prod - booth_multiplicand;
			end
			
			if(booth_temp_array[i+1] == 1 && booth_temp_array[i] == 1 && booth_temp_array[i-1] == 0)begin
				partial_prod = partial_prod - booth_multiplicand;
			end
			
			booth_multiplicand = booth_multiplicand << 2;
		end
	end
	assign prod_z = partial_prod;
endmodule
