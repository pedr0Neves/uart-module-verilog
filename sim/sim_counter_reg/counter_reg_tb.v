`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2025 12:17:40 AM
// Design Name: 
// Module Name: counter_reg_tb
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


module counter_reg_tb;
    localparam T=10, D_BIT=8;
    wire clk, rst, en, en_count;
    wire [D_BIT-1:0] d, q;
    
    counter_reg #(.D_BIT(D_BIT)) uut
        (.clk(clk), .rst(rst), .en(en), .en_count(en_count), .d(d), .q(q));
    
    cnt_reg_gen #(.D_BIT(D_BIT), .T(T)) vec_generator
        (.clk(clk), .rst(rst), .en(en), .en_count(en_count), .d(d));
    
    cnt_reg_monitor #(.D_BIT(D_BIT)) monitor
        (.clk(clk), .rst(rst), .en(en), .en_count(en_count), .d(d), .q(q));

endmodule
