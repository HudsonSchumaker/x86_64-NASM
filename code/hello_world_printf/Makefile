all:
    nasm -f macho64 hello_world_printf.asm
    ld -macosx_version_min 10.14 -no_pie -lSystem -o hello_world_printf hello_world_printf.o
    ./hello_world_printf
clear:
    rm *.o
