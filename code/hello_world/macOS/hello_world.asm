; hello_world.asm
; prints hello, world! using syscall
; Hudson Schumaker
;

section .data
    msg:  db   "hello, world!"
    len:  equ  $ - msg

section .text
    global _main
_main:
    mov rax, 0x02000004     ; 4 - sys_write
    mov rdi, 1              ; 1st arg : destination. 1 = STDOUT
    mov rsi, msg            ; 2sd arg : char *
    mov rdx, 13             ; 3rd arg : len of output
    syscall
        
    mov rax, 0x02000001     ; 1 - sys_exit
    xor rdi, rdi            ; return code = 0
    syscall
