`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2025 02:04:26 AM
// Design Name: 
// Module Name: reg_file_tb
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


module reg_file_tb;
    localparam  D_BIT=8, W=3, T=10;
    wire clk, rst, wr_en;
    wire [D_BIT-1:0] w_data, r_data;
    wire [W-1:0] w_addr, r_addr;
    
    register_file #(.D_BIT(D_BIT), .W(W)) uut
        (.clk(clk), .rst(rst), .wr_en(wr_en), .w_addr(w_addr), .r_addr(r_addr), .w_data(w_data), .r_data(r_data));
    
    reg_file_gen #(.D_BIT(D_BIT), .W(W), .T(T)) vec_generator
        (.clk(clk), .rst(rst), .wr_en(wr_en), .w_addr(w_addr), .r_addr(r_addr), .w_data(w_data));
        
    reg_file_monitor #(.D_BIT(D_BIT), .W(W)) monitor
        (.clk(clk), .rst(rst), .wr_en(wr_en), .w_addr(w_addr), .r_addr(r_addr), .w_data(w_data), .r_data(r_data));
    
    reg_file_scoreboard #(.D_BIT(D_BIT), .W(W)) scoreboard
        (.clk(clk), .rst(rst), .q(r_data), .gold(monitor.gold));
endmodule
