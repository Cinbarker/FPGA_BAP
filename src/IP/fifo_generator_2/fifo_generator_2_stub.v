// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Jun 22 09:01:36 2023
// Host        : LAPTOP-JIRJDU7E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Nicolas/Desktop/FPGA_BAP/src/IP/fifo_generator_2/fifo_generator_2_stub.v
// Design      : fifo_generator_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tftg256-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *)
module fifo_generator_2(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  empty, valid)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[13:0],wr_en,rd_en,dout[13:0],full,empty,valid" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [13:0]din;
  input wr_en;
  input rd_en;
  output [13:0]dout;
  output full;
  output empty;
  output valid;
endmodule
