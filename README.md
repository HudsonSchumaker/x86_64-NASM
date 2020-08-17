# x86_64-NASM
NASM Assembler codes for macOs

Let's start with registers and their assignments:

Name 64 bit   | Assignments                     | Preserved across function calls | 32 bit | 16 bit | 8 bit |
--------------|---------------------------------|---------------------------------|--------|--------|-------|
RAX           | return register, syscall number | no  | EAX | AX | AL  |
RBX           |                                 | yes | EBX | BX | BL  |
RDI           | 1st argument                    | no  | EDI | DI | DIL |
RSI           | 2nd argument                    | no  | ESI | SI | SIL |
RDX           | 3rd argument                    | no  | EDX | DX | DL |
RCX           | 4th argument                    | no  | ECX | CX | CL |
RBP           |                                 | yes | EBP | BP | BPl |
RSP           | stack pointer                   | yes | ESP | SP | SPL |
R8            | 5th argument                    | no  | R8D | R8W | R8B |
R9            | 6th arguemnt                    | no  | R9D | R9W | R9B |
R10           | temporary register              | no  | R10D | R10W | R10B |
R11           | temporary register              | no  | R11D | R11W | R11B |
R12           | callee-saved register           | yes | R12D | R12W | R12B |
R13           | callee-saved register           | yes | R13D | R13W | R13B |
R14           | callee-saved register           | yes | R14D | R14W | R14B |
R15           | callee-saved register           | yes | R15D | R15W | R15B |


