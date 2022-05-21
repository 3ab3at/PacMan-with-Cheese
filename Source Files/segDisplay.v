`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2022 11:17:03
// Design Name: 
// Module Name: segDisplay
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


module segDisplay(state, idx, direction, rst, cathodes);
    input [3:0] state;
    input [2:0] idx, direction;
    input rst;
    output reg [7:0] cathodes;
    parameter A = 0, B = 1, C = 3, D = 4, E = 5, F = 6, G = 7, H = 8;
    parameter up = 0, down = 1, left = 2, right = 3;
    always @(state, idx)
        if (rst)
            cathodes <= 8'b10010011;
        else begin
            case (state)
                A: if (idx == 0)
                    case (direction)
                        up: cathodes <= 8'b10111001;
                        down: cathodes <= 8'b00111011;
                        left: cathodes <= 8'b00111101;
                        right: cathodes <= 8'b01111001;
                    endcase
                    else cathodes <= 8'b11111111;
                B: if (idx == 1)
                    case (direction)
                        up: cathodes <= 8'b10111001;
                        down: cathodes <= 8'b00111011;
                        left: cathodes <= 8'b00111101;
                        right: cathodes <= 8'b01111001;
                    endcase
                    else cathodes <= 8'b11111111;
                C: if (idx == 2)
                        case (direction)
                            up: cathodes <= 8'b10111001;
                            down: cathodes <= 8'b00111011;
                            left: cathodes <= 8'b00111101;
                            right: cathodes <= 8'b01111001;
                        endcase
                        else cathodes <= 8'b11111111;
                D: if (idx == 3)
                        case (direction)
                            up: cathodes <= 8'b10111001;
                            down: cathodes <= 8'b00111011;
                            left: cathodes <= 8'b00111101;
                            right: cathodes <= 8'b01111001;
                        endcase
                        else cathodes <= 8'b11111111;
                E: if (idx == 0)
                        case (direction)
                            up: cathodes <= 8'b11000111;
                            down: cathodes <= 8'b11010101;
                            left: cathodes <= 8'b11001101;
                            right: cathodes <= 8'b11100101;
                        endcase
                        else cathodes <= 8'b11111111;
                F: if (idx == 1)
                        case (direction)
                            up: cathodes <= 8'b11000111;
                            down: cathodes <= 8'b11010101;
                            left: cathodes <= 8'b11001101;
                            right: cathodes <= 8'b11100101;
                        endcase
                        else cathodes <= 8'b11111111;
                G: if (idx == 2)
                        case (direction)
                            up: cathodes <= 8'b11000111;
                            down: cathodes <= 8'b11010101;
                            left: cathodes <= 8'b11001101;
                            right: cathodes <= 8'b11100101;
                        endcase
                        else cathodes <= 8'b11111111;
                H: if (idx == 3)
                        case (direction)
                            up: cathodes <= 8'b11000111;
                            down: cathodes <= 8'b11010101;
                            left: cathodes <= 8'b11001101;
                            right: cathodes <= 8'b11100101;
                        endcase
                        else cathodes <= 8'b11111111;
            endcase
        end
endmodule
