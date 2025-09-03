`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2025 02:04:26 AM
// Design Name: 
// Module Name: reg_file_monitor
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


module reg_file_monitor
#(parameter D_BIT=8, W=3)
(   input wire clk, rst, wr_en,
    input wire [W-1:0] w_addr, r_addr,
    input wire [D_BIT-1:0] w_data, r_data);
    
    localparam delta=1;
    reg [D_BIT-1:0] mem_gold [2**W-1:0];
    reg [D_BIT-1:0] gold;
    reg [63:0] err_msg;
    integer i;
    
    initial
    begin
        $display("time | rst | wr_en | w_addr | r_addr | w_data | r_data");
        for(i=0; i**W; i = i+1)
            mem_gold[i] = 0;
    end
    
    always @(posedge clk)
    begin
        #delta;
        
        if(rst)
        begin
            for(i=0; i**W; i = i+1)
                mem_gold[i] = 0;
        end
        else if(wr_en)
        begin
            mem_gold[w_addr] = w_data;
        end
        
        gold = mem_gold[r_addr];
        err_msg = (r_data == mem_gold[r_addr]) ? "     " : "ERROR";
        
        $display("%5d |  %b   |   %b   |   %d    |   %d    |   %d    |   %d    | %s",
                 $time, rst, wr_en, w_addr, r_addr, w_data, r_data, err_msg);

    end
endmodule
