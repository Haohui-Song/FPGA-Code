
>
Refreshing IP repositories
234*coregenZ19-234h px� 
�
 Loaded user IP repository '%s'.
1135*coregen2G
3d:/FPGA/week13/7.29/project/dual_cam_display/usr_IP2default:defaultZ19-1700h px� 
|
"Loaded Vivado IP repository '%s'.
1332*coregen23
D:/Xilinx/Vivado/2018.3/data/ip2default:defaultZ19-2313h px� 
}
Command: %s
53*	vivadotcl2L
8link_design -top dual_cam_display -part xc7k325tffg676-22default:defaultZ4-113h px� 
g
#Design is defaulting to srcset: %s
437*	planAhead2
	sources_12default:defaultZ12-437h px� 
j
&Design is defaulting to constrset: %s
434*	planAhead2
	constrs_12default:defaultZ12-434h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2�
od:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/clk_200M/clk_200M.dcp2default:default2*
inst_clocks/clk_ref_m02default:defaultZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2�
�D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.runs/impl_1/.Xil/Vivado-23856-LAPTOP-HUGRUEV8/rgb2dvi_0/rgb2dvi_0.dcp2default:default22
inst_display_control/hdmi_inst2default:defaultZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_64i_16o_128/afifo_64i_16o_128.dcp2default:default2?
+inst_display_control/frame_read_m0/read_buf2default:defaultZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2�
�D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.runs/impl_1/.Xil/Vivado-23856-LAPTOP-HUGRUEV8/afifo_16i_64o_512/afifo_16i_64o_512.dcp2default:default2P
<inst_image_capture/channel1_capture/frame_write_m0/write_buf2default:defaultZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2{
gd:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/ddr3/ddr3.dcp2default:default20
inst_memory_control/mig_inst2default:defaultZ1-454h px� 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
9452default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
x
Netlist was created with %s %s291*project2
Vivado2default:default2
2018.32default:defaultZ1-479h px� 
W
Loading part %s157*device2$
xc7k325tffg676-22default:defaultZ21-403h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
�
LRemoving redundant IBUF, %s, from the path connected to top-level port: %s 
35*opt2<
(inst_clocks/clk_ref_m0/inst/clkin1_ibufg2default:default2
sys_clk2default:defaultZ31-35h px� 
�
FRemoving redundant OBUF since it is not driving a top-level port. %s 
33*opt2�
�inst_memory_control/mig_inst/u_ddr3_mig/u_memc_ui_top_axi/mem_intfc0/ddr_phy_top0/u_ddr_mc_phy_wrapper/gen_addr_obuf[14].u_addr_obuf2default:defaultZ31-33h px� 
�
�Could not create '%s' constraint because net '%s' is not directly connected to top level port. Synthesis is ignored for %s but preserved for implementation.
528*constraints2 
IBUF_LOW_PWR2default:default24
inst_clocks/clk_ref_m0/clk_in12default:default2 
IBUF_LOW_PWR2default:default8Z18-550h px� 
�
�Could not create '%s' constraint because net '%s' is not directly connected to top level port. Synthesis is ignored for %s but preserved for implementation.
528*constraints2
DRIVE2default:default2@
*inst_memory_control/mig_inst/ddr3_addr[14]2default:default2
DRIVE2default:default8Z18-550h px� 
�
�Could not create '%s' constraint because net '%s' is not directly connected to top level port. Synthesis is ignored for %s but preserved for implementation.
528*constraints2
SLEW2default:default2@
*inst_memory_control/mig_inst/ddr3_addr[14]2default:default2
SLEW2default:default8Z18-550h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_64i_16o_128/afifo_64i_16o_128.xdc2default:default2D
.inst_display_control/frame_read_m0/read_buf/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_64i_16o_128/afifo_64i_16o_128.xdc2default:default2D
.inst_display_control/frame_read_m0/read_buf/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_64i_16o_128/afifo_64i_16o_128.xdc2default:default2D
.inst_display_control/frame_read_m1/read_buf/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_64i_16o_128/afifo_64i_16o_128.xdc2default:default2D
.inst_display_control/frame_read_m1/read_buf/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_16i_64o_512/afifo_16i_64o_512.xdc2default:default2U
?inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_16i_64o_512/afifo_16i_64o_512.xdc2default:default2U
?inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_16i_64o_512/afifo_16i_64o_512.xdc2default:default2U
?inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_16i_64o_512/afifo_16i_64o_512.xdc2default:default2U
?inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
ud:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/clk_200M/clk_200M_board.xdc2default:default21
inst_clocks/clk_ref_m0/inst	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
ud:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/clk_200M/clk_200M_board.xdc2default:default21
inst_clocks/clk_ref_m0/inst	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
od:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/clk_200M/clk_200M.xdc2default:default21
inst_clocks/clk_ref_m0/inst	2default:default8Z20-848h px� 
�
%Done setting XDC timing constraints.
35*timing2�
od:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/clk_200M/clk_200M.xdc2default:default2
572default:default8@Z38-35h px� 
�
Deriving generated clocks
2*timing2�
od:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/clk_200M/clk_200M.xdc2default:default2
572default:default8@Z38-2h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
get_clocks: 2default:default2
00:00:152default:default2
00:00:142default:default2
1482.2302default:default2
602.6372default:defaultZ17-268h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
od:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/clk_200M/clk_200M.xdc2default:default21
inst_clocks/clk_ref_m0/inst	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
sd:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/rgb2dvi_0/src/rgb2dvi.xdc2default:default27
!inst_display_control/hdmi_inst/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
sd:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/rgb2dvi_0/src/rgb2dvi.xdc2default:default27
!inst_display_control/hdmi_inst/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/ddr3/ddr3/user_design/constraints/ddr3.xdc2default:default22
inst_memory_control/mig_inst	2default:default8Z20-848h px� 
�
^Cannot set scoped property '%s', because the property does not exist for objects of type '%s'.335*netlist2
	VCCAUX_IO2default:default2
pin2default:default2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/ddr3/ddr3/user_design/constraints/ddr3.xdc2default:default2
2282default:default8@Z29-160h px�
�
^Cannot set scoped property '%s', because the property does not exist for objects of type '%s'.335*netlist2
SLEW2default:default2
pin2default:default2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/ddr3/ddr3/user_design/constraints/ddr3.xdc2default:default2
2292default:default8@Z29-160h px�
�
^Cannot set scoped property '%s', because the property does not exist for objects of type '%s'.335*netlist2

IOSTANDARD2default:default2
pin2default:default2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/ddr3/ddr3/user_design/constraints/ddr3.xdc2default:default2
2302default:default8@Z29-160h px�
�
^Cannot set scoped property '%s', because the property does not exist for objects of type '%s'.335*netlist2
PACKAGE_PIN2default:default2
pin2default:default2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/ddr3/ddr3/user_design/constraints/ddr3.xdc2default:default2
2312default:default8@Z29-160h px�
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/ddr3/ddr3/user_design/constraints/ddr3.xdc2default:default22
inst_memory_control/mig_inst	2default:default8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default8Z20-179h px� 
�
No pins matched '%s'.
508*	planAhead2y
eu_ddr3/u_ddr3_mig/u_memc_ui_top_axi/mem_intfc0/ddr_phy_top0/u_ddr_calib_top/init_calib_complete_reg/C2default:default2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1452default:default8@Z12-508h px� 
�
&%s:No valid object(s) found for '%s'.
2779*	planAhead2"
set_false_path2default:default2�
v-from [get_pins u_ddr3/u_ddr3_mig/u_memc_ui_top_axi/mem_intfc0/ddr_phy_top0/u_ddr_calib_top/init_calib_complete_reg/C]2default:default2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1452default:default8@Z12-4739h px�
�
No pins matched '%s'.
508*	planAhead2D
0frame_read_m1/frame_fifo_read_m0/fifo_aclr_reg/C2default:default2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1462default:default8@Z12-508h px� 
�
No pins matched '%s'.
508*	planAhead2:
&video_rect_read_data_m1/read_req_reg/D2default:default2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1462default:default8@Z12-508h px� 
�
&%s:No valid object(s) found for '%s'.
2779*	planAhead2"
set_false_path2default:default2U
A-from [get_pins frame_read_m1/frame_fifo_read_m0/fifo_aclr_reg/C]2default:default2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1462default:default8@Z12-4739h px�
�
No pins matched '%s'.
508*	planAhead2D
0frame_read_m0/frame_fifo_read_m0/fifo_aclr_reg/C2default:default2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1472default:default8@Z12-508h px� 
�
No pins matched '%s'.
508*	planAhead2:
&video_rect_read_data_m0/read_req_reg/D2default:default2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1472default:default8@Z12-508h px� 
�
&%s:No valid object(s) found for '%s'.
2779*	planAhead2"
set_false_path2default:default2U
A-from [get_pins frame_read_m0/frame_fifo_read_m0/fifo_aclr_reg/C]2default:default2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1472default:default8@Z12-4739h px�
�
No pins matched '%s'.
508*	planAhead2T
@u_ddr3/u_ddr3_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT2default:default2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1512default:default8@Z12-508h px� 
�
"No clocks found for command '%s'.
1008*	planAhead2v
bget_clocks -of_objects [get_pins u_ddr3/u_ddr3_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT]2default:default2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1512default:default8@Z12-1008h px� 
�
aNo clocks found. Please use 'create_clock' or 'create_generated_clock' command to create clocks.
626*	planAhead2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1512default:default8@Z12-626h px� 
�
&%s:No valid object(s) found for '%s'.
2779*	planAhead2"
set_false_path2default:default2|
h-to [get_clocks -of_objects [get_pins u_ddr3/u_ddr3_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT]]2default:default2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1512default:default8@Z12-4739h px�
�
No pins matched '%s'.
508*	planAhead2T
@u_ddr3/u_ddr3_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT2default:default2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1522default:default8@Z12-508h px� 
�
"No clocks found for command '%s'.
1008*	planAhead2v
bget_clocks -of_objects [get_pins u_ddr3/u_ddr3_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT]2default:default2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1522default:default8@Z12-1008h px� 
�
aNo clocks found. Please use 'create_clock' or 'create_generated_clock' command to create clocks.
626*	planAhead2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1522default:default8@Z12-626h px� 
�
&%s:No valid object(s) found for '%s'.
2779*	planAhead2"
set_false_path2default:default2|
h-to [get_clocks -of_objects [get_pins u_ddr3/u_ddr3_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT]]2default:default2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default2
1522default:default8@Z12-4739h px�
�
Finished Parsing XDC File [%s]
178*designutils2�
~D:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/imports/new/dual_ov5640_an5642_hdmi.xdc2default:default8Z20-178h px� 
�
Parsing XDC File [%s]
179*designutils2�
wD:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/new/dual_cam_display_timming.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2�
wD:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/constrs_1/new/dual_cam_display_timming.xdc2default:default8Z20-178h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_64i_16o_128/afifo_64i_16o_128_clocks.xdc2default:default2D
.inst_display_control/frame_read_m0/read_buf/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_64i_16o_128/afifo_64i_16o_128_clocks.xdc2default:default2D
.inst_display_control/frame_read_m0/read_buf/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_64i_16o_128/afifo_64i_16o_128_clocks.xdc2default:default2D
.inst_display_control/frame_read_m1/read_buf/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_64i_16o_128/afifo_64i_16o_128_clocks.xdc2default:default2D
.inst_display_control/frame_read_m1/read_buf/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_16i_64o_512/afifo_16i_64o_512_clocks.xdc2default:default2U
?inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_16i_64o_512/afifo_16i_64o_512_clocks.xdc2default:default2U
?inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_16i_64o_512/afifo_16i_64o_512_clocks.xdc2default:default2U
?inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�d:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_16i_64o_512/afifo_16i_64o_512_clocks.xdc2default:default2U
?inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
zd:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/rgb2dvi_0/src/rgb2dvi_clocks.xdc2default:default27
!inst_display_control/hdmi_inst/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
zd:/FPGA/week13/7.29/project/dual_cam_display/dual_cam_display_ov5640_k7.srcs/sources_1/ip/rgb2dvi_0/src/rgb2dvi_clocks.xdc2default:default27
!inst_display_control/hdmi_inst/U0	2default:default8Z20-847h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
�inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_cdc_inst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
�inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_cdc_inst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
�inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_cdc_inst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
�inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_cdc_inst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
�inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
�inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
�inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
�inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
|inst_display_control/frame_read_m0/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_cdc_inst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
|inst_display_control/frame_read_m0/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_cdc_inst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
|inst_display_control/frame_read_m1/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_cdc_inst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
|inst_display_control/frame_read_m1/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_cdc_inst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
|inst_display_control/frame_read_m0/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
|inst_display_control/frame_read_m0/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
|inst_display_control/frame_read_m1/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2V
@D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default2�
|inst_display_control/frame_read_m1/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_rrst_wr	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_rrst_wr	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_rrst_wr	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_rrst_wr	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_wrst_rd	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_wrst_rd	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_wrst_rd	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_wrst_rd	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_display_control/frame_read_m0/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_rrst_wr	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_display_control/frame_read_m0/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_rrst_wr	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_display_control/frame_read_m1/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_rrst_wr	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_display_control/frame_read_m1/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_rrst_wr	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_display_control/frame_read_m0/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_wrst_rd	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_display_control/frame_read_m0/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_wrst_rd	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_display_control/frame_read_m1/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_wrst_rd	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2X
BD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_single.tcl2default:default2�
�inst_display_control/frame_read_m1/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_single_inst_wrst_rd	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_image_capture/channel1_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_image_capture/channel2_capture/frame_write_m0/write_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_display_control/frame_read_m0/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_display_control/frame_read_m0/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_display_control/frame_read_m1/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_display_control/frame_read_m1/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.gic_rst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_display_control/frame_read_m0/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_display_control/frame_read_m0/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1687h px� 
�
%Sourcing Tcl File [%s] for cell '%s'
1448*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_display_control/frame_read_m1/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1689h px� 
�
.Finished Sourcing Tcl File [%s] for cell '%s'
1446*designutils2Z
DD:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_sync_rst.tcl2default:default2�
�inst_display_control/frame_read_m1/read_buf/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.g7serrst.gsckt_wrst.xpm_cdc_sync_rst_inst_wrst	2default:default8Z20-1687h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0132default:default2
1571.8482default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2�
�  A total of 297 instances were transformed.
  IOBUF => IOBUF (IBUF, OBUFT): 4 instances
  IOBUFDS_DIFF_OUT_DCIEN => IOBUFDS_DIFF_OUT_DCIEN (IBUFDS_IBUFDISABLE_INT, IBUFDS_IBUFDISABLE_INT, INV, OBUFTDS_DCIEN, OBUFTDS_DCIEN): 4 instances
  IOBUF_DCIEN => IOBUF_DCIEN (IBUF_IBUFDISABLE, OBUFT_DCIEN): 32 instances
  LUT6_2 => LUT6_2 (LUT5, LUT6): 26 instances
  OBUFDS => OBUFDS_DUAL_BUF (INV, OBUFDS, OBUFDS): 1 instances
  RAM32M => RAM32M (RAMD32, RAMD32, RAMD32, RAMD32, RAMD32, RAMD32, RAMS32, RAMS32): 230 instances
2default:defaultZ1-111h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
192default:default2
142default:default2
92default:default2
02default:defaultZ4-41h px� 
]
%s completed successfully
29*	vivadotcl2
link_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2!
link_design: 2default:default2
00:00:372default:default2
00:00:392default:default2
1571.8482default:default2
1166.2702default:defaultZ17-268h px� 


End Record