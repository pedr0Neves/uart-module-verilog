`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2025 02:36:05 PM
// Design Name: 
// Module Name: counter_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter_reg #(parameter D_BIT = 8)
(   input wire clk, rst, en, en_count,
    input wire [D_BIT-1:0] d,
    output wire [D_BIT-1:0] q);
    
    wire [D_BIT-1:0] d_in;
    
    assign d_in = (en_count) ? d + 1 : d;
    
    register register(.clk(clk), .rst(rst), .en(en), .d(d_in), .q(q));
endmodule
