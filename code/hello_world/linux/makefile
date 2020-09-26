all:
	nasm -f elf64 -g -F dwarf helloworld.asm -l helloworld.lst
	gcc -o helloworld helloworld.o -no-pie
	./helloworld

clear:
	rm *.o

