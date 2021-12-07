.PHONY: all
all: a

%: %.o
	ld -o $@ $<

%.o: %.asm
	nasm -felf64 $<
