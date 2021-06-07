all:
		/opt/nasm/nasm -f macho64 converter.asm
		/opt/nasm/nasm -f macho64 main.asm

		ld -macosx_version_min 10.14 -no_pie -lSystem -o main main.o converter.o

		./main
clear:
		rm *.o
