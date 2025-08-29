`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2025 02:17:17 PM
// Design Name: 
// Module Name: d_ff
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


module d_ff
(   input wire clk, rst,
    input wire d,
    output reg q);
    
    always @(posedge clk, posedge rst) begin
        q <= d;
        if(rst) begin
            q <= 1'b0;
        end
    end
endmodule
