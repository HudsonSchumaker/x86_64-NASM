all:
	nasm -f elf64 -g -F dwarf icalc.asm -l icalc.lst
	gcc -o icalc icalc.o -no-pie
	./icalc

clear:
	rm *.o
