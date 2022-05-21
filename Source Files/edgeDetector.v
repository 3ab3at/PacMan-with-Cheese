`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2022 10:58:15
// Design Name: 
// Module Name: edgeDetector
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


module edgeDetector(clk,in,rst,out);
    input clk,in,rst;
    output reg out;
    reg[1:0] slidingWindow;
    always @(posedge clk) begin
        if (rst) slidingWindow <= 0;
        else slidingWindow <= (slidingWindow << 1) + in;
        out <= (slidingWindow == 1);
    end
endmodule
