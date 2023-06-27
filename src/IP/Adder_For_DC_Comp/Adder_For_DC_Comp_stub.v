// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Jun 27 15:24:01 2023
// Host        : Thomas running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/thoma/OneDrive - Delft University of
//               Technology/Documenten/UNI/BAP/VHDL/FPGA_4.0/src/IP/Adder_For_DC_Comp/Adder_For_DC_Comp_stub.v}
// Design      : Adder_For_DC_Comp
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tftg256-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_14,Vivado 2022.2" *)
module Adder_For_DC_Comp(A, CLK, CE, S)
/* synthesis syn_black_box black_box_pad_pin="A[17:0],CLK,CE,S[18:0]" */;
  input [17:0]A;
  input CLK;
  input CE;
  output [18:0]S;
endmodule
