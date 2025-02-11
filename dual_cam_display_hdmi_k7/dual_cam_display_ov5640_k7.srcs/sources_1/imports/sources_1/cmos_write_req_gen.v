//设置一个计数器，用来控制给DDR的哪个区域来存储
module cmos_write_req_gen(
	input              rst,
	input              pclk,
	input              cmos_vsync,	//帧信号
	output reg         write_req,
	output reg[1:0]    write_addr_index,
	output reg[1:0]    read_addr_index,
	input              write_req_ack
);
//
reg cmos_vsync_d0;
reg cmos_vsync_d1;
//数据打拍缓存
always@(posedge pclk )begin
	if(rst == 1'b1)
	begin
		cmos_vsync_d0 <= 1'b0;
		cmos_vsync_d1 <= 1'b0;
	end
	else
	begin
		cmos_vsync_d0 <= cmos_vsync;
		cmos_vsync_d1 <= cmos_vsync_d0;
	end
end
//帧信号由ov5640直接输入
always@(posedge pclk )begin
	if(rst == 1'b1)
		write_req <= 1'b0;
	else if(cmos_vsync_d0 == 1'b1 && cmos_vsync_d1 == 1'b0)
		write_req <= 1'b1;
	else if(write_req_ack == 1'b1)
		write_req <= 1'b0;
end
//
always@(posedge pclk )begin
	if(rst == 1'b1)
		write_addr_index <= 2'b0;
	else if(cmos_vsync_d0 == 1'b1 && cmos_vsync_d1 == 1'b0)
		write_addr_index <= write_addr_index + 2'd1;
end
//
always@(posedge pclk )begin
	if(rst == 1'b1)
		read_addr_index <= 2'b0;
	else if(cmos_vsync_d0 == 1'b1 && cmos_vsync_d1 == 1'b0)
		read_addr_index <= write_addr_index;
end

endmodule 
