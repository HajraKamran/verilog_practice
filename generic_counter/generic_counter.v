module generic_counter(clk,rst,en,load,cnt_in,cnt_out);

    input wire clk;
    input wire rst;
    input wire en;
    input wire load;
    input wire [4:0]cnt_in;

    output reg [4:0]cnt_out;

    always@(posedge clk)begin
        if(rst)begin
            cnt_out<=5'b00000;
    end
    else begin
        cnt_out <= (en & load)? cnt_in :(load)? 5'b00000 : cnt_in +1;
    end
    end
endmodule