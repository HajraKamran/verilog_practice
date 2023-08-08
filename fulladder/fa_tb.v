`timescale 1ns/1ps
module fa_tb();
    reg a_tb;
    reg b_tb;
    reg cin_tb;
    wire sum_tb; 
    wire cout_tb;

    initial begin
        a_tb=0;
        b_tb=0;
        cin_tb=0;
        #0.05;
        a_tb=1;b_tb=1;cin_tb=0;
        #0.05;
        a_tb=0;b_tb=1;cin_tb=0;
        #0.05;
        a_tb=1;b_tb=1;cin_tb=1;
        $display ("sum_tb=%d",sum_tb);
        $display("sum_tb value is %d",sum_tb);
        #1;
    end

    fa u_fa0 (
        .a(a_tb),
        .b(b_tb),
        .cin(cin_tb),
        .sum(sum_tb),
        .cout(cout_tb)
    );

    initial begin 
        $dumpfile("fa.vcd");
        $dumpvars(0,fa_tb);
    end
endmodule