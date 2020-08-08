`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gourav saini
// 
// Create Date:    11:09:17 07/25/2020 
// Design Name: 
// Module Name:    mixcolumn 
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
module mixcolumn(clk,data_in,data_out);
input clk;
input [127:0] data_in;
output  [127:0] data_out;

wire  [31:0] n1,n2,n3,n4;
wire  [31:0] n_tmp_out1, n_tmp_out2, n_tmp_out3, n_tmp_out4;




assign n1 = data_in[127:96];
assign n2=data_in[95:64];
 assign n3=data_in[63:32];
assign n4=data_in[31:0];

mul_32 m1 (clk,n1,n_tmp_out1);
mul_32 m2 (clk,n2,n_tmp_out2);
mul_32 m3 (clk,n3,n_tmp_out3);
mul_32 m4 (clk,n4,n_tmp_out4);

assign data_out={n_tmp_out1,n_tmp_out2,n_tmp_out3,n_tmp_out4};

endmodule

module mul_2(clk,data_in,data_out);
input[7:0] data_in;
input clk;
output reg [7:0]data_out;
 
always@(posedge clk)
data_out<={data_in[6:0],1'b0} ^ (8'h1b & {8{data_in[7]}});

endmodule


module mul_3(clk,data_in,data_out);
input clk;
input [7:0]data_in;
output  [7:0] data_out;
wire [7:0]tmp_out;

mul_2  m1(clk,data_in,tmp_out);
assign  data_out=tmp_out^data_in;
endmodule



module mul_32(clk,m_data_in,m_data_out);
input clk;
input [31:0]m_data_in;
output [31:0] m_data_out;

wire [7:0] tmp1,tmp2,tmp3,tmp4;
wire [7:0] ma0,ma1,ma2,ma3;
wire [7:0] m2_tmp_out1,m2_tmp_out2,m2_tmp_out3,m2_tmp_out4;
wire [7:0] m3_tmp_out1,m3_tmp_out2,m3_tmp_out3,m3_tmp_out4;



assign tmp1=m_data_in[31:24];
assign tmp2=m_data_in[23:16];
assign tmp3=m_data_in[15:8];
assign tmp4=m_data_in[7:0];

begin
mul_2 m1 (clk,tmp1,m2_tmp_out1);
mul_2 m2 (clk,tmp2,m2_tmp_out2);
mul_2 m3 (clk,tmp3,m2_tmp_out3);
mul_2 m4 (clk,tmp4,m2_tmp_out4);


mul_3 m5( clk,tmp1,m3_tmp_out1);
mul_3 m6( clk,tmp2,m3_tmp_out2);
mul_3 m7( clk,tmp3,m3_tmp_out3);
mul_3 m8( clk,tmp4,m3_tmp_out4);
end

assign ma0 = m2_tmp_out1 ^m3_tmp_out2^tmp3^tmp4;
assign ma1 = tmp1 ^m2_tmp_out2 ^m3_tmp_out3 ^ tmp4;
assign ma2 = tmp1^tmp2 ^ m2_tmp_out3 ^m3_tmp_out4;
assign ma3 = m3_tmp_out1 ^tmp2^tmp3^m2_tmp_out4;

assign m_data_out = {ma0,ma1,ma2,ma3};
endmodule





