`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Hanie
// 
// Create Date: 12/08/2017 
// Module Name: self_purging_full_adder
// Description: using gate level full adder and implemeting 1 module sift out full adder
// BOOK: johnson, Design and analysis of fault tolerant digital system, page 76
// Des:  how sift out with N module works? (go to the book page 76)
//////////////////////////////////////////////////////////////////////////////////


module sift_out_full_adder(
    clk, in1, in2, cin, K, sum, cout);
    parameter N=3;
    input in1, in2, cin, K, clk;
    output sum, cout;

    wire m12, m13, m23;
    wire m12_or, m13_or, m23_or;
    wire [N-1:0] sum_, cout_;
    wire f1, f2, f3;
    wire q1, q2, q3;

    wire m12_c, m13_c, m23_c;
    wire m12_or_c, m13_or_c, m23_or_c;
    wire f1_c, f2_c, f3_c;
    wire q1_c, q2_c, q3_c;

    full_adder fa1(in1, in2, cin, sum_[0], cout_[0]);
    full_adder fa2(in1, in2, cin, sum_[1], cout_[1]);
    full_adder fa3(in1, in2, cin, sum_[2], cout_[2]);

    // **sum**
    // comprator
    xor g1 (m12, sum_[0], sum_[1]);
    xor g2 (m23, sum_[1], sum_[2]);
    xor g3 (m13, sum_[2], sum_[0]);
    // detector
    or  g4 (m12_or, m12, q1, q2);
    or  g5 (m23_or, m23, q2, q3);
    or  g6 (m13_or, m13, q1, q3);
    and g7 (f1, m12_or, m13_or);
    and g8 (f2, m23_or, m12_or);
    and g9 (f3, m13_or, m23_or);
    jk_ff jk_f1 (clk, f1, K, q1);             
    jk_ff jk_f2 (clk, f2, K, q2);             
    jk_ff jk_f3 (clk, f3, K, q3); 
    // collector
    or  g10 (m1, f1, sum_[0]);            
    or  g11 (m2, f2, sum_[1]);            
    or  g12 (m3, f3, sum_[2]);            
    and g13 (sum, m1, m2, m3);
    ///////////////////////////////////////////////////////
    // **cout**
    // comprator
    xor g1_c (m12_c, cout_[0], cout_[1]);
    xor g2_c (m23_c, cout_[1], cout_[2]);
    xor g3_c (m13_c, cout_[2], cout_[0]);
    // detector
    or  g4_c (m12_or_c, m12_c, q1_c, q2_c);
    or  g5_c (m23_or_c, m23_c, q2_c, q3_c);
    or  g6_c (m13_or_c, m13_c, q1_c, q3_c);
    and g7_c (f1_c, m12_or_c, m13_or_c);
    and g8_c (f2_c, m23_or_c, m12_or_c);
    and g9_c (f3_c, m13_or_c, m23_or_c);
    jk_ff jk_f1_c (clk, f1_c, K, q1_c);             
    jk_ff jk_f2_c (clk, f2_c, K, q2_c);             
    jk_ff jk_f3_c (clk, f3_c, K, q3_c); 
    // collector
    or  g10_c (m1_c, f1_c, cout_[0]);            
    or  g11_c (m2_c, f2_c, cout_[1]);            
    or  g12_c (m3_c, f3_c, cout_[2]);            
    and g13_c (cout, m1_c, m2_c, m3_c);
endmodule
