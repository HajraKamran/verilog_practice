`timescale 1ns/1ps

module dff_ram8x72_tb ();
    reg clk;
    reg [2:0] addr;
    reg wr_n;
    reg [71:0] w_data;

    wire [71:0] r_data;


dff_ram8x72 u_dff_ram8x72(
    .clk(clk),
    .addr(addr),
    .wr_n(wr_n),
    .w_data(w_data),
    .r_data(r_data)
);


initial begin 
clk = 0;
wr_n = 0;


addr= 3'b000;
w_data = 72'd10;

#10
wr_n = 0;
addr= 3'b001;
w_data = 72'd9;


#10


wr_n = 0;
addr= 3'b100;
w_data = 72'd3;


#10


wr_n = 0;
addr= 3'b101;
w_data = 72'd6;


#10


wr_n = 1;
addr= 3'b000;

#10

wr_n = 1;
addr= 3'b001;


#10

wr_n = 1;
addr= 3'b100;

#10


wr_n = 1;
addr= 3'b101;



#20;
$finish;

end


always begin
#5 clk = ~clk;
end

initial begin
       $dumpfile("dff_ram8x72.vcd");
       $dumpvars(0,dff_ram8x72_tb);
    end

endmodule