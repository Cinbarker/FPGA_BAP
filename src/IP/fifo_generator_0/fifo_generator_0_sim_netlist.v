// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Fri Jun  2 23:42:27 2023
// Host        : LAPTOP-JIRJDU7E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Nicolas/Desktop/FPGA_BAP/src/IP/fifo_generator_0/fifo_generator_0_sim_netlist.v
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tftg256-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module fifo_generator_0
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 65000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [13:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [13:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;

  wire [13:0]din;
  wire [13:0]dout;
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
  (* C_DIN_WIDTH = "14" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "14" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1016" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1015" *) 
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
  (* C_WR_FREQ = "65" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_generator_0_fifo_generator_v13_2_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 53424)
`pragma protect data_block
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
DFO+rzQ+ZAuvcsXC+Axn
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
