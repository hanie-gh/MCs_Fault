`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Hanie
// 
// Create Date: 12/08/2017 
// Module Name: self_purging_full_adder
//////////////////////////////////////////////////////////////////////////////////

module voter(
    in, out);
    parameter N=6;
    parameter THR=4;  //Upper bound of (N+1)/2 
    input [N-1:0] in;
    output out;
    assign out =(in<THR)? 0:1;
endmodule
