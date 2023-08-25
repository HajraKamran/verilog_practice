module rx(clk,rst,data_i,valid_i,busy,ready_o);
input wire clk;
input wire rst;
input wire [1:0]data_i;
input wire valid_i;
input wire  busy;
output reg  ready_o;

reg [1:0] rx;

always @(posedge clk)
begin 
    if(busy) begin
    ready_o<=1'b0;
end
else begin 
    ready_o<=1'b1;
end
    if(ready_o)begin 
        rx<=data_i;
    end
end


endmodule