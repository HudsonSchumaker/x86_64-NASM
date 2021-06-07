;
; Hudson Schumaker
;
extern _celsius_to_fahrenheit, _printf

bits 64

section .data
    double: dq 32.0           ; value to be converted
    fmtstr: db "%f", 0xA, 0x0 ; format for printing a string, "\n" and end the "string"

section .text
    global _main

_main:
    push  rbp
    mov   rbp, rsp

    mov	  rax, 1
    movq  xmm0, [rel double]
    call  _celsius_to_fahrenheit
    
    push  rbp
    mov   rbp, rsp
    call  _out
    call  _exit

_out:
    mov     rax, 1       ; one xmm register used
    mov     rdi, fmtstr  ; 1st arg : format
   ;        xmm0,        ; 2sd arg : xmm0 with the return value
    call    _printf      ; call c function with args

_exit:
  mov      rax, 0x2000001       ; exit system call
  mov      rdi, 0               ; out error code 0 to exit successfully
  syscall
