`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2025 02:42:21 PM
// Design Name: 
// Module Name: shift_reg
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


module shift_reg  #(parameter D_BIT = 8)
(   input wire clk, rst, en,
    input wire [1:0] ctrl,
    input wire d,
    input wire [D_BIT-1:0] d_reg,
    output wire [D_BIT-1:0] q);
    
    reg [D_BIT-1:0] d_in;
    
    always @* begin
        case(ctrl)
            2'b00: d_in = d_reg;                // load
            2'b01: d_in = {d, q[D_BIT-1:1]};    // right shift
            2'b10: d_in = {q[D_BIT-2:0], d};    // left shift
            default: d_in = q;                   // no op
        endcase
    end
    
    register register(.clk(clk), .rst(rst), .en(en), .d(d_in), .q(q));
endmodule
