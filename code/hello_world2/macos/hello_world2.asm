; hello_world2.asm
; prints using printf 
; Hudson Schumaker

bits 64

section .data	
	msg1	db	"Hello, World!",0	
	msg2	db	"Yes, I am here!",0	
	radius	dd	357	
	pi		dq	3.14
	fmtstr	db	"%s",10,0  ; format for printing a string	
	fmtflt	db	"%lf",10,0 ; format for a float
	fmtint	db	"%d",10,0  ; format for an integer 
section .bss	
section .text	
extern	_printf	
	global _main	
main:
    push	rbp
    mov		rbp,rsp
    mov		rax, 0		; no floating point
    mov		rdi, fmtstr	
    mov		rsi, msg1
    call	printf	
    mov		rax, 0		; no floating point
    mov		rdi, fmtstr
    mov		rsi, msg2
    call	printf	
    mov		rax, 0		; no floating point
    mov		rdi, fmtint
    mov		rsi, [rel radius]
    call	printf	
    mov		rax, 1		; 1 xmm register used
    movq	xmm0, [rel pi]
    mov		rdi, fmtflt
    call	printf
    mov		rsp,rbp
    pop		rbp
