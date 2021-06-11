; hello_world.asm
; prints hello, world! using syscall
; Hudson Schumaker
; SchumakerTeam Lab

bits 64

section .data
	msg db  "Hello World from nasm", 0x0
	len equ	$ - msg 

section .bss

section .text
        global main

main:
	mov  rax, 1
	mov  rdi, 1
	mov  rsi, msg
	mov  rdx, len
	syscall

	mov  rax, 60
	mov  rdi, 0
	syscall 
