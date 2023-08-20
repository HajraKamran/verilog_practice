`timescale 1ns/1ps
module controller_tb();

reg zero;
reg [2:0] phase;
reg [2:0] op;
wire sel;
wire rd;
wire id_ir;
wire inc_pc;
wire halt;
wire id_pc;
wire data_c;
wire id_c;
wire wr;

initial begin
    op=3'b111;
    zero=1;
    phase=3'b000;

    #10;
    op=3'b111;
    zero=1;
    phase=3'b001;

    #10;
    op=3'b111;
    zero=1;
    phase=3'b010;

end

initial begin
    $dumpfile ("controller.vcd");
    $dumpvars (0,controller_tb);
end

controller control(
.zero(zero),
.phase (phase),
.op(op),
.sel(sel),
.rd(rd),
.id_ir(id_ir),
.inc_pc(inc_pc),
.halt(halt),
.id_pc(id_pc),
.data_c(data_c),
.id_c(id_c),
.wr(wr)
);
endmodule
