; O3 Ozone Project Lab
; icalc.asm
; Hudson Schumaker

bits 64

section .data
section .bss
section .text
  global _o3add, _o3sub, _o3mult, _o3pow, _o3div, _o3inc, _o3dec ; entry points

_o3add:
  mov	 rax, rdi  ; 1st arg, moved to rax
  add	 rax, rsi  ; 2sd arg, added to rax(rdi value)
  ret            ; return, rax has the sum value

_o3sub:
  mov	 rax, rdi  ; 1st arg, moved to rax
  sub	 rax, rsi  ; 2sd arg, subtracted from rax
  ret            ; return, rax has the subtraction value

_o3mult:
  mov	 rax,rdi  ; 1st arg, moved to rax
  imul rsi       ; 2sd arg, multiply rsi with rax (rdi vale)
  ret            ; return, rax has the result

_o3pow:
  mov  rax, rdi‚ ; 1st arg, moved to rax
  imul rdi       ; 2sd arg, rax(rdi) * rdi -> rdi * rdi
  ret            ; return, rax has the result

_o3div:
  mov  rax, rdi  ; 1st arg, moved to rax
  mov  rdx, 0    ; rdx needs to be 0 before idiv
  idiv rsi       ; 2sd arg, divide rax(rdi value) by rsi
  ret            ; return, rax has the result
  
_o3inc:
  mov  rax, rdi  ; 1st arg, moved to rax
  inc  rax       ; increment in 1 (++)
  ret            ; return, rax has the result

_o3dec:
  mov  rax, rdi  ; 1st arg, moved to rax
  dec  rax       ; decrement in 1 (--)    
  ret            ; return, rax has the result
