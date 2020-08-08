`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:50 07/24/2020 
// Design Name: 
// Module Name:    subbytes 
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
module subbytes(clk,data,s_data_out);
	 input clk;
	 input [127:0]data;
	 output  reg [127:0]s_data_out;

	wire [127:0] tmp_out;
		
		
		

	  sbox q0(data[127:120],tmp_out[127:120] );
     sbox q1( data[119:112],tmp_out[119:112] );
     sbox q2( data[111:104],tmp_out[111:104] );
     sbox q3( data[103:96],tmp_out[103:96] );
     
     sbox q4( data[95:88],tmp_out[95:88] );
     sbox q5( data[87:80],tmp_out[87:80] );
     sbox q6( data[79:72],tmp_out[79:72] );
     sbox q7( data[71:64],tmp_out[71:64] );
     
     sbox q8( data[63:56],tmp_out[63:56] );
     sbox q9( data[55:48],tmp_out[55:48] );
     sbox q10(data[47:40],tmp_out[47:40] );
     sbox q11(data[39:32],tmp_out[39:32] );
     
     sbox q12(data[31:24],tmp_out[31:24] );
     sbox q13(data[23:16],tmp_out[23:16] );
     sbox q14(data[15:8],tmp_out[15:8] );
     sbox q15(data[7:0],tmp_out[7:0] );
	  
	always@(posedge clk)
	begin
	
	 s_data_out<=tmp_out;
	end

endmodule
