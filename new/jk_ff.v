`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Hanie
// 
// Create Date: 12/08/2017 
// Module Name: jk_ff
//////////////////////////////////////////////////////////////////////////////////

module jk_ff(
    J, K, Q);
    input J, K;
    output Q;

    assign Q = ({J, K}==2'b01)? 0  :
               ({J, K}==2'b10)? 1  :
               ({J, K}==2'b11)? ~Q :
               ({J, K}==2'b00)? Q : 0;  
// ** synchronous with clk
//always @ (posedge(clk))
//    begin
//        case({J,K})
//        2'b00: Q=Q;
//        2'b01: Q=0;
//        2'b10: Q=1;
//        2'b11: Q=~Q;
//        default : Q=0;    
//        endcase
//    end
                  
endmodule
 