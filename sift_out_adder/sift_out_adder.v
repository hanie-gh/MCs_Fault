`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Hanie
// 
// Create Date: 12/08/2017 
// Module Name: sift_out_full_adder
// BOOK: johnson, Design and analysis of fault tolerant digital system, page 76
// Des:  32 bit adder with sift out fault tolerant technique
//       at the beginning K must be 1 and after getting the first output from this adder module, K must be 0.
//       J  K   Q(t+1)
//       1  0   1
//       1  1   ~Q(t)
//       0  0   Q(t)
//       0  1   0
//////////////////////////////////////////////////////////////////////////////////


module sift_out_adder(
    clk, in1, in2, cin, K, sum, cout);
    parameter adder_width=32;
    parameter N=3;    
    parameter THR=4;  //Upper bound of (N+1)/2 
    input [adder_width-1:0] in1; 
    input [adder_width-1:0] in2;     
    input clk, cin, K;
    output [adder_width-1:0] sum; 
    output cout;
    wire [adder_width:0] cout_; 
    
    assign cout_[0]=cin; 
    genvar i;
    generate
        for (i=0; i<adder_width; i=i+1)           
            sift_out_full_adder fa(clk, in1[i], in2[i], cout_[i], K, sum[i], cout_[i+1]);
    endgenerate
    assign cout=cout_[adder_width]; 
   
endmodule
