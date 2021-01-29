; O3 Ozone Project Lab
; main.asm
; link to another asm file icalc.asm
; Hudson Schumaker

bits 64
extern _printf, _o3add, _o3sub, _o3mult, _o3pow, _o3div

section .data
  fmtint	db	"%d", 0xa, 0x0

section .text
	 global _main

_main:
   mov  rbp, rsp      ; adjust the stack
   push	rbp

   mov   rax, 0       ; no floating point
   mov   rdi, 3       ; 1st arg
   mov   rsi, 2       ; 2sd arg
   call  _o3add       ; call extern function o3add, return will be in rax

   mov   rsi, rax     ; 2sd arg for printf, rax has the return value
   mov	 rax, 0       ; no floating point
   mov	 rdi, fmtint  ; 1st arg, format for printf
   call	 _printf      ; call printf no return

   mov   rax, 0       ; no floating point
   mov   rdi, 3       ; 1st arg
   mov   rsi, 2       ; 1st arg
   call  _o3sub       ; call extern function o3sub, return will be in rax

   mov   rsi, rax     ; 2sd arg for printf, rax has the return value
   mov	 rax, 0	      ; no floating point
   mov	 rdi, fmtint  ; 1st arg, format for printf
   call	  _printf     ; call printf no return

   mov   rax, 0       ; no floating point
   mov   rdi, 3       ; 1st arg
   mov   rsi, 2       ; 1st arg
   call  _o3mult      ; call extern function o3mult, return will be in rax

   mov   rsi, rax     ; 2sd arg for printf, rax has the return value
   mov	 rax, 0       ; no floating point
   mov	 rdi, fmtint  ; 1st arg, format for printf
   call	 _printf      ; call printf no return

   mov   rax, 0       ; no floating point
   mov   rdi, 3       ; 1st arg
   call  _o3pow       ; call extern function o3pow, return will be in rax

   mov   rsi, rax     ; 2sd arg, value for be printed
   mov	 rax, 0	      ; no floating point
   mov	 rdi, fmtint  ; 1st arg, format for printf
   call	 _printf      ; call printf no return

   mov   rax, 0       ; no floating point
   mov   rdi, 600     ; 1st arg
   mov   rsi, 2       ; 2sd arg
   call  _o3div       ; call extern function o3div, return will be in rax

   mov   rsi, rax     ; 2sd arg, value for be printed
   mov	 rax, 0		    ; no floating point
   mov	 rdi, fmtint  ; 1st arg, format for printf
   call	 _printf      ; call printf no return

   call  _exit        ; call exit

_exit:
  mov     rax, 0x02000001  ; exit system call
  xor     rdi, rdi         ; out error code 0 to exit successfully
  syscall
