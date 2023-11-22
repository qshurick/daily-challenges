all: build clear run

build:
	nasm -f elf64 hanoi.asm
	ld -o runme hanoi.o

run:
	./runme | hexdump -C

clear:
	rm -f *.o
	rm -f core.*
