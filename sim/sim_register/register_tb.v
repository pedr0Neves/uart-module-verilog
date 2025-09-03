`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2025 10:01:36 PM
// Design Name: 
// Module Name: register_tb
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


module register_tb;
    
    localparam T=10, D_BIT=8;
    wire clk, rst, en;
    wire [D_BIT-1:0] d, q;
    
    register #(.D_BIT(D_BIT)) uut
        (.clk(clk), .rst(rst), .en(en), .d(d), .q(q));
    
    reg_gen #(.D_BIT(D_BIT), .T(T)) vector_generator
        (.clk(clk), .rst(rst), .en(en), .d(d));
    
    reg_monitor #(.D_BIT(D_BIT)) monitor
        (.clk(clk), .rst(rst), .en(en), .d(d), .q(q));
endmodule
