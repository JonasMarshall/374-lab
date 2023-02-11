module bus_mux #(parameter word_size = 32)(
	input [word_size-1:0]	dat_in0, dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, 
									dat_in9, dat_in10, dat_in11, dat_in12, dat_in13, dat_in14, dat_in15,
	input [word_size-1:0]   in_HI, in_LO, in_Z_HI, in_Z_LO, in_PC,	in_MDR, in_Inport, C_sign_extended,							
	input [4:0]   				sel,
	input enable,
	output[word_size-1:0]  	dat_out_mux
);

	reg [31:0] mux_int;
	assign data_out_mux = enable ? mux_int:32'bz;
	always @ (dat_in0, dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, 
									dat_in9, dat_in10, dat_in11, dat_in12, dat_in13, dat_in14, dat_in15,
									in_HI, in_LO, in_Z_HI, in_Z_LO, in_PC,	in_MDR, in_Inport, C_sign_extended, sel)
									
	case (sel)
	0:		mux_int = dat_in0;
	1:		mux_int = dat_in1;
	2:		mux_int = dat_in2;
	3:		mux_int = dat_in3;
	4:		mux_int = dat_in4;
	5:		mux_int = dat_in5;
	6:		mux_int = dat_in6;
	7:		mux_int = dat_in7;
	8:		mux_int = dat_in8;
	9:		mux_int = dat_in9;
	10:	mux_int = dat_in10;
	11:	mux_int = dat_in11;
	12:	mux_int = dat_in12;
	13:	mux_int = dat_in13;
	14:	mux_int = dat_in14;
	15:	mux_int = dat_in15;
	16:	mux_int = in_HI;
	17:	mux_int = in_LO;
	18:	mux_int = in_Z_HI;
	19:	mux_int = in_Z_LO;
	20:	mux_int = in_PC;
	21:	mux_int = in_MDR;
	22:	mux_int = in_Inport;
	23:	mux_int = C_sign_extended;
	default:	mux_int = 32'bx;
	endcase
endmodule