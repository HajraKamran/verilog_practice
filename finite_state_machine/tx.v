module tx(clk,rst,tx,ready_i,valid_o,data_o,d);
input wire clk;
input wire rst;
input wire tx;
input wire ready_i;
output reg  valid_o;
output reg [1:0]data_o;
output reg [1:0]d;

reg [1:0] state;
reg [1:0]next_state;

localparam RST_STATE=2'b00;
localparam TX_STATE=2'b01;
localparam VALID_STATE=2'b10;

always @(posedge clk)begin
    if(rst)begin
        state<=RST_STATE;
    end
    else begin  
        state<=next_state;
    end 
end

    always @(*) begin
        case (state)
        RST_STATE:begin
            next_state<=TX_STATE;
            valid_o<=1'b0;
        end
        TX_STATE:begin 
           next_state<= (tx)? VALID_STATE : TX_STATE;
           valid_o<=1'b0;
        end
        VALID_STATE:begin 
          next_state <= (ready_i)? TX_STATE :VALID_STATE;
           valid_o<=1'b1;
           data_o<=2'b01;
           if (ready_i==1) begin
            d<=data_o;
           end
        end
        default:next_state<=RST_STATE;
        endcase
end

endmodule