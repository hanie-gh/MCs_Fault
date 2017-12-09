`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Hanie
// 
// Create Date: 12/08/2017 
// Module Name: self_purging_full_adder_test
//////////////////////////////////////////////////////////////////////////////////


module sift_out_adder_test();
    parameter adder_width=32;
    reg [adder_width-1:0] in1; 
    reg [adder_width-1:0] in2;    
    reg cin, K;
    reg clk;    
    wire [adder_width-1:0] sum; 
    wire cout;
    sift_out_adder uut (clk, in1, in2, cin, K, sum, cout);
    initial
    begin
    in1=0;
    in2=0;
    cin=0;
    K=1;
    clk=0;
    
    #100
    K=0;
    in1=4;
    in2=6;
    cin=0;
    #100
    in1=2;
    in2=3;
    cin=0;  
    #100
    in1=10;
    in2=20;
    cin=0;
    #100
    in1=16;
    in2=32;
    cin=0; 
    #100  
    $finish;  
    end

    
    always          
        #10 clk=~clk;
   
endmodule
