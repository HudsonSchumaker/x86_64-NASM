; 
; Hudson Schumaker
;

bits 64

section .data
    ; formula (0°C x 9/5) + 32 = 32°F
    mv:  dq 1.8   ; 9/5 
    c32: dq 32.0

section .bss
section .text
    global _celsius_to_fahrenheit

_celsius_to_fahrenheit:
    push    rbp
    mov     rbp, rsp
    movsd   xmm1, [rel mv]
    mulsd   xmm0, xmm1
    addsd   xmm0, [rel c32]
    pop     rbp
    ret
