`timescale 1ns/1ps
module generic_counter_tb();
    reg clk;
    reg rst;
    reg en;
    reg [4:0]cnt_in;
    reg load;

    wire [4:0]cnt_out;

    generic_counter counter(
        .clk(clk),
        .rst(rst),
        .en(en),
        .cnt_in(cnt_in),
        .cnt_out(cnt_out),
        .load(load)
    );

    initial begin
        #20;
        clk =0;
        rst=0;
        load= 1;
        en=1;
        cnt_in=5'b10101;
        #10;

        rst=0;
        load= 1;
        en=1;
        cnt_in=5'b01010;
        #10;

        rst=0;
        load= 1;
        en=1;
        cnt_in=5'b11111;
        #10;

        rst=1;
        load= 1;
        en=1;
        cnt_in=5'b11111;
        #10;

        rst=0;
        load= 1;
        en=1;
        cnt_in=5'b11111;
        #10;

        rst=0;
        load= 0;
        en=1;
        cnt_in=5'b11111;
        #10; 
    end
    initial begin
       $dumpfile("generic_counter.vcd");
       $dumpvars(0,generic_counter_tb);
    end

    always begin
        #5 clk= ~clk;
    end



endmodule