`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Hanie
// 
// Create Date: 12/08/2017 
// Module Name: full_adder
//////////////////////////////////////////////////////////////////////////////////


module full_adder(
    in1, in2, cin, sum, cout);
    input in1, in2, cin;
    output sum, cout;
    wire xor_in1in2;
    wire and_in1in2;
    wire and_in1in2cin;
    xor g1 (xor_in1in2, in1, in2);    
    xor g2 (sum, xor_in1in2, cin);    
    and g3 (and_in1in2, in1, in2); 
    and g4 (and_in1in2cin,and_in1in2, cin); 
    or  g5 (cout, and_in1in2, and_in1in2cin);
endmodule
