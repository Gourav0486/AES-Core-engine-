`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gourav saini
// 
// Create Date:    15:02:28 07/26/2020 
// Design Name: 
// Module Name:    aes_main 
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
module aes_main(clk,data_in,key,data_out);
input clk;
input [127:0] data_in,key;
output  [127:0] data_out;

wire [127:0] key_s,key_s0,key_s1,key_s2,key_s3,key_s4,key_s5,key_s6,key_s7,key_s8,key_s9;
wire [127:0]r_data_out,r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,r7_data_out,r8_data_out,r9_data_out;

assign r_data_out=data_in^key_s;


aes_key_expand_128 a0( clk,key, key_s,key_s0,key_s1,key_s2,key_s3,key_s4,key_s5,key_s6,key_s7,key_s8,key_s9);
round r0(clk,r_data_out,key_s0,r0_data_out);
round r1(clk,r0_data_out,key_s1,r1_data_out);
round r2(clk,r1_data_out,key_s2,r2_data_out);
round r3(clk,r2_data_out,key_s3,r3_data_out);
round r4(clk,r3_data_out,key_s4,r4_data_out);
round r5(clk,r4_data_out,key_s5,r5_data_out);
round r6(clk,r5_data_out,key_s6,r6_data_out);
round r7(clk,r6_data_out,key_s7,r7_data_out);
round r8(clk,r7_data_out,key_s8,r8_data_out);
last_round r9(clk,r8_data_out,key_s9,r9_data_out);

assign data_out=r9_data_out;
endmodule
