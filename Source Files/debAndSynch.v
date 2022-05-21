`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2022 10:54:18
// Design Name: 
// Module Name: debAndSynch
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


module debAndSynch(clk,rst,in,out);
    input clk ,rst ,in;
    output reg out;
    reg [4:0] shiftReg;
    always @(posedge clk, posedge rst) begin
        if (rst) shiftReg <= 0;
        else shiftReg <= (shiftReg << 1) + in;
        out <= (shiftReg[4:2] == 7);
    end
endmodule
