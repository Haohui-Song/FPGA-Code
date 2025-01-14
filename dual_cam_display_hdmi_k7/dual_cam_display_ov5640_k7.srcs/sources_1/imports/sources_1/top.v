// -----------------------------------------------------------------------------
// Copyright (c) 2014-2022 All rights reserved
// -----------------------------------------------------------------------------
// Author : SiChen Gu  thinkchip2018@163.com
// File   : frame_fifo_read_state.v
// Create : 2022-05-05 17:23:19
// Revise : 2022-05-05 17:23:19
// Editor : sublime text4, tab size (4)
// -----------------------------------------------------------------------------



module top(
	input                       sys_clk,						//Ê±ÖÓÐÅºÅ
	//input                       rst_n,						//¸´Î»ÐÅºÅ
	
	//ÐÅºÅ²É¼¯CMOS1½Ó¿Ú

	inout                       cmos1_scl,          //cmos i2c clock
	inout                       cmos1_sda,          //cmos i2c data
	input                       cmos1_vsync,        //cmos vsync
	input                       cmos1_href,         //cmos hsync refrence,data valid
	input                       cmos1_pclk,         //cmos pxiel clock
	input   [7:0]               cmos1_db,           //cmos data
	output                      cmos1_rst_n,        //cmos reset
	
	//ÐÅºÅ²É¼¯CMOS2½Ó¿Ú
	inout                       cmos2_scl,          //cmos i2c clock
	inout                       cmos2_sda,          //cmos i2c data
    input                     cmos2_vsync,        //cmos vsync
    input                     cmos2_href,         //cmos hsync refrence,data valid
	input                       cmos2_pclk,         //cmos pxiel clock
	input   [7:0]               cmos2_db,           //cmos data
	output                      cmos2_rst_n,        //cmos reset
	
	//Êý¾Ý´æ´¢DDR½Ó¿Ú
	/*
	inout [15:0]                ddr3_dq,
	inout [1:0]                 ddr3_dqs_n,
	inout [1:0]                 ddr3_dqs_p,
	output [13:0]               ddr3_addr,
	output [2:0]                ddr3_ba,
	output                      ddr3_ras_n,
	output                      ddr3_cas_n,
	output                      ddr3_we_n,
	output                      ddr3_reset_n,
	output[0:0]                 ddr3_ck_p,
	output[0:0]                 ddr3_ck_n,
	output[0:0]                 ddr3_cke,
	output[0:0]                 ddr3_cs_n,
	output[1:0]                 ddr3_dm,
	output[0:0]                 ddr3_odt,
	*/
	output wire [13:0]	ddr3_addr,
	output wire [2:0]	ddr3_ba,
	output wire			ddr3_cas_n,
	output wire [0:0]	ddr3_ck_n,
	output wire [0:0]	ddr3_ck_p,
	output wire [0:0]	ddr3_cke,
	output wire			ddr3_ras_n,
	output wire			ddr3_reset_n,
	output wire			ddr3_we_n,
	inout  wire [31:0]	ddr3_dq,
	inout  wire [3:0]	ddr3_dqs_n,
	inout  wire [3:0]	ddr3_dqs_p,
	output wire [0:0]	ddr3_cs_n,
	output wire [3:0]	ddr3_dm,
	output wire [0:0]	ddr3_odt,
	//output init_calib_complete,

	//HDMI½Ó¿Ú output        
  output                      tmds_clk_p,				 //²î·ÖÊ±ÖÓ
  output                      tmds_clk_n,				 //
  output[2:0]                 tmds_data_p,       //rgb
  output[2:0]                 tmds_data_n,       //rgb
  output [0:0]                HDMI_OEN					 //HDMIÊ¹ÄÜ
);
parameter MEM_DATA_BITS          = 64;           //external memory user interface data width
parameter ADDR_BITS              = 25;           //external memory user interface address width
parameter BUSRT_BITS             = 10;           //external memory user interface burst width


