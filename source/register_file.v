`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2025 05:22:37 PM
// Design Name: 
// Module Name: register_file
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


module register_file
#(parameter D_BIT = 8,
            W = 3)
(   input wire clk, rst,
    input wire wr_en,
    input wire [W-1:0] w_addr, r_addr,
    input wire [D_BIT-1:0] w_data,
    output wire [D_BIT-1:0] r_data);
    
    wire [D_BIT-1:0] array_reg [2**W-1:0];
    genvar i;
    generate
        for(i = 0; i < 2**W; i = i+1) begin : reg_file_lop
            register reg_inst(.clk(clk), .rst(rst), .en(wr_en & (w_addr == i)), .d(w_data), .q(array_reg[i]));
        end
    endgenerate
    
    assign r_data = array_reg[r_addr];
endmodule
