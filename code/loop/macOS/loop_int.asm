; O3 project lab
; loop
; Hudson Schumaker

extern _o3prtInt, _o3prt

section .data
  x dd 0
  y dd 1000
  fmtstr: db   "%s", 0xA, 0x0       ; format for printing a string, "\n" and end the "string"

section .text
  global _main

_main:
   push    rbp
   mov     rbp, rsp

   mov	   rdi, x
   movsx   r12, dword [rdi]

   mov	   rdi, y
   movsx   r13, dword [rdi]

   jmp _L2
   jmp _exit

_L3:
    mov     rdi, r12
    mov     rax, 0
    call    _o3prtInt
    inc     r12

_L2:
    cmp r12, r13
    jne _L3

_exit:
   mov     rax, 0x02000001       ; exit system call
   xor     rdi, rdi              ; out error code 0 to exit successfully
   syscall
