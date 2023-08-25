`include "tx.v"
`include "rx.v"
module top(clk,rst,tx,busy);
input wire clk;
input wire rst;
input wire tx;
input wire busy;

wire valid_o;
wire valid_i;
wire ready_i;
wire ready_o;
wire [1:0]data_i;
wire [1:0]data_o;
wire [1:0]d;
tx u_tx(
    .clk(clk),
    .rst(rst),
    .tx(tx),
    .ready_i(ready_i),
    .valid_o(valid_o),
    .data_o(data_o),
    .d(d)
);

rx u_rx(
    .clk(clk),
    .rst(rst),
    .data_i(d),
    .valid_i(valid_o),
    .busy(busy),
    .ready_o(ready_i)
);

endmodule