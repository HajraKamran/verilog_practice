module dff_ram(
    input wire clk,
    input wire [1:0] addr,
    input wire en,
    input wire wr_n,
    input wire [71:0] w_data,

    output reg [71:0] r_data
);


reg [71:0] mem [3:0] ;

always @ (posedge clk) begin 
if (!en & !wr_n)begin
mem[addr] <= w_data;
end
else if  (!en & wr_n)begin
r_data <= mem[addr];
end
end
endmodule
