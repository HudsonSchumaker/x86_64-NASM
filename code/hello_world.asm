; hello_world.asm
; prints hello, world! using syscall
; Hudson Schumaker

section .data
    msg:  db   "hello, world!"
    len:  equ  $ - msg

section .text
    global _main
_main:
    mov rax, 0x2000004      ; 4 - sys_write
    mov rdi, 1              ; arg 1: destination. 1 = STDOUT
    mov rsi, msg            ; arg 2: char *
    mov rdx, 13             ; arg 3: len of output
    syscall
        
    mov rax, 0x2000001      ; 1 - sys_exit
    xor rdi, rdi            ; return code = 0
    syscall
