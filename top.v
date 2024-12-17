`define RGB_DataSize 24
`define D_DataSize 10
`include "Manhattan.v"
`include "Min.v"
`timescale 1ns/10ps

// ---------------------- define ---------------------- //

module top(clk,
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
           out_index,
           out_distance);

  // ---------------------- input  ---------------------- //
  input  clk;
  input  rst;
  input  clear;
  input  c_en;
  input  if_en;
  input  [`RGB_DataSize-1:0] c_in0, c_in1, c_in2, c_in3, c_in4, c_in5, c_in6, c_in7;
  input  [`RGB_DataSize-1:0] if_in;

  // ---------------------- output ---------------------- //
  output [`D_DataSize-1:0] out_distance;
  output [2:0] out_index;
  // ---------------------- Write down Your design below  ---------------------- //

wire [9:0] d0,d1,d2,d3,d4,d5,d6,d7;




Manhattan (clk,
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
	   d0,
	   d1,
	   d2,
	   d3,
	   d4,
	   d5,
	   d6,
	   d7);

Min  	  (d0,
           d1,
           d2,
           d3,
           d4,
           d5,
           d6,
           d7,
           out_index,
           out_distance);

endmodule
