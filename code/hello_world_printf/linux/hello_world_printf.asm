; NASM assembly for Linux
; hello_world_printf.asm
; prints hello, world! using external C printf.
; int printf(const char *format, ...);
; Hudson Schumaker
;

bits 64
extern printf                         ; external function of C 
section .data                         ; your data here
    msg:    db   "hello, world!", 0x0 ; in c "string" ends with 0
    fmtstr: db   "%s", 0xA, 0x0       ; format for printing a string, "\n" and end the "string"

section .text     ; your code here
    global main   ; entry point

main:
    push    rbp
    mov     rbp, rsp

    mov     rax, 0       ; no floating point
    mov     rdi, fmtstr  ; 1st arg : format
    mov     rsi, msg     ; 2sd arg : char *
    call    printf       ; call c function with args

    mov     rax, 60      ; 1 - sys_exit
    xor     rdi, rdi     ; return code = 0
    syscall
