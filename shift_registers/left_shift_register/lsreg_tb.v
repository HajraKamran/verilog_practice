`timescale 1ns/1ps
module lsreg_tb ();
reg clk;
reg rset;
reg x;
wire [3:0] out;

lsreg u_shift(
        .clk(clk),
        .rset(rset),
        .x(x),
        .out(out)
    );

initial begin
    clk=0;rset=1'b1;
    #10;
    rset<=1'b0;
    #10;
    x=1'b1;
    #10;
    rset<=1'b0;
    x<=1'b0;
    $display ("out=%d",out);
end

always
begin 
#10 clk= ~clk;
end
initial begin
$dumpfile("lsreg.vcd");
$dumpvars(0,lsreg_tb);
#1000;
$finish();
end
endmodule
