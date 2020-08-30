All:
		nasm -f macho64 icalc.asm
		nasm -f macho64 main.asm
		ld -macosx_version_min 10.14 -no_pie -lSystem -o main main.o icalc.o
		./main

clear:
	rm *.o
	rm main
