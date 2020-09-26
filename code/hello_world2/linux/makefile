all:
	nasm -f elf64 -g -F dwarf hello_world2.asm -l hello_world2.lst
	gcc -o hello_world2 hello_world2.o -no-pie
	./hello_world2

clear:
	rm *.o

