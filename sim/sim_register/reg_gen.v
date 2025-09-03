`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2025 10:01:36 PM
// Design Name: 
// Module Name: reg_gen
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


module reg_gen
#(parameter D_BIT = 8, T = 20)
(   output reg clk, rst, en,
    output reg [D_BIT-1:0] d);
    
    // clock definition
    always begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end
    
    // test procedure
    initial begin
        initialize();
        rst_sync(3);
        load_data(4'b1011, 1);
        load_data(6'b011111, 1);
        load_data(8'b00000000, 0);
        load_data(5'b10101, 0);
        load_data(8'b10110011, 1);
        rst_sync(2);
        load_data(8'b00000000, 0);
        load_data(8'b00000000, 0);
        $stop;
    end
    
    /* name: initialize task
     * description: system initialization routine
     */
    task initialize();
    begin
        en = 1'b0;
        d = {D_BIT{1'b0}};
        rst = 1'b1;
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
endmodule