parameter WRITE_DATA_BITS        = 16;

//
wire                            wr_burst_data_req;
wire                            wr_burst_finish;
wire                            rd_burst_finish;
wire                            rd_burst_req;
wire                            wr_burst_req;
wire[BUSRT_BITS-1:0]            rd_burst_len;
wire[BUSRT_BITS-1:0]            wr_burst_len;
wire[ADDR_BITS- 1:0]            rd_burst_addr;
wire[ADDR_BITS- 1:0]            wr_burst_addr;
wire                            rd_burst_data_valid;
wire[MEM_DATA_BITS - 1 : 0]     rd_burst_data;
wire[MEM_DATA_BITS - 1 : 0]     wr_burst_data;

wire                            ch0_wr_burst_data_req;
wire                            ch0_wr_burst_finish;
wire                            ch0_rd_burst_finish;
wire                            ch0_rd_burst_req;
wire                            ch0_wr_burst_req;
wire[BUSRT_BITS - 1:0]          ch0_rd_burst_len;
wire[BUSRT_BITS - 1:0]          ch0_wr_burst_len;
wire[ADDR_BITS - 1:0]           ch0_rd_burst_addr;
wire[ADDR_BITS - 1:0]           ch0_wr_burst_addr;
wire                            ch0_rd_burst_data_valid;
wire[MEM_DATA_BITS - 1 : 0]     ch0_rd_burst_data;
wire[MEM_DATA_BITS - 1 : 0]     ch0_wr_burst_data;
wire                            ch0_read_req;
wire                            ch0_read_req_ack;
wire                            ch0_read_en;
wire[15:0]                      ch0_read_data;
wire                            ch0_write_en;
wire[15:0]                      ch0_write_data;
wire                            ch0_write_req;
wire                            ch0_write_req_ack;
wire[1:0]                       ch0_write_addr_index;
wire[1:0]                       ch0_read_addr_index;

wire                            ch1_wr_burst_data_req;
wire                            ch1_wr_burst_finish;
wire                            ch1_rd_burst_finish;
wire                            ch1_rd_burst_req;
wire                            ch1_wr_burst_req;
wire[BUSRT_BITS - 1:0]          ch1_rd_burst_len;
wire[BUSRT_BITS - 1:0]          ch1_wr_burst_len;
wire[ADDR_BITS - 1:0]           ch1_rd_burst_addr;
wire[ADDR_BITS - 1:0]           ch1_wr_burst_addr;
wire                            ch1_rd_burst_data_valid;
wire[MEM_DATA_BITS - 1 : 0]     ch1_rd_burst_data;
wire[MEM_DATA_BITS - 1 : 0]     ch1_wr_burst_data;
wire                            ch1_read_req;
wire                            ch1_read_req_ack;
wire                            ch1_read_en;
wire[15:0]                      ch1_read_data;
wire                            ch1_write_en;
wire[15:0]                      ch1_write_data;
wire                            ch1_write_req;
wire                            ch1_write_req_ack;
wire[1:0]                       ch1_write_addr_index;
wire[1:0]                       ch1_read_addr_index;

wire                            video_clk;                 //video pixel clock
wire                            video_clk5x;
wire                            hs;
wire                            vs;
wire                            de;


wire[15:0]                      vout_data;
wire[15:0]                      cmos1_16bit_data;
wire                            cmos1_16bit_wr;
wire[9:0]                       cmos1_lut_index;
wire[31:0]                      cmos1_lut_data;

wire[15:0]                      cmos2_16bit_data;
wire                            cmos2_16bit_wr;
wire[9:0]                       cmos2_lut_index;
wire[31:0]                      cmos2_lut_data;

wire                            ui_clk;
wire                            ui_clk_sync_rst;
wire                            init_calib_complete;
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

