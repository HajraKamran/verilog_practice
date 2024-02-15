`include "dff_ram.v"
module dff_ram8x72(
    input wire clk,
    input wire [2:0] addr,
    input wire wr_n,
    input wire [71:0] w_data,

    output reg [71:0] r_data
);

wire en0;
wire en1;
wire [71:0] r_data1;
wire [71:0] r_data2;

assign en0 = addr[2];
assign en1 = !(addr[2]);


dff_ram u_dff_ram0(
.clk(clk),
.addr(addr[1:0]),
.en(en0),
.wr_n(wr_n),
.w_data(w_data),
.r_data(r_data1)
);


dff_ram u_dff_ram1(
.clk(clk),
.addr(addr[1:0]),
.en(en1),
.wr_n(wr_n),
.w_data(w_data),
.r_data(r_data2)
);

always @* begin 
if (addr[2]==0)
begin
   r_data =  r_data1;
end
else 
begin 
    r_data =  r_data2;
end

end
endmodule
