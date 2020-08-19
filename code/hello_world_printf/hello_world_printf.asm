; NASM assembly for Mac OS X x64
; hello_world_printf.asm
; prints hello, world! using external C printf.
; Hudson Schumaker

extern _printf                        ; external function of C 
section .data                         ; your data here
    msg:    db   "hello, world!", 0x0 ; in c "string" ends with 0
    fmtstr: db   "%s", 0xA, 0x0       ; format for printing a string

section .text   ; your code here
    global _main

_main:
    push    rbp
    mov     rbp, rsp

    mov     rax, 0       ; no floating point
    mov     rdi, fmtstr  ; 1st arg : destination.
    mov     rsi, msg     ; 2sd arg : char *
    call    _printf

    mov     rax, 0x02000001   ; 1 - sys_exit
    xor     rdi, rdi          ; return code = 0
    syscall
