/*`timescale  1ns/10ps
module mul_tb
	
	wire signed[31:0] multiplicand_a, multiplier_b;
	wire signed[31:0] product_z;
*/
`timescale 1ns / 1ps

module mul_tb;

    // Inputs
    reg signed [31:0] a = 57;
    reg signed [31:0] b = 198;

    // Outputs
    wire signed [63:0] z;

    // Instantiate the Unit Under Test (UUT)
    mul_op uut (
        .multiplicand_a(a),
        .multiplier_b(b),
        .prod_z(z)
    );

    initial begin
        // Initialize inputs
        a = 57;
        b = 198;

        // Wait for 10 ns for stable output
        #10;

        // Check output
        if (z !== a * b) begin
            $display("Test failed: expected %d but got %d", a * b, z);
            $finish;
        end

        // Success!
        $display("Test passed");
        $finish;
    end
endmodule
	
	
	