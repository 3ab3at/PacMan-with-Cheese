`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2022 10:52:07
// Design Name: 
// Module Name: top_module
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


module top_module(buttons, clk, rst, cathodes, anodes);
    input [3:0] buttons;
    input clk, rst;
    output [7:0] cathodes;
    output [3:0] anodes;
    wire [3:0] buttons_deb, buttons_rise;
    genvar i;
    generate for (i = 0; i < 4; i = i + 1) begin: debouncing_buttons
        debAndSynch deb(clk,rst,buttons[i],buttons_deb[i]);
    end endgenerate
    generate for (i = 0; i < 4; i = i + 1) begin: detecting_rising_edges
        edgeDetector dec(clk,buttons_deb[i],rst,buttons_rise[i]);
    end endgenerate
    parameter A = 0, B = 1, C = 3, D = 4, E = 5, F = 6, G = 7, H = 8;
    parameter up = 0, down = 1, left = 2, right = 3;
    reg [3:0] state;
    reg [2:0] direction;
    always @(posedge clk) begin
        if (rst) begin
            state <= A;
            direction <= right;
        end
        else if (buttons_rise != 4'b0000) begin
            case (state)
                A: begin
                    if (buttons_rise[0] == 1) begin
                        state <= D;
                        direction <= left;
                    end
                    else if (buttons_rise[1] == 1) begin
                        state <= E;
                        direction <= up;
                    end
                    else if (buttons_rise[2] == 1) begin
                        state <= B;
                        direction <= right;
                    end
                    else if (buttons_rise[3] == 1) begin
                        state <= E;
                        direction <= down;
                    end
                end
                
                B: begin
                    if (buttons_rise[0] == 1) begin
                        state <= A;
                        direction <= left;
                    end
                    else if (buttons_rise[1] == 1) begin
                        state <= F;
                        direction <= up;
                    end
                    else if (buttons_rise[2] == 1) begin
                        state <= C;
                        direction <= right;
                    end
                    else if (buttons_rise[3] == 1) begin
                        state <= F;
                        direction <= down;
                    end
                end 
                
                C: begin
                    if (buttons_rise[0] == 1) begin
                        state <= B;
                        direction <= left;
                    end
                    else if (buttons_rise[1] == 1) begin
                        state <= G;
                        direction <= up;
                    end
                    else if (buttons_rise[2] == 1) begin
                        state <= D;
                        direction <= right;
                    end
                    else if (buttons_rise[3] == 1) begin
                        state <= G;
                        direction <= down;
                    end
                end 
                
                D: begin
                    if (buttons_rise[0] == 1) begin
                        state <= C;
                        direction <= left;
                    end
                    else if (buttons_rise[1] == 1) begin
                        state <= H;
                        direction <= up;
                    end
                    else if (buttons_rise[2] == 1) begin
                        state <= A;
                        direction <= right;
                    end
                    else if (buttons_rise[3] == 1) begin
                        state <= H;
                        direction <= down;
                    end
                end 
                
                E: begin
                    if (buttons_rise[0] == 1) begin
                        state <= H;
                        direction <= left;
                    end
                    else if (buttons_rise[1] == 1) begin
                        state <= A;
                        direction <= up;
                    end
                    else if (buttons_rise[2] == 1) begin
                        state <= F;
                        direction <= right;
                    end
                    else if (buttons_rise[3] == 1) begin
                        state <= A;
                        direction <= down;
                    end
                end 

                F: begin
                    if (buttons_rise[0] == 1) begin
                        state <= E;
                        direction <= left;
                    end
                    else if (buttons_rise[1] == 1) begin
                        state <= B;
                        direction <= up;
                    end
                    else if (buttons_rise[2] == 1) begin
                        state <= G;
                        direction <= right;
                    end
                    else if (buttons_rise[3] == 1) begin
                        state <= B;
                        direction <= down;
                    end
                end               
                
                G: begin
                    if (buttons_rise[0] == 1) begin
                        state <= F;
                        direction <= left;
                    end
                    else if (buttons_rise[1] == 1) begin
                        state <= C;
                        direction <= up;
                    end
                    else if (buttons_rise[2] == 1) begin
                        state <= H;
                        direction <= right;
                    end
                    else if (buttons_rise[3] == 1) begin
                        state <= C;
                        direction <= down;
                    end
                end 
                
                H: begin
                    if (buttons_rise[0] == 1) begin
                        state <= G;
                        direction <= left;
                    end
                    else if (buttons_rise[1] == 1) begin
                        state <= D;
                        direction <= up;
                    end
                    else if (buttons_rise[2] == 1) begin
                        state <= E;
                        direction <= right;
                    end
                    else if (buttons_rise[3] == 1) begin
                        state <= D;
                        direction <= down;
                    end
                end 
            endcase
        end
    end
    wire [7:0] digits [3:0];
    generate for (i = 0; i < 4; i = i + 1) begin: displaying_output
        segDisplay x(state, i, direction, rst, digits[i]);
    end endgenerate
    digitSwitcher(clk,rst,digits[0],digits[1],digits[2],digits[3],cathodes,anodes);
endmodule
