;
; hello_world.asm
; prints hello, world! using syscall
; Hudson Schumaker
;

bits 64

section .data
	msg db  "Hello World from nasm", 0x0
	len equ	$ - msg 

section .bss

section .text
        global _start

_start:
	mov  rax, 1
	mov  rdi, 1
	mov  rsi, msg
	mov  rdx, len
	syscall

	mov  rax, 60
	mov  rdi, 0
	syscall 
