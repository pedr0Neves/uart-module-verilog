`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2025 08:11:45 PM
// Design Name: 
// Module Name: fifo_fsm
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


module fifo_fsm
(   input wire wr, rd,
    input wire full, empty,
    input wire r_eq, w_eq,
    output reg full_next, empty_next,
    output reg w_en, r_en, wr_en);
    
    always @* begin
        r_en = 1'b0;
        w_en = 1'b0;
        wr_en = 1'b0;
        full_next = full;
        empty_next = empty;
        case({wr, rd})
            2'b01:
                begin
                    if(~empty)
                        begin
                            r_en = 1'b1;
                            full_next = 1'b0;
                            if(r_eq)
                                empty_next = 1'b1;
                        end
                    
                end
            2'b10:
                begin
                    if(~full)
                        begin
                            w_en = 1'b1;
                            empty_next = 1'b0;
                            wr_en = 1'b1;
                            if(w_eq)
                                full_next = 1'b1;
                        end
                end
            2'b11:
                begin
                    r_en = 1'b1;
                    w_en = 1'b1;
                    wr_en = 1'b1;
                    if(full)
                        begin
                            full_next = 1'b0;
                        end
                    if(empty)
                        begin
                            empty_next = 1'b0;
                        end
                end
        endcase
    end
endmodule
