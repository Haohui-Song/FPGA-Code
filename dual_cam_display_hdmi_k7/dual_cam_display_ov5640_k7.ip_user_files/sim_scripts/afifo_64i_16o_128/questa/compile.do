vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../dual_cam_display_ov5640_k7.srcs/sources_1/ip/afifo_64i_16o_128/sim/afifo_64i_16o_128.v" \


vlog -work xil_defaultlib \
"glbl.v"

