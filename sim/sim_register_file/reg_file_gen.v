`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2025 02:04:26 AM
// Design Name: 
// Module Name: reg_file_gen
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


module reg_file_gen
#(parameter D_BIT=8, W=3, T=20)
(   output reg clk, rst, wr_en,
    output reg [W-1:0] w_addr, r_addr,
    output reg [D_BIT-1:0] w_data);
    
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
        write_data(4'b0101, 3'b001);
        write_data(6'b110110, 3'b011);
        write_data(2'b11, 3'b000);
        write_data(8'b01101010, 3'b111);
        write_data(5'b11111, 3'b101);
        read_data(3'b111);
        read_data(3'b001);
        read_data(3'b011);
        write_data(4'b1000, 3'b011);
        write_data(4'b1100, 3'b001);
        read_data(3'b101);
        read_data(3'b011);
        read_data(3'b001);
        rst_sync(4);
        read_data(3'b001);
        read_data(3'b010);
        read_data(3'b011);
        write_data(4'b1110, 3'b001);
        write_data(4'b1100, 3'b010);
        write_data(4'b1000, 3'b011);
        read_data(3'b010);
        #(T);
        $stop;
    end
    
    /* name: initialize task 
     * description: system initialization routine 
     */
    task initialize();
    begin
        rst = 1'b1;
        wr_en = 1'b0;
        w_addr = {W{1'b0}};
        r_addr = {W{1'b0}};
        w_data = {D_BIT{1'b0}};
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
    
    /* name: write_data task
     * description: Write data via data_in, use addr_in to specify the address
     */
    task write_data(input [D_BIT-1:0] data_in, input [W-1:0] addr_in);
    begin
        @(posedge clk);
        w_data = data_in;
        w_addr = addr_in;
        wr_en = 1'b1;
        @(posedge clk)
        wr_en = 1'b0;
    end
    endtask
    
    /* name: read_data task
     * description: Specify addr_out for the read register address
     */
    task read_data(input [W-1:0] addr_out);
    begin
        @(posedge clk);
        r_addr = addr_out;
    end
    endtask
endmodule
