helloc.exe: helloc.obj
	gcc -o helloc.exe helloc.obj
helloc.obj: helloc.asm
	nasm -f win64  -g -F cv8 hello_world2.asm -l helloc.lst
