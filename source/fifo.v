`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2025 12:50:07 PM
// Design Name: 
// Module Name: fifo
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


module fifo #(parameter D_BIT = 8)
(   input wire clk, rst,
    input wire wr, rd,
    input wire [D_BIT-1:0] w_data,
    output wire full, empty,
    output wire [D_BIT-1:0] r_data);
    
    wire full_next, full_reg;
    wire empty_next, empty_reg;
    wire [D_BIT-1:0] write_next, write_reg;
    wire [D_BIT-1:0] read_next, read_reg;
    wire [D_BIT-1:0] count_rd, count_wr;
    wire w_en, r_en, wr_en;
    wire wr_eq, rd_eq;
    
    assign wr_eq = (write_reg == count_rd);
    assign rd_eq = (read_reg == count_wr);
    
    fifo_fsm fsm(.wr(wr), .rd(rd), .full(full_reg), .empty(empty_reg), .r_eq(rd_eq), .w_eq(wr_eq), .full_next(full_next), .empty_next(empty_next), .w_en(w_en), .r_en(r_en), .wr_en(wr_en));
    
    register_file reg_file(.clk(clk), .rst(rst), .wr_en(wr_en), .w_addr(count_wr), .r_addr(count_rd), .w_data(w_data), .r_data(r_data));
    
    register reg_wr(.clk(clk), .rst(rst), .en(w_en), .d(write_next), .q(write_reg));
    
    counter_reg counter_wr(.clk(clk), .rst(rst), .en(w_en), .en_count(w_en), .d(write_reg), .q(count_wr));
    
    register reg_rd(.clk(clk), .rst(rst), .en(r_en), .d(read_next), .q(read_reg));
    
    counter_reg counter_rd(.clk(clk), .rst(rst), .en(r_en), .en_count(r_en), .d(read_reg), .q(count_rd));
    
    d_ff full_flag(.clk(clk), .rst(rst), .d(full_next), .q(full_reg));
    
    d_ff empty_flag(.clk(clk), .rst(rst), .d(empty_next), .q(empty_reg));
    
    assign full = full_reg;
    assign empty = empty_reg;
endmodule
