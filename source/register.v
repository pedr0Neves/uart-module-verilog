`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2025 02:08:41 PM
// Design Name: 
// Module Name: register
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


module register #(parameter D_BIT = 8)
(   input wire clk, rst, en,
    input wire [D_BIT-1:0] d,
    output wire [D_BIT-1:0] q);
    
    wire [D_BIT-1:0] d_in;
    
    assign  d_in = (en) ? d : q;
    
    genvar i;
    generate
        for(i = 0; i < D_BIT; i = i + 1) begin
            d_ff ff(.clk(clk), .rst(rst), .d(d_in[i]), .q(q[i]));
        end
    endgenerate
endmodule
