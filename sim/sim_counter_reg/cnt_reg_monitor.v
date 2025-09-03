`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2025 12:17:40 AM
// Design Name: 
// Module Name: cnt_reg_monitor
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


module cnt_reg_monitor
#(parameter D_BIT=8)
(   input wire clk, rst, en, en_count,
    input wire [D_BIT-1:0] d,
    input wire [D_BIT-1:0] q);
    
    localparam delta = 1;
    reg [D_BIT-1:0] gold;
    reg [63:0] err_msg;
    
    initial
    begin
        $display(" time | rst | en | en_count |   d |   q ");
    end
        
    always @(posedge clk) 
    begin
        #delta
        if(rst)
            gold = 0;
        else if(en_count)
            gold = d+1;
        else if(en)
            gold = d;
        
        err_msg = (q==gold) ? "     " : "ERROR";
        
        $display("%5d |  %b  |  %b |    %b    |  %d |  %d  %s", $time-1, rst, en, en_count, d, q, err_msg);
    end
endmodule
