module controller (zero,phase,op,sel,rd,id_ir,inc_pc,halt,id_pc,data_c,id_c,wr);
input wire zero;
input wire [2:0] phase;
input wire [2:0] op;
output reg sel;
output reg rd;
output reg id_ir;
output reg inc_pc;
output reg halt;
output reg id_pc;
output reg data_c;
output reg id_c;
output reg wr;

reg H=0;
reg Z=0;
reg A=0;
reg S=0;
reg J=0;


always @(op)
begin
H=(op==3'b000)?1:0;
Z=(op==3'b001 & zero==1)?1:0;
A=(op==3'b010 | op==3'b011 | op==3'b100 | op==3'b101)?1:0;
S=(op==3'b110)?1:0;
J=(op==3'b111)?1:0;
end

always @(phase)
begin
case (phase)
3'b000:begin
    sel=1'b1;  rd=0;        id_ir=0;     inc_pc=0;
    halt=0;    id_pc=0;     data_c=0;    id_c=0;     wr=0;
end

3'b001:begin
    sel=1'b1;  rd=1'b1;        id_ir=0;     inc_pc=0;
    halt=0;    id_pc=0;     data_c=0;      id_c=0;      wr=0;
end

3'b010:begin
    sel=1'b1;  rd=1'b1;        id_ir=1'b1;     inc_pc=0;
    halt=0;    id_pc=0;        data_c=0;          id_c=0;    wr=0;
end

3'b011:begin
    sel=1'b1;  rd=1'b1;        id_ir=1'b1;     inc_pc=0;
    halt=0;    id_pc=0;     data_c=0;          id_c=0;      wr=0;
end

3'b100:begin
    sel=0;        rd=0;        id_ir=0;     inc_pc=1'b1;
    halt=H;    id_pc=0;     data_c=0;       id_c=0;         wr=0;
end

3'b101:begin
    sel=0;       rd=A;        id_ir=0;     inc_pc=0;
    halt=0;     id_pc=0;        data_c=0;   id_c=0;      wr=0;
end

3'b110:begin
    sel=0;     rd=A;       id_ir=0;       inc_pc=Z;
    halt=0;    id_pc=J;     data_c=S;     id_c=0;        wr=0;
end

3'b111:begin
    sel=0;     rd=A;       id_ir=0;     inc_pc=0;
    halt=0;    id_pc=J;     data_c=S;   id_c=A;        wr=S;
end
endcase
end
endmodule