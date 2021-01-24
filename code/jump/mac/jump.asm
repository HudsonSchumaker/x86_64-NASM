; O3 Ozone Project Lab
; jump.asm
; Hudson Schumaker

bits 64
extern _printf

section .data
	number1	dq	42
	number2	dq	41
	fmt1	db	"NUMBER1 > = NUMBER2",10,0
	fmt2	db	"NUMBER1 < NUMBER2",10,0

section .bss

section .text
	global 	_main
_main:

  mov   rbp, rsp; for correct debugging
	push	rbp
	mov	  rbp, rsp

  mov 	rax, [rel number1]	; move the numbers into registers
	mov 	rbx, [rel number2]
	cmp 	rax, rbx	         	; compare rax and rbx
	jge 	greater	          	; rax greater or equal go to greater:

  mov	  rdi, fmt2		        ; rax is smaller, continue here
  mov	  rax, 0			        ; no xmm involved
	call 	_printf		          ; display fmt2

  jmp 	exit		            ; jump to label exit:

greater:
	mov	  rdi, fmt1	; rax is greater
	mov	  rax, 0		; no xmm involved
	call 	_printf		; display fmt1

exit:
; exit program
  mov     rax, 0x02000001
  xor     rdi, rdi
  syscall
