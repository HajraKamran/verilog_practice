`timescale 1ns/1ps
module fsm_tb();
reg tx;
reg clk;
reg rst;
reg busy;

top u_top(
    .clk(clk),
    .rst(rst),
    .tx(tx),
    .busy(busy)
);

initial begin
    #10;
    clk=0;
    rst=0;
    busy=1;
    tx=0;

    #10;
    rst=1;
    busy=1;
    tx=0;

    #10;
    rst=0;
    busy=1;
    tx=0;

    #10;
    rst=0;
    busy=1;
    tx=1;

    #10;
    rst=0;
    busy=1;
    tx=0;

    #10;
    rst=0;
    busy=0;
    tx=0;
 end

always begin 
    #5 clk=~clk;
end

initial begin 
    $dumpfile("fsm.vcd");
    $dumpvars(0,fsm_tb);
end

endmodule