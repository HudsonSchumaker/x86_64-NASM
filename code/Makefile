all:
   nasm -f macho64 hello_world.asm
   ld -macosx_version_min 10.14 -no_pie -lSystem -o hello_world hello_world.o
	 ./hello_world
clear:
		rm hello_world.o
