`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2025 02:04:26 AM
// Design Name: 
// Module Name: reg_file_scoreboard
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


module reg_file_scoreboard
#(parameter D_BIT=8, W=3)
(   input wire clk, rst,
    input wire [D_BIT-1:0] q,
    input wire [D_BIT-1:0] gold);
    
    
    integer errors = 0;
    integer total_checks = 0;

    always @(posedge clk) 
    begin
        total_checks = total_checks + 1;
        if (q != gold) begin
            errors = errors + 1;
            $display("ERROR at time %0t: DUT=%0d, GOLD=%0d", $time, q, gold);
        end
    end
    
    initial 
    begin
        #1000; // tempo total da simulação
        $display("==== SCOREBOARD REPORT ====");
        $display("Total checks: %0d", total_checks);
        $display("Total errors: %0d", errors);
        $display("===========================");
    end
endmodule
