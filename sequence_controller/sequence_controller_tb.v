`timescale 1ns/1ps
module sequence_controller_tb();
reg [2:0]op;
reg zero;
reg clk;
reg rst;
wire mem_rd;
wire load_ir;
wire halt;
wire inc_pc;
wire load_ac;
wire load_pc;
wire mem_wr;


sequence_controller control(
.op(op),
.zero(zero),
.clk(clk),
.rst(rst),
.mem_rd(mem_rd),
.load_ir(load_ir),
.halt(halt),
.inc_pc(inc_pc),
.load_ac(load_ac),
.load_pc(load_pc),
.mem_wr(mem_wr)
);

initial begin
    zero=0;
    op=3'b000;
    clk=0;
    rst=0;

    #10;
    zero=0;
    op=3'b001;
    rst=1;

    #10;
    zero=0;
    op=3'b010;
    rst=1;

    #10;
    zero=0;
    op=3'b011;
    rst=1;

    #10;
    zero=0;
    op=3'b100;
    rst=1;

    #10;
    zero=0;
    op=3'b101;
    rst=1;

    #10;
    zero=0;
    op=3'b110;
    rst=1;

    #10;
    zero=0;
    op=3'b111;
    rst=1;
end

always begin
    #5; clk=~clk;
end

initial begin
    $dumpfile("sequence_controller.vcd");
    $dumpvars(0,sequence_controller_tb);
end


endmodule