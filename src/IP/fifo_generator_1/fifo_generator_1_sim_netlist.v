// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Jun  3 01:56:56 2023
// Host        : LAPTOP-JIRJDU7E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Nicolas/Desktop/FPGA_BAP/src/IP/fifo_generator_1/fifo_generator_1_sim_netlist.v
// Design      : fifo_generator_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tftg256-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_1,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module fifo_generator_1
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    valid);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [15:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [15:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;

  wire [15:0]din;
  wire [15:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rst;
  wire valid;
  wire wr_clk;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "16" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "16" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "6" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "7" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1017" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1016" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "100" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "100" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_generator_1_fifo_generator_v13_2_7 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(valid),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
uS/dIpDTldS7400uyLsI6bJxO+WmZJrKXsU8qB+wpyI+d4PWZVO6Cm0qMQFNUZb63p6zCI5fvnQy
SxjaSP1nCte/oQZc55w1rQbTqy54T9kryRoH26nDjSBVZvJ8hffw7NONwiKrqeB6I7HJKX5RKw73
wIJxNNH7BCiCEtRLIxc=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L7q2sHnC0pU7uHs8shPm9nAcqyU+hUFnNkd6BPHl+ureEVBUvubWhEbLRLiFFJveufcmAfAXTzae
tWbKcVVt/zKzWEtv0onUXoSEgyS4+QaTAFeCPHR2bbnlP0aCCG2SYmC1dv16cFoAk/NLitClNXAv
h+UBGzod+suWv55DaNHeHtSZ/YLZxHdn/R47atTiQM+A1TWQkpa3faF/L9ANZISSe/OR6mPfQ/Zk
4AptHNmW/pWpd3JL4e06iK9P6ZLLRqSMR9mu6AFIeWYBVz+KkxgSIWgQO7/AHBUFjlIiMFhyQR5Y
UC1fo4CPZX7fMdUPwQiC+eZ7UtxMAUzovIzwEw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KZhqqPnSEvcItoYRHrFT/Wt2IEXHe7pq5lmAOfYqAaaoY8mpIG3Kd8B/C4s9kNUbktSOX78NnnrJ
brxcu/1EAlI9itnDH8ahxble+2Nt/Lj3dQ1/wbDy3HOKlwBVuOvVDArOpgho+BAnoLUZXrpsw8EI
FSIPKmsETVzLzZDw6m0=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WZbb0PsQl1vn7dY/rZzI8ZGsAP5Ad4C/d2cBXS49yTbQqKMTY7r1YHlrjBGteY6wrhKVmM92u/3/
/UJWPyNVqwcsrRAHhR/Lp3Mg87NIhYzETdNAOpnc7rWC9ieIeEiyPM734sI7QtAMVrZxXoUXnCjp
fjQhaMqv+HsuEWpFhDail+v8Ftwmr5xP1JSpqPfxLz5a6+q8/lTxRGeWZokM7vP2YFKg7L7Yoowh
gOm5w3JhR2fXZsksWxfQk7885JzsI4yZOrU8dY667YWWhkjZE/SKo2TMksiasL22T6CpyUbMwQm2
DJ+cMJbr9/8csBEifIsopc4V9zFbSU9eoxlqZA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Adid/GOKDljgmM7UpkmD6EVL+5rt6bnWK9P8RIZiI3EkLW96rM6eCs7jkLeKnEW/WPGRhlZrGw8p
C7Ni27oibJKJT5xUBJDymbO+yheaaTI0GaeDMIzks860gYA3qdvTPxTBotaOg6MIpnYd070NhTod
Qq5XNnxLuF7/s5rAZANJHyRQKwu4gVBfs5SU2FSjF546M5FvN7BX6G7B76ALW6vKqGyKxwoHkc52
Bm8/jGTxJ6zbwn2v31NEfjO6nM5m6yYwY0476QLXWI6+7/ILkSvDVTt7B9HpcaRg3n3T4AEQDMyX
8bBPgm0qFbWZue0dlr9ljYOl0dgwaO8G9uYe9g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tq2b3cw7fnIOEbRUxnQIgAjXwRE3aRwj2IBVmS0S998fvCLPMUtm5MVXAqk0TwuEzKG3br/oRham
Oe5KAx6FauTTVpRhLH5RY3832M9OVTSW/bNq12/dXnJyOfYS76FQtd9HNFrSkVPMONGMD0ZQXRic
Yr0MaeflUHQmU6QUCt5OJkbG4F8qJLMWJsg03K7dNzDfkvev3QVf72bmHTm4SF6/cs94NXQl/NPr
CzQorTZ5BgCzVAui7mM0eu3mu6OPkecNQ3Ih+1zsJuGkAHWC7aFgh7ii6xEj1upD365TzJUF1ZCe
0jZj/Ub1m5OgZMbjbLYn/Fh5nqi+fAmL7jDAHQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
S+EkimFGNL3D/SKyjUVYhIZzRbEoTqlnv2kHD0e4rYYCt/O4IYecNmch6HRfd2U/WSZPkAoJ+xa7
GKQSo51PL81HSvqURo2CxltObyTYiklnzGtbdWUMpOSCjDe8LpQjUNwhSksWjZjUQypyYXS4hbCR
VJy96ow8zi5m1XMzoLaVMDYoJYLtOVh7eaL7InaIL5gXJIHWkhoKYh9bR/O5HE6YTsgZl+Ofmx/3
0mQ/bL5ZKSY6gBEUD8f5+SoMIjfXrGkjMj1+fEAIv0fO/wKyJQMKnDOgWMvcUw56dOJ7FWkbNvbC
kzquuXhk5LuzZfXWmhyDSyMGBWK1wN7iyMKMUg==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
LQ4hjhkD/G9XJd+gVR5WF2vSll/p8/psR+nHjJ5/DHrtiRqVWFVc7B7T9XZuJBmTqrQV4iSBYWDo
zNaVdq26mGk6TTNo11Dcici0hEwC2Bg66k9kr1if+0iZo3VtB/ZuEOj2w7euhFo3ja1OovnDXxf0
8t4WMUK68mfUiMuKgVcbOFhm3Jdnbnz4u7SggH2/rkfOS8jbon9q9n0EXlK23tz2NzDLCS8B7ERx
dYvwqwBiySKoP1/EcfSwFNIWpr6p7kbRo7iM/JbP6UwBbkDHgE8HGS+3lTXIUXsmGmsx6EDSr/gY
i7lHwZTmDuhuIEJaf6gTJgtqMSxVyDVsrnba5umKgV8z5OOWUkM3FjVWIXOG7Ef2iKFCzBPmp2Lk
8XbrXk/bb9H/jr4UR3hgdbizISTysLTJd4n5uyeDhDgkxAc+1FudacmuZyBlA/VTR1f0i9+cOgLI
kdqbo1u5hQwnMphluBKjdTA3nZ8VnpDbdq5R7hIF61tIrUfdjwQw02je

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
JzhYMwmYowESMI19XNb+BEFcZw3IXZpwZO3gzrVg2CdSjbAR3tiIVbPHI5Rgu59SH7H8abU59Atd
+nrPiG37rmU6CD+cMV2mU8SHfCDLYsnrbd9YLZ1GEfqTovR0NZHQTHj+7c5dP7nqm30C/kg1adqd
DOV7F128PbmM5U45xRxOJKUgS/Waz0gvmYKKJejkiyFPOgGbN5f844mtysoOckLrAU/BzRs8SB9G
zzisK/a8hM5af8/opZ64TGhH44Npzy8kcP+gI+k+U0oF0SOqW7CjadKaJhr2oDkTScVVCbBqFEjc
2gH862vcCfZu5Cd0Sp2ALgoqVxA+91lAIHJp3Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ooNS+XjsaWLRgvcrNWVpR3ihKtIJNT1oT4D5ivD5mCfw+4/SAyx9P4cmdvOotLNPE1eqvx1Smd9Q
LDImL/GqS7Cq3KEUtEBbvQAOp+0SjiW74cC6nyOqCA8NQcn5JM+vUzGSsORPnM5qP96axGmyEvSi
p3uL9Gmx+3S3KUJuAzfuqZwJD7gdcA0Zv3hPRl+xhx8qFtkPCfT5uj7wpFVaaJ8tTl1SDd2uRUIx
rgVgV+oERCg71oEVN7PqPK1y7pFVgSW9uhP1wuvO/EsbyrLYZV6HtBn3tJDcxhTsQWrrou3F1kFQ
cFnl9tcL1wXJo/F3wvsbYM1W0UPHv69XAsEUhg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d8YRbu+fllaHlNDedyRNDRtn9CBoVbO9fZCdhKpy0yf9dL6A08sFZuWVtVGljxF/L9volGB0IRjl
KbH2N/JBQA+tZWuh75kK5pjveAAKLVACS8A+Jmt/mrxzlolPWsruJ8o1Owrjq5tGWspdqmeDGS7U
/Ww7cN0C9ExUj4cjRDcKaqDS9MGwRtx4LfcQbQbRDZBk+cyRaWCchvmhjoum4uTizvqMq2u4oSym
t2zyKFjAuMO4zC2LbPbODeumm+FhlOKAHRyEBKA+VQeLB4apkMYparuD5AFWAuVvdWEbGq/L4cJ7
pEGz+6Hqi68CfF/4tMNiyHveP1lxnyAaiW6Kjg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 53280)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
