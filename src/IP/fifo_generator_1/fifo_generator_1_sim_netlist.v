// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Jun  5 15:04:59 2023
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
  wire [11:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [11:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [11:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "12" *) 
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
  (* C_PRIM_FIFO_TYPE = "4kx9" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "4089" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "4088" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "12" *) 
  (* C_RD_DEPTH = "4096" *) 
  (* C_RD_FREQ = "100" *) 
  (* C_RD_PNTR_WIDTH = "12" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "12" *) 
  (* C_WR_DEPTH = "4096" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "100" *) 
  (* C_WR_PNTR_WIDTH = "12" *) 
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
        .data_count(NLW_U0_data_count_UNCONNECTED[11:0]),
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[11:0]),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[11:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 62080)
`pragma protect data_block
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
SJQxEay9jg==
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
