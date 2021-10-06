; O3 Ozone Project Lab
; math.asm - math functions for integers
; Created by Hudson Schumaker on 07.09.20

bits 64
section .data
section .bss

section .text
  global _addi, _subi, _multi, _powi, _divi, _inci, _deci

_addi:
  mov	 rax, rdi
  add	 rax, rsi
  ret

_subi:
  mov	 rax, rdi
  sub	 rax, rsi
  ret

_multi:
  mov	 rax, rdi
  imul rsi
  ret

_powi:
  mov  rax, rdi
  imul rdi
  ret

_divi:
  mov  rax, rdi
  mov  rdx, 0
  idiv rsi
  ret

_inci:
  mov  rax, rdi
  inc  rax
  ret

_deci:
  mov  rax, rdi
  dec  rax
  ret
