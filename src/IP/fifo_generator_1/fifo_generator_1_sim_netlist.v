// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Jun  3 01:56:55 2023
// Host        : LAPTOP-JIRJDU7E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top fifo_generator_1 -prefix
//               fifo_generator_1_ fifo_generator_1_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52912)
`pragma protect data_block
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
JMbhOuOl/8i7kbz387ZGIw==
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
