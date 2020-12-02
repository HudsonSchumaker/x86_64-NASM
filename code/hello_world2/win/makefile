helloc.exe: hello.obj
	gcc -o hello.exe hello.obj
helloc.obj: hello.asm
	nasm -f win64  -g -F cv8 hello_world2.asm -l hello.lst
