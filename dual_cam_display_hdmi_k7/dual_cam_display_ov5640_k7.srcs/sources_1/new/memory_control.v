`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: memory_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module memory_control#(
    parameter MEM_DATA_BITS          = 64,
    parameter ADDR_BITS              = 25,
    parameter BUSRT_BITS             = 10,
    parameter WRITE_DATA_BITS        = 16
)
(
    input clk_200MHz,
    input mmcm_locked,

    output ui_clk_o,
    output ui_clk_sync_rst_o,
    //burst write req
    input                               wr_burst_req,
    input  [BUSRT_BITS - 1:0]           wr_burst_len,
    input  [ADDR_BITS - 1:0]            wr_burst_addr,
    output                              wr_burst_data_req,
    input  [MEM_DATA_BITS - 1:0]        wr_burst_data,
    output                              wr_burst_finish,

    //burst read req
    input                          rd_burst_req,
    input   [BUSRT_BITS-1:0]       rd_burst_len,
    input   [ADDR_BITS-1:0]        rd_burst_addr,
    output                         rd_burst_data_valid,
    output  [MEM_DATA_BITS-1:0]    rd_burst_data,
    output                         rd_burst_finish ,

    //DDR3 ports
    output  [13:0]  ddr3_addr,
    output  [2:0]   ddr3_ba,
    output          ddr3_cas_n,
    output  [0:0]   ddr3_ck_n,
    output  [0:0]   ddr3_ck_p,
    output  [0:0]   ddr3_cke,
    output          ddr3_ras_n,
    output          ddr3_reset_n,
    output          ddr3_we_n,
    inout   [31:0]  ddr3_dq,
    inout   [3:0]   ddr3_dqs_n,
    inout   [3:0]   ddr3_dqs_p,
    output  [0:0]   ddr3_cs_n,
    output  [3:0]   ddr3_dm,
    output  [0:0]   ddr3_odt,
    output init_calib_complete

    );
wire ui_clk;
wire ui_clk_sync_rst;
// Master Write Address
wire [3:0]                      s00_axi_awid;
wire [63:0]                     s00_axi_awaddr;
wire [7:0]                      s00_axi_awlen;    // burst length: 0-255
wire [2:0]                      s00_axi_awsize;   // burst size: fixed 2'b011
wire [1:0]                      s00_axi_awburst;  // burst type: fixed 2'b01(incremental burst)
wire                            s00_axi_awlock;   // lock: fixed 2'b00
wire [3:0]                      s00_axi_awcache;  // cache: fiex 2'b0011
wire [2:0]                      s00_axi_awprot;   // protect: fixed 2'b000
wire [3:0]                      s00_axi_awqos;    // qos: fixed 2'b0000
wire [0:0]                      s00_axi_awuser;   // user: fixed 32'd0
wire                            s00_axi_awvalid;
wire                            s00_axi_awready;
// master write data
wire [63:0]                     s00_axi_wdata;
wire [7:0]                      s00_axi_wstrb;
wire                            s00_axi_wlast;
wire [0:0]                      s00_axi_wuser;
wire                            s00_axi_wvalid;
wire                            s00_axi_wready;
// master write response
wire [3:0]                      s00_axi_bid;
wire [1:0]                      s00_axi_bresp;
wire [0:0]                      s00_axi_buser;
wire                            s00_axi_bvalid;
wire                            s00_axi_bready;
// master read address
wire [3:0]                      s00_axi_arid;
wire [63:0]                     s00_axi_araddr;
wire [7:0]                      s00_axi_arlen;
wire [2:0]                      s00_axi_arsize;
wire [1:0]                      s00_axi_arburst;
wire [1:0]                      s00_axi_arlock;
wire [3:0]                      s00_axi_arcache;
wire [2:0]                      s00_axi_arprot;
wire [3:0]                      s00_axi_arqos;
wire [0:0]                      s00_axi_aruser;
wire                            s00_axi_arvalid;
wire                            s00_axi_arready;
// master read data
wire [3:0]                      s00_axi_rid;
wire [63:0]                     s00_axi_rdata;
wire [1:0]                      s00_axi_rresp;
wire                            s00_axi_rlast;
wire [0:0]                      s00_axi_ruser;
wire                            s00_axi_rvalid;
wire                            s00_axi_rready;


assign ui_clk_o = ui_clk;
assign ui_clk_sync_rst_o = ui_clk_sync_rst;



AXI_MASTER u_aq_axi_master
    (
      .ARESETN                     (~ui_clk_sync_rst                          ),
      .ACLK                        (ui_clk                                    ),
      .M_AXI_AWID                  (s00_axi_awid                              ),
      .M_AXI_AWADDR                (s00_axi_awaddr                            ),
      .M_AXI_AWLEN                 (s00_axi_awlen                             ),
      .M_AXI_AWSIZE                (s00_axi_awsize                            ),
      .M_AXI_AWBURST               (s00_axi_awburst                           ),
      .M_AXI_AWLOCK                (s00_axi_awlock                            ),
      .M_AXI_AWCACHE               (s00_axi_awcache                           ),
      .M_AXI_AWPROT                (s00_axi_awprot                            ),
      .M_AXI_AWQOS                 (s00_axi_awqos                             ),
      .M_AXI_AWUSER                (s00_axi_awuser                            ),
      .M_AXI_AWVALID               (s00_axi_awvalid                           ),
      .M_AXI_AWREADY               (s00_axi_awready                           ),
      .M_AXI_WDATA                 (s00_axi_wdata                             ),
      .M_AXI_WSTRB                 (s00_axi_wstrb                             ),
      .M_AXI_WLAST                 (s00_axi_wlast                             ),
      .M_AXI_WUSER                 (s00_axi_wuser                             ),
      .M_AXI_WVALID                (s00_axi_wvalid                            ),
      .M_AXI_WREADY                (s00_axi_wready                            ),
      .M_AXI_BID                   (s00_axi_bid                               ),
      .M_AXI_BRESP                 (s00_axi_bresp                             ),
      .M_AXI_BUSER                 (s00_axi_buser                             ),
      .M_AXI_BVALID                (s00_axi_bvalid                            ),
      .M_AXI_BREADY                (s00_axi_bready                            ),
      .M_AXI_ARID                  (s00_axi_arid                              ),
      .M_AXI_ARADDR                (s00_axi_araddr                            ),
      .M_AXI_ARLEN                 (s00_axi_arlen                             ),
      .M_AXI_ARSIZE                (s00_axi_arsize                            ),
      .M_AXI_ARBURST               (s00_axi_arburst                           ),
      .M_AXI_ARLOCK                (s00_axi_arlock                            ),
      .M_AXI_ARCACHE               (s00_axi_arcache                           ),
      .M_AXI_ARPROT                (s00_axi_arprot                            ),
      .M_AXI_ARQOS                 (s00_axi_arqos                             ),
      .M_AXI_ARUSER                (s00_axi_aruser                            ),
      .M_AXI_ARVALID               (s00_axi_arvalid                           ),
      .M_AXI_ARREADY               (s00_axi_arready                           ),
      .M_AXI_RID                   (s00_axi_rid                               ),
      .M_AXI_RDATA                 (s00_axi_rdata                             ),
      .M_AXI_RRESP                 (s00_axi_rresp                             ),
      .M_AXI_RLAST                 (s00_axi_rlast                             ),
      .M_AXI_RUSER                 (s00_axi_ruser                             ),
      .M_AXI_RVALID                (s00_axi_rvalid                            ),
      .M_AXI_RREADY                (s00_axi_rready                            ),
           // Local Bus
       //Write_FIFO
      .WR_START                    (wr_burst_req          ),
      .WR_ADRS                     ({wr_burst_addr,3'd0}  ),
      .WR_LEN                      ({wr_burst_len,3'd0}   ),
      .WR_READY                    (                      ),
      .WR_FIFO_RE                  (wr_burst_data_req     ),
      .WR_FIFO_DATA                (wr_burst_data         ),
      .WR_DONE                     (wr_burst_finish       ),
      //READ_FIFO  
      .RD_START                    (rd_burst_req          ),
      .RD_ADRS                     ({rd_burst_addr,3'd0}  ),
      .RD_LEN                      ({rd_burst_len,3'd0}   ),
      .RD_READY                    (                      ),
      .RD_FIFO_WE                  (rd_burst_data_valid   ),
      .RD_FIFO_DATA                (rd_burst_data         ),
      .RD_DONE                     (rd_burst_finish       )
);  



ddr3 mig_inst (
    // Memory interface ports
    .ddr3_addr                   (ddr3_addr             ), 
    .ddr3_ba                     (ddr3_ba               ), 
    .ddr3_cas_n                  (ddr3_cas_n            ), 
    .ddr3_ck_n                   (ddr3_ck_n             ), 
    .ddr3_ck_p                   (ddr3_ck_p             ),
    .ddr3_cke                    (ddr3_cke              ),  
    .ddr3_ras_n                  (ddr3_ras_n            ), 
    .ddr3_reset_n                (ddr3_reset_n          ), 
    .ddr3_we_n                   (ddr3_we_n             ),  
    .ddr3_dq                     (ddr3_dq               ),  
    .ddr3_dqs_n                  (ddr3_dqs_n            ),  
    .ddr3_dqs_p                  (ddr3_dqs_p            ),  
    .init_calib_complete         (init_calib_complete),  
     
    .ddr3_cs_n                   (ddr3_cs_n             ),  
    .ddr3_dm                     (ddr3_dm               ),  
    .ddr3_odt                    (ddr3_odt              ),  
    // Application interface ports
    .ui_clk                      (ui_clk                ), 
    .ui_clk_sync_rst             (ui_clk_sync_rst       ),  // output                       ui_clk_sync_rst
    .mmcm_locked                 (                      ),  // output                       mmcm_locked
    .aresetn                     (1'b1                  ),  // input                        aresetn
    .app_sr_req                  (1'b0                  ),  // input                        app_sr_req
    .app_ref_req                 (1'b0                  ),  // input                        app_ref_req
    .app_zq_req                  (1'b0                  ),  // input                        app_zq_req
    .app_sr_active               (                      ),  // output                       app_sr_active
    .app_ref_ack                 (                      ),  // output                       app_ref_ack
    .app_zq_ack                  (                      ),  // output                       app_zq_ack
    // Slave Interface Write Address Ports
    .s_axi_awid                  (s00_axi_awid      ),  // input [0 :0]         s_axi_awid
    .s_axi_awaddr                (s00_axi_awaddr    ),  // input [29:0]         s_axi_awaddr
    .s_axi_awlen                 (s00_axi_awlen     ),  // input [7 :0]         s_axi_awlen
    .s_axi_awsize                (s00_axi_awsize    ),  // input [2 :0]         s_axi_awsize
    .s_axi_awburst               (s00_axi_awburst   ),  // input [1 :0]         s_axi_awburst
    .s_axi_awlock                (s00_axi_awlock    ),  // input [0 :0]         s_axi_awlock
    .s_axi_awcache               (s00_axi_awcache   ),  // input [3 :0]         s_axi_awcache
    .s_axi_awprot                (s00_axi_awprot    ),  // input [2 :0]         s_axi_awprot
    .s_axi_awqos                 (s00_axi_awqos     ),  // input [3 :0]         s_axi_awqos
    .s_axi_awvalid               (s00_axi_awvalid   ),  // input                s_axi_awvalid
    .s_axi_awready               (s00_axi_awready   ),  // output               s_axi_awready
    // Slave Interface Write Data Ports
    .s_axi_wdata                 (s00_axi_wdata     ),  // input [63:0]         s_axi_wdata
    .s_axi_wstrb                 (s00_axi_wstrb     ),  // input [7 :0]         s_axi_wstrb
    .s_axi_wlast                 (s00_axi_wlast     ),  // input                s_axi_wlast
    .s_axi_wvalid                (s00_axi_wvalid    ),  // input                s_axi_wvalid
    .s_axi_wready                (s00_axi_wready    ),  // output               s_axi_wready
    // Slave Interface Write Response Ports
    .s_axi_bid                   (s00_axi_bid           ),  // output [0:0]     s_axi_bid
    .s_axi_bresp                 (s00_axi_bresp     ),  // output [1:0]         s_axi_bresp
    .s_axi_bvalid                (s00_axi_bvalid    ),  // output               s_axi_bvalid
    .s_axi_bready                (s00_axi_bready    ),  // input                s_axi_bready
    // Slave Interface Read Address Ports
    .s_axi_arid                  (s00_axi_arid      ),  // input [0 :0]         s_axi_arid
    .s_axi_araddr                (s00_axi_araddr    ),  // input [29:0]         s_axi_araddr
    .s_axi_arlen                 (s00_axi_arlen     ),  // input [7 :0]         s_axi_arlen
    .s_axi_arsize                (s00_axi_arsize    ),  // input [2 :0]         s_axi_arsize
    .s_axi_arburst               (s00_axi_arburst   ),  // input [1 :0]         s_axi_arburst
    .s_axi_arlock                (s00_axi_arlock    ),  // input [0 :0]         s_axi_arlock
    .s_axi_arcache               (s00_axi_arcache   ),  // input [3 :0]         s_axi_arcache
    .s_axi_arprot                (s00_axi_arprot    ),  // input [2 :0]         s_axi_arprot
    .s_axi_arqos                 (s00_axi_arqos     ),  // input [3 :0]         s_axi_arqos
    .s_axi_arvalid               (s00_axi_arvalid   ),  // input                        s_axi_arvalid
    .s_axi_arready               (s00_axi_arready   ),  // output                       s_axi_arready
    // Slave Interface Read Data Ports
    .s_axi_rid                   (s00_axi_rid           ),  // output [0 :0]        s_axi_rid
    .s_axi_rdata                 (s00_axi_rdata     ),  // output [63:0]        s_axi_rdata
    .s_axi_rresp                 (s00_axi_rresp     ),  // output [1 :0]        s_axi_rresp
    .s_axi_rlast                 (s00_axi_rlast     ),  // output                       s_axi_rlast
    .s_axi_rvalid                (s00_axi_rvalid    ),  // output                       s_axi_rvalid
    .s_axi_rready                (s00_axi_rready    ),  // input                        s_axi_rready
    // System Clock Ports
    .sys_clk_i                   (clk_200MHz        ),
    .sys_rst                     (mmcm_locked       )   // input sys_rst
);

endmodule
