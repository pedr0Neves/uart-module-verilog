`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2025 12:17:40 AM
// Design Name: 
// Module Name: cnt_reg_gen
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


module cnt_reg_gen
#(parameter D_BIT=8, T=20)
(   output reg clk, rst, en, en_count,
    output reg [D_BIT-1:0] d);
    
    always
    begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end
    
    initial
    begin
        initialize();
        rst_sync(2);
        load_data(4'b0101, 1);
        count(3, 1);
        load_data(5'b00011, 1);
        count(5, 1);
        rst_sync(4);
        load_data(3'b001, 1);
        count(2, 0);
        count(5, 1);
        $stop;
    end
    
    /* name: initialize task
     * description: system initialization routine
     */
    task initialize();
    begin
        rst = 1'b1;
        en = 1'b0;
        en_count = 1'b0;
        d = {D_BIT{1'b0}};
    end
    endtask
    
    /* name: rst_sync task
     * description: reset system for C cycles, in synchronous form
     */
    task rst_sync(input integer C);
    begin
        @(posedge clk);
        rst = 1'b1;
        repeat(C) @(posedge clk);
        rst = 1'b0;
    end
    endtask
    
    /* name: load_data task
     * description: load data into the system via data_in; enable is activated by en_activate 
     */
    task load_data(input [D_BIT-1:0] data_in, input integer en_activate);
    begin
        @(posedge clk)
        if(en_activate)
            en = 1'b1;
        d = data_in;
        @(posedge clk);
        en = 1'b0;
    end
    endtask
    
    /* name: count task
     * description: en_counter is activated by en_up for C cycles.
     */
    task count(input integer C, input integer en_up);
    begin
        @(posedge clk);
        en = 1'b1;
        if(en_up)
            en_count = 1'b1;
        repeat(C) @(posedge clk);
        en_count = 1'b0;
        en = 1'b0;
    end
    endtask
endmodule
