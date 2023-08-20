module sequence_controller(op,zero,clk,rst,mem_rd,load_ir,halt,inc_pc,load_ac,load_pc,mem_wr);
input wire [2:0]op;
input wire zero;
input wire clk;
input wire rst;
output reg mem_rd;
output reg load_ir;
output reg halt;
output reg inc_pc;
output reg load_ac;
output reg load_pc;
output reg mem_wr;

reg [2:0]state; 
reg [2:0]next_state;

localparam INSTRUC_ADDR=3'b000;
localparam INSTRUC_FETCH=3'b001;
localparam INSTRUC_LOAD=3'b010;
localparam IDLE=3'b011;
localparam OP_ADDR=3'b100;
localparam OP_FETCH=3'b101;
localparam ALU_OP=3'b110;
localparam STORE=3'b111;

reg HLT;
reg SKZ;
reg ADD;
reg AND;
reg XOR;
reg LDA;
reg STO;
reg JMP;
reg ZERO;
reg ALUOP;

always @(posedge clk or negedge rst)
begin
if(!rst)
begin
    state<= INSTRUC_ADDR;
end
else
begin
    state<= next_state;
end
end 

always @(op)
begin
HLT=(op==3'b000)?1:0;
SKZ=(op==3'b001 & zero==1)?1:0;
ADD=(op==3'b010)?1:0;
AND=(op==3'b011)?1:0;
XOR=(op==3'b100)?1:0;
LDA=(op==3'b101)?1:0;
STO=(op==3'b110)?1:0;
JMP=(op==3'b111)?1:0;
end

always @(state)
begin
case(state)
INSTRUC_ADDR:begin
    mem_rd=0;  load_ir=0; halt=0; inc_pc=0; 
    load_ac=0; load_pc=0; mem_wr=0;
    next_state=INSTRUC_FETCH;
end

INSTRUC_FETCH:begin
    mem_rd=1'b1;  load_ir=0; halt=0; inc_pc=0; 
    load_ac=0; load_pc=0; mem_wr=0;
    next_state=INSTRUC_LOAD;
end

INSTRUC_LOAD:begin
    mem_rd=1'b1;  load_ir=1'b1; halt=0; inc_pc=0; 
    load_ac=0; load_pc=0; mem_wr=0;
    next_state=IDLE;
end 

IDLE:begin
    mem_rd=1'b1;  load_ir=1'b1; halt=0; inc_pc=0; 
    load_ac=0; load_pc=0; mem_wr=0;
    next_state=OP_ADDR;
end

OP_ADDR:begin
    mem_rd=0;  load_ir=0; halt=HLT; inc_pc=1'b1; 
    load_ac=0; load_pc=0; mem_wr=0;
    next_state=OP_FETCH;
end

OP_FETCH:begin
    mem_rd=ALUOP;  load_ir=0; halt=0; inc_pc=0; 
    load_ac=0; load_pc=0; mem_wr=0;
    next_state=ALU_OP;
end

ALU_OP:begin
    mem_rd=ALUOP;  load_ir=0; halt=0; inc_pc=SKZ; inc_pc=ZERO; 
    load_ac=ALUOP; load_pc=JMP; mem_wr=0;   
    next_state=STORE;
end

STORE:begin
    mem_rd=ALUOP;  load_ir=0; halt=0; inc_pc=JMP; 
    load_ac=ALUOP; load_pc=JMP; mem_wr=STO;
    next_state=INSTRUC_ADDR;
end
default:begin
    mem_rd=0;  load_ir=0; halt=0; inc_pc=0; 
    load_ac=0; load_pc=0; mem_wr=0;
    next_state=INSTRUC_FETCH;
end
endcase
end
endmodule