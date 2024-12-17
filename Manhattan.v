`timescale 1ns/10ps
`define RGB_DataSize 24
`define D_DataSize   10
// ---------------------- define ---------------------- //

module Manhattan(clk,
                 rst,
                 clear,
                 c_en,
                 if_en,
                 c_in0,
                 c_in1,
                 c_in2,
                 c_in3,
                 c_in4,
                 c_in5,
                 c_in6,
                 c_in7,
                 if_in,
                 d_0,
                 d_1,
                 d_2,
                 d_3,
                 d_4,
                 d_5,
                 d_6,
                 d_7);

  // ---------------------- input  ---------------------- //
  input  clk;
  input  rst;
  input  clear;
  input  c_en;
  input  if_en;
  input  [`RGB_DataSize-1:0] c_in0, c_in1, c_in2, c_in3, c_in4, c_in5, c_in6, c_in7; //24bit
  input  [`RGB_DataSize-1:0] if_in;//24bit

  // ---------------------- output ---------------------- //
  output [`D_DataSize-1:0]   d_0, d_1, d_2, d_3, d_4, d_5, d_6, d_7;//each 10 bit

  // ---------------------- Write down Your design below  ---------------------- //

reg [`D_DataSize-1:0]   d_0, d_1, d_2, d_3, d_4, d_5, d_6, d_7;

reg [23:0] tempin,temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7;

reg [7:0] d_0_r,d_0_g,d_0_b,d_1_r,d_1_g,d_1_b,d_2_r,d_2_g,d_2_b,d_3_r,d_3_g,d_3_b,d_4_r,d_4_g,d_4_b,d_5_r,d_5_g,d_5_b,d_6_r,d_6_g,d_6_b,d_7_r,d_7_g,d_7_b;

always@(posedge clk or posedge rst)begin
	if(rst)begin //rst=1 //pin=0
		d_0<=10'b0;
		d_1<=10'b0;
		d_2<=10'b0;
		d_3<=10'b0;
		d_4<=10'b0;
		d_5<=10'b0;
		d_6<=10'b0;
		d_7<=10'b0;
	
	end
	else begin 	
		if(clear)begin//rst =0 clear==1  //all reg=0
			tempin<=24'b0;
			temp0<=24'b0;
			temp1<=24'b0;
			temp2<=24'b0;
			temp3<=24'b0;
			temp4<=24'b0;
			temp5<=24'b0;
			temp6<=24'b0;
			temp7<=24'b0;
			d_0<=10'b0;
			d_1<=10'b0;
			d_2<=10'b0;
			d_3<=10'b0;
			d_4<=10'b0;
			d_5<=10'b0;
			d_6<=10'b0;
			d_7<=10'b0;
		end
		else begin//rst =0 clear=0 
			if (if_en) begin //if_en=1 update non else
				tempin<=if_in;
			end	
			if (c_en) begin // c_en=1
				temp0<=c_in0;
				temp1<=c_in1;
				temp2<=c_in2;
				temp3<=c_in3;
				temp4<=c_in4;
				temp5<=c_in5;
				temp6<=c_in6;
				temp7<=c_in7;
			end
		end
	end
end					
		
always@(*)begin
	if(tempin[23:16]>temp0[23:16])begin//0
		d_0_r=tempin[23:16]-temp0[23:16];
	end
	else begin
		d_0_r=temp0[23:16]-tempin[23:16];
	end
		
	if(tempin[15:8]>temp0[15:8])begin
		d_0_g=tempin[15:8]-temp0[15:8];
	end
	else begin
		d_0_g=temp0[15:8]-tempin[15:8];
	end
	
	if(tempin[7:0]>temp0[7:0])begin
		d_0_b=tempin[7:0]-temp0[7:0];
	end
	else begin
		d_0_b=temp0[7:0]-tempin[7:0];
	end

		
	if(tempin[23:16]>temp1[23:16])begin//1
		d_1_r=tempin[23:16]-temp1[23:16];
	end
	else begin
		d_1_r=temp1[23:16]-tempin[23:16];
	end
		
	if(tempin[15:8]>temp1[15:8])begin
		d_1_g=tempin[15:8]-temp1[15:8];
	end
	else begin
		d_1_g=temp0[15:8]-tempin[15:8];
	end
	
	if(tempin[7:0]>temp1[7:0])begin
		d_1_b=tempin[7:0]-temp1[7:0];
	end
	else begin
		d_1_b=temp1[7:0]-tempin[7:0];
	end


	if(tempin[23:16]>temp2[23:16])begin//2
		d_2_r=tempin[23:16]-temp2[23:16];
	end
	else begin
		d_2_r=temp2[23:16]-tempin[23:16];
	end
		
	if(tempin[15:8]>temp2[15:8])begin
		d_2_g=tempin[15:8]-temp2[15:8];
	end
	else begin
		d_2_g=temp2[15:8]-tempin[15:8];
	end
	
	if(tempin[7:0]>temp2[7:0])begin
		d_2_b=tempin[7:0]-temp2[7:0];
	end
	else begin
		d_2_b=temp2[7:0]-tempin[7:0];
	end


	if(tempin[23:16]>temp3[23:16])begin//3
		d_3_r=tempin[23:16]-temp3[23:16];
	end
	else begin
		d_3_r=temp3[23:16]-tempin[23:16];
	end
		
	if(tempin[15:8]>temp3[15:8])begin
		d_3_g=tempin[15:8]-temp3[15:8];
	end
	else begin
		d_3_g=temp3[15:8]-tempin[15:8];
	end
	
	if(tempin[7:0]>temp3[7:0])begin
		d_3_b=tempin[7:0]-temp3[7:0];
	end
	else begin
		d_3_b=temp3[7:0]-tempin[7:0];
	end


	if(tempin[23:16]>temp4[23:16])begin//4
		d_4_r=tempin[23:16]-temp4[23:16];
	end
	else begin
		d_4_r=temp4[23:16]-tempin[23:16];
	end
		
	if(tempin[15:8]>temp4[15:8])begin
		d_4_g=tempin[15:8]-temp4[15:8];
	end
	else begin
		d_4_g=temp4[15:8]-tempin[15:8];
	end
	
	if(tempin[7:0]>temp4[7:0])begin
		d_4_b=tempin[7:0]-temp4[7:0];
	end
	else begin
		d_4_b=temp4[7:0]-tempin[7:0];
	end


	if(tempin[23:16]>temp5[23:16])begin//5
		d_5_r=tempin[23:16]-temp5[23:16];
	end
	else begin
		d_5_r=temp5[23:16]-tempin[23:16];
	end
		
	if(tempin[15:8]>temp5[15:8])begin
		d_5_g=tempin[15:8]-temp5[15:8];
	end
	else begin
		d_5_g=temp5[15:8]-tempin[15:8];
	end
	
	if(tempin[7:0]>temp5[7:0])begin
		d_5_b=tempin[7:0]-temp5[7:0];
	end
	else begin
		d_5_b=temp5[7:0]-tempin[7:0];
	end


	if(tempin[23:16]>temp6[23:16])begin//6
		d_6_r=tempin[23:16]-temp6[23:16];
	end
	else begin
		d_6_r=temp6[23:16]-tempin[23:16];
	end
		
	if(tempin[15:8]>temp6[15:8])begin
		d_6_g=tempin[15:8]-temp6[15:8];
	end
	else begin
		d_6_g=temp6[15:8]-tempin[15:8];
	end
	
	if(tempin[7:0]>temp6[7:0])begin
		d_6_b=tempin[7:0]-temp6[7:0];
	end
	else begin
		d_6_b=temp6[7:0]-tempin[7:0];
	end


	if(tempin[23:16]>temp7[23:16])begin//7
		d_7_r=tempin[23:16]-temp7[23:16];
	end
	else begin
		d_7_r=temp7[23:16]-tempin[23:16];
	end
		
	if(tempin[15:8]>temp7[15:8])begin
		d_7_g=tempin[15:8]-temp7[15:8];
	end
	else begin
		d_7_g=temp7[15:8]-tempin[15:8];
	end
	
	if(tempin[7:0]>temp7[7:0])begin
		d_7_b=tempin[7:0]-temp7[7:0];
	end
	else begin
		d_7_b=temp7[7:0]-tempin[7:0];
	end

	d_0=d_0_r+d_0_g+d_0_b;
	d_1=d_1_r+d_1_g+d_1_b;
	d_2=d_2_r+d_2_g+d_2_b;
	d_3=d_3_r+d_3_g+d_3_b;
	d_4=d_4_r+d_4_g+d_4_b;
	d_5=d_5_r+d_5_g+d_5_b;
	d_6=d_6_r+d_6_g+d_6_b;
	d_7=d_7_r+d_7_g+d_7_b;
end

endmodule					
