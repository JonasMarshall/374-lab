// and datapath_tb.v file: <This is the filename>
`timescale 1ns/10ps
module datapath_tb;
 reg out_PC, out_Z_LO, out_MDR, dat_out2, dat_out3; // add any other signals to see in your simulation
 reg MAR_in, Z_in, PC_in, MDR_in, IR_in, Y_in;
 reg IncPC, Read,
 reg AND, dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8,	dat_in9, dat_in10, dat_in11, dat_in12, dat_in13, dat_in14, dat_in15;
 reg Clock;
 reg [31:0] Mdatain;
parameter Default = 4’b0000, Reg_load1a = 4’b0001, Reg_load1b = 4’b0010, Reg_load2a = 4’b0011,
 Reg_load2b = 4’b0100, Reg_load3a = 4’b0101, Reg_load3b = 4’b0110, T0 = 4’b0111,
 T1 = 4’b1000, T2 = 4’b1001, T3 = 4’b1010, T4 = 4’b1011, T5 = 4’b1100;
 reg [3:0] Present_state = Default;
// naming convention DUT Datapath/CPUproject DUT(out_PC, ZHighout, out_Z_LO, out_MDR, dat_out2, dat_out4, MAR_in, PC_in, MDR_in, IR_in, Y_in, IncPC,Read, AND,dat_in5, dat_in2, dat_in4,Clock, Mdatain, Clear, dat_in1, dat_in3, dat_in6,  dat_in7,  dat_in8,  dat_in9, dat_in10, dat_in11, dat_in12, dat_in13, dat_in14, dat_in15, in_HI, in_LO, in_Z_HI, in_Z_Lo, C_sign_extended);
initial
 begin
   Clock = 0;
   forever #10 Clock = ~ Clock;
end
always @(posedge Clock) // finite state machine; if clock rising-edge
 begin
  case (Present_state)
    Default : Present_state = Reg_load1a;
    Reg_load1a : Present_state = Reg_load1b;
    Reg_load1b : Present_state = Reg_load2a;
    Reg_load2a : Present_state = Reg_load2b;
    Reg_load2b : Present_state = Reg_load3a;
    Reg_load3a : Present_state = Reg_load3b;
    Reg_load3b : Present_state = T0;
    T0 : Present_state = T1;
    T1 : Present_state = T2;
    T2 : Present_state = T3;
    T3 : Present_state = T4;
    T4 : Present_state = T5;
    endcase
   end

always @(Present_state) // do the required job in each state
begin
  case (Present_state) // assert the required signals in each clock cycle
    Default: begin
      out_PC <= 0; out_Z_LO <= 0; out_MDR <= 0; // initialize the signals
      dat_out2 <= 0; dat_out3 <= 0; MAR_in <= 0; Z_in <= 0;
      PCin <=0; MDR_in <= 0; IR_in <= 0; Y_in <= 0;
      IncPC <= 0; Read <= 0; AND <= 0;
      dat_in1 <= 0; dat_in2 <= 0; dat_in3 <= 0; Mdatain <= 32’h00000000;
    end
    Reg_load1a: begin
      Mdatain <= 32’h00000012;
      Read = 0; MDR_in = 0; // the first zero is there for completeness
      #10 Read <= 1; MDR_in <= 1;
      #15 Read <= 0; MDR_in <= 0;
    end
    Reg_load1b: begin
      #10 out_MDR <= 1; dat_in2 <= 1;
      #15 out_MDR <= 0; dat_in2 <= 0; // initialize R2 with the value $12
    end
    Reg_load2a: begin
       Mdatain <= 32’h00000014;
      #10 Read <= 1; MDR_in <= 1;  
      #15 Read <= 0; MDR_in <= 0;
    end
    Reg_load2b: begin
      #10 out_MDR <= 1; dat_in3 <= 1;
      #15 out_MDR <= 0; dat_in3 <= 0; // initialize R3 with the value $14
    end
    Reg_load3a: begin
      Mdatain <= 32’h00000018;
      #10 Read <= 1; MDR_in <= 1;
      #15 Read <= 0; MDR_in <= 0;
    end
    Reg_load3b: begin
      #10 out_MDR <= 1;dat_in1 <= 1;
      #15 out_MDR <= 0; dat_in1 <= 0; // initialize R1 with the value $18
    end
    
    T0: begin // see if you need to de-assert these signals
      out_PC <= 1; MAR_in <= 1; IncPC <= 1; Z_in <= 1;
    end
    
    T1: begin
      out_Z_LO <= 1; PC_in <= 1; Read <= 1; MDR_in <= 1;
      Mdatain <= 32’h28918000; // opcode for “and R1, R2, R3”
    end
    T2: begin
      out_MDR <= 1; IR_in <= 1;
    end

    T3: begin
      dat_out2 <= 1; Y_in <= 1;
    end

    T4: begin
      dat_out3 <= 1; AND <= 1; Z_in <= 1;
    end

    T5: begin
      out_Z_LO <= 1; dat_in1 <= 1;
    end
   endcase
end
endmodule
