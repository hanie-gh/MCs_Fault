`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Hanie
// 
// Create Date: 12/08/2017 
// Module Name: self_purging_full_adder
// BOOK: johnson, Design and analysis of fault tolerant digital system, page 71
// Des:  32 bit adder with self purging fault tolerant technique
//       at the beginning J must be 1. to set JK output and doesn't effect on adder
//       after getting the first output from this adder module, J must be 0.
//       J  K   Q(t+1)
//       1  0   1
//       1  1   ~Q(t)
//       0  0   Q(t)
//       0  1   0
//////////////////////////////////////////////////////////////////////////////////


module self_purging_adder(
    in1, in2, cin, J, sum, cout);
    parameter adder_width=32;
    parameter N=6;    
    parameter THR=4;  //Upper bound of (N+1)/2 
    input [adder_width-1:0] in1; 
    input [adder_width-1:0] in2;     
    input cin, J;
    output [adder_width-1:0] sum; 
    output cout;
    wire [adder_width:0] cout_; 
    
    assign cout_[0]=cin; 
    genvar i;
    generate
        for (i=0; i<adder_width; i=i+1)           
            self_purging_full_adder fa(in1[i], in2[i], cout_[i], J, sum[i], cout_[i+1]);
    endgenerate
    assign cout=cout_[adder_width]; 
   
endmodule
