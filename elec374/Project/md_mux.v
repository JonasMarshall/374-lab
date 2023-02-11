module MDMux (input [31:0] bus_mux_out, mdata_in, input sel, output [31:0] md_mux_out);
	assign md_mux_out = sel ? mdata_in:bus_mux_out;
endmodule