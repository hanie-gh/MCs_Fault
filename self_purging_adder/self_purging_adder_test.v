`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Hanie
// 
// Create Date: 12/08/2017 
// Module Name: self_purging_full_adder_test
//////////////////////////////////////////////////////////////////////////////////


odule self_purging_adder_test();
    parameter adder_width=32;
    reg [adder_width-1:0] in1; 
    reg [adder_width-1:0] in2;    
    reg cin, J;
    reg clk;    
    wire [adder_width-1:0] sum; 
    wire cout;
    self_purging_adder uut (clk, in1, in2, cin, J, sum, cout);
    initial
    begin
    in1=0;
    in2=0;
    cin=0;
    J=1;
    clk=0;
    
    #100
    J=0;
    in1=1;
    in2=1;
    cin=1;
    #100
    in1=2;
    in2=2;
    cin=0; 
    #100
    in1=4;
    in2=4;
    cin=0;
    #100
    in1=8;
    in2=8;
    cin=0;        
    #100
    in1=16;
    in2=16;
    cin=0;  
    #100
    in1=32;
    in2=32;
    cin=0;
    #100
    in1=64;
    in2=64;
    cin=0; 
    #100  
    $finish;  
    end

    
    always          
        #10 clk=~clk;
   
endmodule
