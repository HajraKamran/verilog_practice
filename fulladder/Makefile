fulladder=/home/hajra/projects/verilog_practice/fulladder

fa_all:
	gtkwave fa.vcd

fa_vvp: fa_compile
	vvp fa.out
fa_compile:
	iverilog -o fa.out -f flist
clean:
.