wire                            hdmi_hs;
wire                            hdmi_vs;
wire                            hdmi_de;
wire[7:0]                       hdmi_r;
wire[7:0]                       hdmi_g;
wire[7:0]                       hdmi_b;
wire                            clk_200MHz;
wire                            clk_50MHz;
//wire rst_n;
wire clk_25MHz;
wire glbl_rst;
//¸´Î»ÐÅºÅ
//assign rst_n =1'b1;

//HDMIÐÐ³¡ÐÅºÅRGBÐÅºÅRGB565
assign hdmi_hs     = hs;
assign hdmi_vs     = vs;
assign hdmi_de     = de;
assign hdmi_r      = {vout_data[15:11],3'd0};
assign hdmi_g      = {vout_data[10: 5],2'd0};
assign hdmi_b      = {vout_data[4 : 0],3'd0};

//
assign HDMI_OEN    = 1'b1;


wire mem_rst;
wire video_rst;
wire p_reset;

wire cmos1_config_done;
wire cmos2_config_done;

	clocks inst_clocks
		(
			.sys_clk     (sys_clk),
			.glbl_rst    (glbl_rst),
			.mmcm_locked (mmcm_locked),
			.clk_200MHz  (clk_200MHz),
			.clk_50MHz   (clk_50MHz),
			.clk_25MHz   (clk_25MHz),
			.video_clk5x (video_clk5x),
			.video_clk   (video_clk)
		);

	top_resets inst_top_resets
		(
			.video_clk           (video_clk),
			.mem_clk             (ui_clk),
			.init_calib_complete (init_calib_complete),
			.mmcm_locked         (mmcm_locked),
			.mem_rst             (mem_rst),
			.video_rst           (video_rst)

		);





//Í¨µÀ1ÅäÖÃ
(*Keep_hierarchy = "yes"*)channel_capture
#(
	.MEM_DATA_BITS       (MEM_DATA_BITS	 ),
	.WRITE_DATA_BITS     (WRITE_DATA_BITS),
	.ADDR_BITS           (ADDR_BITS			 ),
	.BUSRT_BITS          (BUSRT_BITS     )
)
channel1_capture
(
	.rst           		   (~mmcm_locked             		),
	.ui_clk        			 (ui_clk            		 	),
	.clk_50MHz					 (clk_50MHz								),				//Ê±ÖÓ
	.clk_25MHz 				   (clk_25MHz   					  ),
	//IIC	ÅäÖÃ¿Ú
	.cmos_scl			       (cmos1_scl					      ),    		//cmos i2c clock
	.cmos_sda				     (cmos1_sda					      ),    		//cmos i2c data
	.cmos_vsync			     (cmos1_vsync				      ),        //cmos vsync
	.cmos_href			     (cmos1_href				      ),        //cmos hsync refrence,data valid
	.cmos_pclk			     (cmos1_pclk				      ),        //cmos pxiel clock
	.cmos_db				     (cmos1_db					      ),        //cmos data
	.cmos_rst_n			     (cmos1_rst_n				      ),        //cmos reset
	.cmos_config_done		 (cmos1_config_done       ),
	
	//Êý¾Ý·¢ËÍ¸øÖÙ²ÃÄ£¿é½Ó¿Ú
	.read_addr_index		 (ch0_read_addr_index			 ),
	.wr_burst_req        (ch0_wr_burst_req         ),
	.wr_burst_len        (ch0_wr_burst_len         ),
	.wr_burst_addr       (ch0_wr_burst_addr        ),
	.wr_burst_data_req   (ch0_wr_burst_data_req    ),
	.wr_burst_data       (ch0_wr_burst_data        ),
	.wr_burst_finish     (ch0_wr_burst_finish      ),
	.write_finish        (                         ),
	.write_addr_0        (25'd0                    ),
	.write_addr_1        (25'd2073600              ),
	.write_addr_2        (25'd4147200              ),
	.write_addr_3        (25'd6220800              ),
	.write_len           (25'd196608               )
  );

//Í¨µÀ2ÅäÖÃ
(*Keep_hierarchy = "yes"*)channel_capture 
#(
	.MEM_DATA_BITS       (MEM_DATA_BITS	),
	.WRITE_DATA_BITS     (WRITE_DATA_BITS),
	.ADDR_BITS           (ADDR_BITS			),
	.BUSRT_BITS          (BUSRT_BITS     )
)
channel2_capture
(
	.rst           		   (~mmcm_locked             		),
	.ui_clk        		   (ui_clk            		 	),
	.clk_50MHz				   (clk_50MHz						    ),						  //Ê±ÖÓ
	.clk_25MHz 				   (clk_25MHz   					  ),
	//IIC	ÅäÖÃ¿Ú
	.cmos_scl			       (cmos2_scl					      ),    		//cmos i2c clock
	.cmos_sda				     (cmos2_sda					      ),    		//cmos i2c data
	.cmos_vsync			     (cmos2_vsync				      ),        //cmos vsync
	.cmos_href			     (cmos2_href				      ),        //cmos hsync refrence,data valid
	.cmos_pclk			     (cmos2_pclk				      ),        //cmos pxiel clock
	.cmos_db				     (cmos2_db					      ),        //cmos data
	.cmos_rst_n			     (cmos2_rst_n				      ),        //cmos reset
	.cmos_config_done		 (cmos2_config_done       ),
	
	//Êý¾Ý·¢ËÍ¸øÖÙ²ÃÄ£¿é½Ó¿Ú
	.read_addr_index		 (ch1_read_addr_index			 ),
	.wr_burst_req        (ch1_wr_burst_req         ),
	.wr_burst_len        (ch1_wr_burst_len         ),
	.wr_burst_addr       (ch1_wr_burst_addr        ),
	.wr_burst_data_req   (ch1_wr_burst_data_req    ),
	.wr_burst_data       (ch1_wr_burst_data        ),
	.wr_burst_finish     (ch1_wr_burst_finish      ),
	.write_finish        (                         ),
	.write_addr_0        (25'd8294400              ),
	.write_addr_1        (25'd10368000             ),
	.write_addr_2        (25'd12441600             ),
	.write_addr_3        (25'd14515200             ),
	.write_len           (25'd196608               )
  );



rgb2dvi_0 hdmi_inst (
  .TMDS_Clk_p (tmds_clk_p     ),
  .TMDS_Clk_n (tmds_clk_n     ),
  .TMDS_Data_p(tmds_data_p    ),
  .TMDS_Data_n(tmds_data_n    ),
  .aRst(1'b0		),                // input wire aRst
  .vid_pData({hdmi_r,hdmi_b,hdmi_g}),      // input wire [23 : 0] vid_pData
  .vid_pVDE(hdmi_de),        // input wire vid_pVDE
  .vid_pHSync(hdmi_hs),    // input wire vid_pHSync
  .vid_pVSync(hdmi_vs),    // input wire vid_pVSync
  .PixelClk(video_clk),        // input wire PixelClk
  .SerialClk(video_clk5x)      // input wire SerialClk
);

wire                 color_bar_hs;
wire                 color_bar_vs;
wire                 color_bar_de;
wire[7:0]            color_bar_r;
wire[7:0]            color_bar_g;
wire[7:0]            color_bar_b;
wire                 v0_hs;
wire                 v0_vs;
wire                 v0_de;
wire[23:0]           v0_data;

//video output timing generator 
color_bar color_bar_m0(
	.clk             (video_clk   				),
	.rst             (video_rst      				),
	.hs              (color_bar_hs				),
	.vs              (color_bar_vs				),
	.de              (color_bar_de				),
	.rgb_r           (color_bar_r 				),
	.rgb_g           (color_bar_g 				),
	.rgb_b           (color_bar_b 				)
);

//generate a frame read data request
video_rect_read_data video_rect_read_data_m0
(
	.video_clk         (video_clk                ),
	.rst               (video_rst                 ),
	.video_left_offset (12'd0                    ),
	.video_top_offset  (12'd0                    ),
	.video_width       (12'd640                  ),
	.video_height	     (12'd480                  ),
	.read_req          (ch0_read_req             ),
	.read_req_ack      (ch0_read_req_ack         ),
	.read_en           (ch0_read_en              ),
	.read_data         (ch0_read_data            ),
	.timing_hs         (color_bar_hs             ),
	.timing_vs         (color_bar_vs             ),
	.timing_de         (color_bar_de             ),
	.timing_data 	     ({color_bar_r[4:0],color_bar_g[5:0],color_bar_b[4:0]}),
	.hs                (v0_hs                    ),
	.vs                (v0_vs                    ),
	.de                (v0_de                    ),
	.vout_data         (v0_data                  )
);

video_rect_read_data video_rect_read_data_m1
(
	.video_clk         (video_clk                ),
	.rst               (video_rst                  ),
	.video_left_offset (12'd640                  ),
	.video_top_offset  (12'd0                    ),
	.video_width       (12'd640                  ),
	.video_height	     (12'd480                  ),
	.read_req          (ch1_read_req             ),
	.read_req_ack      (ch1_read_req_ack         ),
	.read_en           (ch1_read_en              ),
	.read_data         (ch1_read_data            ),
	.timing_hs         (v0_hs                    ),
	.timing_vs         (v0_vs                    ),
	.timing_de         (v0_de                    ),
	.timing_data 	     (v0_data                  ),
	.hs                (hs                       ),
	.vs                (vs                       ),
	.de                (de                       ),
	.vout_data         (vout_data                )
);
//video frame data read-write control
(*Keep_hierarchy = "yes"*)frame_read frame_read_m0
(
	.rst                 (mem_rst                   ),
	.mem_clk             (ui_clk                   ),
	.rd_burst_req        (ch0_rd_burst_req         ),
	.rd_burst_len        (ch0_rd_burst_len         ),
	.rd_burst_addr       (ch0_rd_burst_addr        ),
	.rd_burst_data_valid (ch0_rd_burst_data_valid  ),
	.rd_burst_data       (ch0_rd_burst_data        ),
	.rd_burst_finish     (ch0_rd_burst_finish      ),
	.read_clk            (video_clk                ),
	.read_req            (ch0_read_req             ),
	.read_req_ack        (ch0_read_req_ack         ),
	.read_finish         (                         ),
	.read_addr_0         (25'd0                    ), //The first frame address is 0
	.read_addr_1         (25'd2073600              ), //The second frame address is 25'd2073600 ,large enough address space for one frame of video
	.read_addr_2         (25'd4147200              ),
	.read_addr_3         (25'd6220800              ),
	.read_addr_index     (ch0_read_addr_index      ),
	.read_len            (25'd196608               ),//frame size  1024 * 768 * 16 / 64
	.read_en             (ch0_read_en              ),
	.read_data           (ch0_read_data            )
);

(*Keep_hierarchy = "yes"*)frame_read frame_read_m1
(
	.rst                        (mem_rst                  ),
	.mem_clk                    (ui_clk                   ),
	.rd_burst_req               (ch1_rd_burst_req         ),
	.rd_burst_len               (ch1_rd_burst_len         ),
	.rd_burst_addr              (ch1_rd_burst_addr        ),
	.rd_burst_data_valid        (ch1_rd_burst_data_valid  ),
	.rd_burst_data              (ch1_rd_burst_data        ),
	.rd_burst_finish            (ch1_rd_burst_finish      ),
	.read_clk                   (video_clk                ),
	.read_req                   (ch1_read_req             ),
	.read_req_ack               (ch1_read_req_ack         ),
	.read_finish                (                         ),
	.read_addr_0                (25'd8294400              ), //The first frame address is 0
	.read_addr_1                (25'd10368000             ), //The second frame address is 25'd2073600 ,large enough address space for one frame of video
	.read_addr_2                (25'd12441600             ),
	.read_addr_3                (25'd14515200             ),
	.read_addr_index            (ch1_read_addr_index      ),
	.read_len                   (25'd196608               ),//frame size  1024 * 768 * 16 / 64
	.read_en                    (ch1_read_en              ),
	.read_data                  (ch1_read_data            )
);

ddr3 u_ddr3 (
	// Memory interface ports
	.ddr3_addr                   (ddr3_addr				), 
	.ddr3_ba                     (ddr3_ba					), 
	.ddr3_cas_n                  (ddr3_cas_n			), 
	.ddr3_ck_n                   (ddr3_ck_n				), 
	.ddr3_ck_p                   (ddr3_ck_p				),
	.ddr3_cke                    (ddr3_cke				),  
	.ddr3_ras_n                  (ddr3_ras_n			), 
	.ddr3_reset_n                (ddr3_reset_n		), 
	.ddr3_we_n                   (ddr3_we_n				),  
	.ddr3_dq                     (ddr3_dq					),  
	.ddr3_dqs_n                  (ddr3_dqs_n			),  
	.ddr3_dqs_p                  (ddr3_dqs_p			),  
	.init_calib_complete         (init_calib_complete),  
	 
	.ddr3_cs_n                   (ddr3_cs_n				),  
	.ddr3_dm                     (ddr3_dm					),  
	.ddr3_odt                    (ddr3_odt				),  
	// Application interface ports
	.ui_clk                      (ui_clk					), 
	.ui_clk_sync_rst             (ui_clk_sync_rst	),  // output						ui_clk_sync_rst
	.mmcm_locked                 (								),  // output						mmcm_locked
	.aresetn                     (1'b1						),  // input						aresetn
	.app_sr_req                  (1'b0						),  // input						app_sr_req
	.app_ref_req                 (1'b0						),  // input						app_ref_req
	.app_zq_req                  (1'b0						),  // input						app_zq_req
	.app_sr_active               (								),  // output						app_sr_active
	.app_ref_ack                 (								),  // output						app_ref_ack
	.app_zq_ack                  (								),  // output						app_zq_ack
	// Slave Interface Write Address Ports
	.s_axi_awid                  (s00_axi_awid		),  // input [0 :0]			s_axi_awid
	.s_axi_awaddr                (s00_axi_awaddr	),  // input [29:0]			s_axi_awaddr
	.s_axi_awlen                 (s00_axi_awlen		),  // input [7 :0]			s_axi_awlen
	.s_axi_awsize                (s00_axi_awsize	),  // input [2 :0]			s_axi_awsize
	.s_axi_awburst               (s00_axi_awburst	),  // input [1 :0]			s_axi_awburst
	.s_axi_awlock                (s00_axi_awlock	),  // input [0 :0]			s_axi_awlock
	.s_axi_awcache               (s00_axi_awcache	),  // input [3 :0]			s_axi_awcache
	.s_axi_awprot                (s00_axi_awprot	),  // input [2 :0]			s_axi_awprot
	.s_axi_awqos                 (s00_axi_awqos		),  // input [3 :0]			s_axi_awqos
	.s_axi_awvalid               (s00_axi_awvalid	),  // input						s_axi_awvalid
	.s_axi_awready               (s00_axi_awready	),  // output						s_axi_awready
	// Slave Interface Write Data Ports
	.s_axi_wdata                 (s00_axi_wdata		),  // input [63:0]			s_axi_wdata
	.s_axi_wstrb                 (s00_axi_wstrb		),  // input [7 :0]			s_axi_wstrb
	.s_axi_wlast                 (s00_axi_wlast		),  // input						s_axi_wlast
	.s_axi_wvalid                (s00_axi_wvalid	),  // input						s_axi_wvalid
	.s_axi_wready                (s00_axi_wready	),  // output						s_axi_wready
	// Slave Interface Write Response Ports
	.s_axi_bid                   (s00_axi_bid			),  // output [0:0]			s_axi_bid
	.s_axi_bresp                 (s00_axi_bresp		),  // output [1:0]			s_axi_bresp
	.s_axi_bvalid                (s00_axi_bvalid	),  // output						s_axi_bvalid
	.s_axi_bready                (s00_axi_bready	),  // input						s_axi_bready
	// Slave Interface Read Address Ports
	.s_axi_arid                  (s00_axi_arid		),  // input [0 :0]			s_axi_arid
	.s_axi_araddr                (s00_axi_araddr	),  // input [29:0]			s_axi_araddr
	.s_axi_arlen                 (s00_axi_arlen		),  // input [7 :0]			s_axi_arlen
	.s_axi_arsize                (s00_axi_arsize	),  // input [2 :0]			s_axi_arsize
	.s_axi_arburst               (s00_axi_arburst	),  // input [1 :0]			s_axi_arburst
	.s_axi_arlock                (s00_axi_arlock	),  // input [0 :0]			s_axi_arlock
	.s_axi_arcache               (s00_axi_arcache	),  // input [3 :0]			s_axi_arcache
	.s_axi_arprot                (s00_axi_arprot	),  // input [2 :0]			s_axi_arprot
	.s_axi_arqos                 (s00_axi_arqos		),  // input [3 :0]			s_axi_arqos
	.s_axi_arvalid               (s00_axi_arvalid	),  // input						s_axi_arvalid
	.s_axi_arready               (s00_axi_arready	),  // output						s_axi_arready
	// Slave Interface Read Data Ports
	.s_axi_rid                   (s00_axi_rid			),  // output [0 :0]		s_axi_rid
	.s_axi_rdata                 (s00_axi_rdata		),  // output [63:0]		s_axi_rdata
	.s_axi_rresp                 (s00_axi_rresp		),  // output [1 :0]		s_axi_rresp
	.s_axi_rlast                 (s00_axi_rlast		),  // output						s_axi_rlast
	.s_axi_rvalid                (s00_axi_rvalid	),  // output						s_axi_rvalid
	.s_axi_rready                (s00_axi_rready	),  // input						s_axi_rready
	// System Clock Ports
	.sys_clk_i                   (clk_200MHz			),
	.sys_rst                     (mmcm_locked				)   // input sys_rst
);

//AXI_MASTER u_aq_axi_master
aq_axi_master u_aq_axi_master
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

	  .MASTER_RST                  (1'b0                                      ),
	  .WR_START                    (wr_burst_req                              ),
	  .WR_ADRS                     ({wr_burst_addr,3'd0}                      ),
	  .WR_LEN                      ({wr_burst_len,3'd0}                       ),
	  .WR_READY                    (                                          ),
	  .WR_FIFO_RE                  (wr_burst_data_req                         ),
	  .WR_FIFO_EMPTY               (1'b0                                      ),
	  .WR_FIFO_AEMPTY              (1'b0                                      ),
	  .WR_FIFO_DATA                (wr_burst_data                             ),
	  .WR_DONE                     (wr_burst_finish                           ),
	  .RD_START                    (rd_burst_req                              ),
	  .RD_ADRS                     ({rd_burst_addr,3'd0}                      ),
	  .RD_LEN                      ({rd_burst_len,3'd0}                       ),
	  .RD_READY                    (                                          ),
	  .RD_FIFO_WE                  (rd_burst_data_valid                       ),
	  .RD_FIFO_FULL                (1'b0                                      ),
	  .RD_FIFO_AFULL               (1'b0                                      ),
	  .RD_FIFO_DATA                (rd_burst_data                             ),
	  .RD_DONE                     (rd_burst_finish                           ),
	  .DEBUG                       (                                          )

	  /*
	  	   // Local Bus
	   //Write_FIFO
	  .WR_START                  (wr_burst_req          ),
	  .WR_ADRS                   ({wr_burst_addr,3'd0}  ),
	  .WR_LEN                    ({wr_burst_len,3'd0}   ),
	  .WR_READY                  (                      ),
	  .WR_FIFO_RE                (wr_burst_data_req     ),
	  .WR_FIFO_DATA              (wr_burst_data         ),
	  .WR_DONE                   (wr_burst_finish       ),
	  //READ_FIFO
	  .RD_START                  (rd_burst_req          ),
	  .RD_ADRS                   ({rd_burst_addr,3'd0}  ),
	  .RD_LEN                    ({rd_burst_len,3'd0}   ),
	  .RD_READY                  (                      ),
	  .RD_FIFO_WE                (rd_burst_data_valid   ),
	  .RD_FIFO_DATA              (rd_burst_data         ),
	  .RD_DONE                   (rd_burst_finish       )
	  */
);

mem_read_arbi 
#(
	.MEM_DATA_BITS               (MEM_DATA_BITS),
	.ADDR_BITS                   (ADDR_BITS    ),
	.BUSRT_BITS                  (BUSRT_BITS   )
)
mem_read_arbi_m0
(
	.rst_n                        (~mem_rst),
	.mem_clk                      (ui_clk),
	.ch0_rd_burst_req             (ch0_rd_burst_req),
	.ch0_rd_burst_len             (ch0_rd_burst_len),
	.ch0_rd_burst_addr            (ch0_rd_burst_addr),
	.ch0_rd_burst_data_valid      (ch0_rd_burst_data_valid),
	.ch0_rd_burst_data            (ch0_rd_burst_data),
	.ch0_rd_burst_finish          (ch0_rd_burst_finish),
	
	.ch1_rd_burst_req             (ch1_rd_burst_req),
	.ch1_rd_burst_len             (ch1_rd_burst_len),
	.ch1_rd_burst_addr            (ch1_rd_burst_addr),
	.ch1_rd_burst_data_valid      (ch1_rd_burst_data_valid),
	.ch1_rd_burst_data            (ch1_rd_burst_data),
	.ch1_rd_burst_finish          (ch1_rd_burst_finish),
	
	.rd_burst_req                 (rd_burst_req),
	.rd_burst_len                 (rd_burst_len),
	.rd_burst_addr                (rd_burst_addr),
	.rd_burst_data_valid          (rd_burst_data_valid),
	.rd_burst_data                (rd_burst_data),
	.rd_burst_finish              (rd_burst_finish)	
);

mem_write_arbi
#(
	.MEM_DATA_BITS               (MEM_DATA_BITS),
	.ADDR_BITS                   (ADDR_BITS    ),
	.BUSRT_BITS                  (BUSRT_BITS   )
)
mem_write_arbi_m0(
	.rst_n                       (~mem_rst),
	.mem_clk                     (ui_clk),
	
	.ch0_wr_burst_req            (ch0_wr_burst_req),
	.ch0_wr_burst_len            (ch0_wr_burst_len),
	.ch0_wr_burst_addr           (ch0_wr_burst_addr),
	.ch0_wr_burst_data_req       (ch0_wr_burst_data_req),
	.ch0_wr_burst_data           (ch0_wr_burst_data),
	.ch0_wr_burst_finish         (ch0_wr_burst_finish),
	
	.ch1_wr_burst_req            (ch1_wr_burst_req),
	.ch1_wr_burst_len            (ch1_wr_burst_len),
	.ch1_wr_burst_addr           (ch1_wr_burst_addr),
	.ch1_wr_burst_data_req       (ch1_wr_burst_data_req),
	.ch1_wr_burst_data           (ch1_wr_burst_data),
	.ch1_wr_burst_finish         (ch1_wr_burst_finish),
	
	.wr_burst_req                (wr_burst_req),
	.wr_burst_len                (wr_burst_len),
	.wr_burst_addr               (wr_burst_addr),
	.wr_burst_data_req           (wr_burst_data_req),
	.wr_burst_data               (wr_burst_data),
	.wr_burst_finish             (wr_burst_finish)	
);
endmodule