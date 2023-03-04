module mul_op (input signed[31:0] multiplicand_a, multiplier_b, output wire signed[63:0] prod_z);
	
	reg q_plus1, q0, q_minus1;
	reg [2:0] temp;
	reg signed [63:0] shift_multiplicand;
	reg signed [63:0] partial_prod;
	
	initial begin		
		q_plus1 = multiplier_b[1];
		q0 = multiplier_b[0];
		q_minus1 = 0;
		temp = 3'b000;
		shift_multiplicand = multiplicand_a;
		partial_prod = 0;
	end

	always @ (multiplicand_a, multiplier_b)begin
		
		integer i;
		
		for(i = 0; i < 15; i = i + 1)begin
			temp = {q_plus1, q0, q_minus1};
			
			case(temp)
				001, 010:
					begin
						partial_prod = partial_prod + shift_multiplicand;
					end
				011:
					begin
						partial_prod = partial_prod + shift_multiplicand + shift_multiplicand;
					end
				100:
					begin
						partial_prod = partial_prod - shift_multiplicand - shift_multiplicand;
					end
				101, 110:
					begin
						partial_prod = partial_prod - shift_multiplicand;
					end
			endcase
			shift_multiplicand = shift_multiplicand << 2;
		end
	end
	assign prod_z = partial_prod;
endmodule
