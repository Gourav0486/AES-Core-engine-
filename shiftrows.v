`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:04:52 07/24/2020 
// Design Name: 
// Module Name:    shiftrows 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module shiftrows(clk,data_in,data_out
    );
	 input clk;
	 input [127:0]data_in;
	 output reg [127:0]data_out=128'b0;
	 
	 always@(posedge clk)
	 begin
	 data_out[127:120]<=data_in[95:88];
	 data_out[119:112]<=data_in[55:48];
	 data_out[111:104]<=data_in[15:8];
	 data_out[103:96]<= data_in[103:96];
	 
	 
	 data_out[95:88]<=data_in[63:56];
	 data_out[87:80]<=data_in[23:16];
	 data_out[79:72]<=data_in[111:104];
	 data_out[71:64]<=data_in[71:64];
	 
	 data_out[63:56]<=data_in[31:24];
	 data_out[55:48]<=data_in[119:112];
	 data_out[47:40]<=data_in[79:72];
	 data_out[39:32]<=data_in[39:32];
	 
	 data_out[31:24]<=data_in[127:120];
	 data_out[23:16]<=data_in[87:80];
	 data_out[15:8]<= data_in[47:40];
	 data_out[7:0]<=data_in[7:0];
	 end
endmodule
