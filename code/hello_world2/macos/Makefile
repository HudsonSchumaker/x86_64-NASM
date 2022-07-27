all:
   nasm -f macho64 hello_world2.asm
   ld -macosx_version_min 10.14 -no_pie -lSystem -o hello_world hello_world.o
   
   # For Big Sur
   #ld -macosx_version_min 10.19 -no_pie -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -o hello_world hello_world.o
   
   ./hello_world
clear:
   rm hello_world.o
