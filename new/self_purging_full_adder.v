`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Hanie
// 
// Create Date: 12/08/2017 
// Module Name: self_purging_full_adder
// Description: using gate level full adder and implemeting 1 module self purging full adder
// BOOK: johnson, Design and analysis of fault tolerant digital system, page 71
// Des:  how self purging with N module works? (go to the book page 71)
//       each of N identical module is design with the capability to remove itself from the system 
//       in the event that its output disagree with the voted output of the system.
//       First : N identical module are obtained.
//       Second: a set of N switches is developed. one switch is associated with each of the N modules.
//       Third : a voter is develop to produce the system output. a binary threshold gate has n binary inputs and one binary output.
//////////////////////////////////////////////////////////////////////////////////


module self_purging_full_adder(
    in1, in2, cin, J, sum, cout);
    parameter N=6;
    parameter THR=4;  //Upper bound of (N+1)/2 
    input in1, in2, cin, J;
    output sum, cout;
    wire [N-1:0] sum_, cout_;
    wire [N-1:0] sum__, cout__;
    wire [N-1:0] Q, K, Ec, Es;

    genvar i;
    generate
        for (i=0; i<N; i=i+1)  begin         
            // N module
            full_adder fa(in1, in2, cin, sum_[i], cout_[i]);
            // Switch component  
            jk_ff jk_ff_m (J, K[i], Q[i]);             
            and g1 (sum__[i] ,sum_[i], Q[i]);
            and g2 (cout__[i] ,cout_[i], Q[i]);
            xor g3 (Es[i], sum__[i], sum);
            xor g4 (Ec[i], cout__[i], cout);
            or  g5 (K[i], Ec[i], Es[i]);
            end
    endgenerate

    // Voter operates base on a binary thereshold gate
    voter voter_sum (sum__, sum);
    voter voter_cout (cout__, cout);
endmodule
