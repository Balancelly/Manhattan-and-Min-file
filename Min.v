`define D_DataSize 10

module Min(d_0,
            d_1,
            d_2,
            d_3,
            d_4,
            d_5,
            d_6,
            d_7,
            out_index,
            out_distance);

  // ---------------------- input  ---------------------- //
  input  [`D_DataSize-1:0] d_0, d_1, d_2, d_3, d_4, d_5, d_6, d_7; //each 10bit

  // ---------------------- output ---------------------- //
  output [`D_DataSize-1:0] out_distance;
  output [2:0] out_index;

  // ---------------------- Write down Your design below  ---------------------- //

reg [9:0] distemp0,distemp1,distemp2,distemp3,distemp4,distemp5;
reg [2:0] intemp0,intemp1,intemp2,intemp3,intemp4,intemp5;
reg [`D_DataSize-1:0] out_distance;
reg [2:0] out_index;

always@(*)begin
 	//layer one
	if(d_0<=d_1)begin
		distemp0=d_0;
		intemp0=3'b000;
	end
	else begin
		distemp0=d_1;
		intemp0=3'b001;
	end

	if(d_2<=d_3)begin
		distemp1=d_2;
		intemp1=3'b010;
	end
	else begin
		distemp1=d_3;
		intemp1=3'b011;
	end

	if(d_4<=d_5)begin
		distemp2=d_4;
		intemp2=3'b100;
	end
	else begin
		distemp2=d_5;
		intemp2=3'b101;
	end

	if(d_6<=d_7)begin
		distemp3=d_6;
		intemp3=3'b110;
	end
	else begin
		distemp3=d_7;
		intemp3=3'b111;
	end
	

	//layer two
	if(distemp0<=distemp1)begin
		distemp4=distemp0;
		intemp4=intemp0;
	end
	else begin
		distemp4=distemp1;	
		intemp4=intemp1;
	end
	if(distemp2<=distemp3)begin
		distemp5=distemp2;
		intemp5=intemp2;
	end
	else begin
		distemp5=distemp3;	
		intemp5=intemp3;
	end
	//layer three
	if(distemp4<=distemp5)begin
		out_distance=distemp4;
		out_index=intemp4;
	end
	else begin
		out_distance=distemp5;
		out_index=intemp5;	
	end
end

endmodule
