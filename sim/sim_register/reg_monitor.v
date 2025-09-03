`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2025 10:01:36 PM
// Design Name: 
// Module Name: reg_monitor
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


module reg_monitor
#(parameter D_BIT = 8)
(   input wire clk, rst, en,
    input wire [D_BIT-1:0] d,
    input wire [D_BIT-1:0] q);
    
    localparam delta = 1;
    reg [D_BIT-1:0] gold;
    reg [63:0] err_msg;
    
    initial
    begin
        $display("time| rst | en |    d |   q ");
    end
        
    always @(posedge clk) 
    begin
        #delta
        if(rst)
            gold = 0;
        else if(en)
            gold = d;
        
        err_msg = (q==gold) ? "     " : "ERROR";
        
        $display("%5d | %b  | %b |  %d |  %d  %s", $time-1, rst, en, d, q, err_msg);
    end
endmodule
