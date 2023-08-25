module rsreg (clk,rset,x,out);
    input wire clk;
    input wire rset;
    input wire x;
    output reg [3:0] out;
    
    always @(posedge clk) begin
        if (rset) begin
            out<= 4'b0000;
        end 
        else begin
             out<= 4'b0001;
            out<= {x,out[3:1]};
        end
    end

endmodule