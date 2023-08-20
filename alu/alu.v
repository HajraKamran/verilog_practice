`timescale 1ns/1ps
module alu (a,b,op,res_o);
    input wire [7:0] a;
    input wire [7:0] b;
    input wire  [2:0] op;
    output reg [7:0] res_o;
    always @ (op)
    begin
        case(op)
    3'b000: begin
        res_o=a+b;
    end
    3'b001 :begin
        res_o=a-b;
    end
    3'b010 :begin
        res_o=a&b;
    end
    3'b011 :begin
        res_o=a|b;end
    3'b100 :begin
        res_o=a^b;end
    3'b101 :begin
        res_o=a<<b;end
    3'b110 :begin
        res_o=a>>b;end
    default: begin
    res_o=a>>b;
    end
    endcase
    end
endmodule