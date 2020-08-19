# x86_64-NASM
NASM Assembler codes for macOS

Let's start with registers and their assignments:

Name 64 bit   | Assignments                         | Preserved across function calls | 32 bit | 16 bit | 8 bit |
--------------|-------------------------------------|---------------------------------|--------|--------|-------|
RAX           | **return register**, syscall number | no                              | EAX    | AX     | AL    |
RBX           | callee-saved register           | *yes*                           | EBX    | BX     | BL    |
RDI           | **1st argument**                | no                              | EDI    | DI     | DIL   |
RSI           | **2nd argument**                | no                              | ESI    | SI     | SIL   |
RDX           | **3rd argument**                | no                              | EDX    | DX | DL |
RCX           | **4th argument**                | no                              | ECX    | CX | CL |
RBP           | callee-saved register           | *yes*                           | EBP    | BP | BPl |
RSP           | stack pointer                   | *yes*                           | ESP    | SP | SPL |
R8            | **5th argument**                | no                              | R8D    | R8W | R8B |
R9            | **6th arguemnt**                | no                              | R9D    | R9W | R9B |
R10           | temporary register              | no                              | R10D   | R10W | R10B |
R11           | temporary register              | no                              | R11D   | R11W | R11B |
R12           | callee-saved register           | *yes*                           | R12D   | R12W | R12B |
R13           | callee-saved register           | *yes*                           | R13D   | R13W | R13B |
R14           | callee-saved register           | *yes*                           | R14D   | R14W | R14B |
R15           | callee-saved register           | *yes*                           | R15D   | R15W | R15B |

-----------------------------------------------------------------------------------------------------------------------------------

Name 128 bit  | Assignments                                       | Preserved across function calls | 32 bit | 16 bit | 8 bit |
--------------|---------------------------------------------------|---------------------------------|--------|--------|-------|
XMMO          | floating point, 1st argument, **return register** | no  |      |      |      |
XMM1          | floating point, 2sd argument                  | no  |.     |.     |.     |
XMM2          | floating point, 3rd argument                  | no  |.     |.     |.     |
XMM3          | floating point, 4th argument                  | no  |.     |.     |.     |
XMM4          | floating point, 5th argument                  | no  |.     |.     |.     |
XMM5          | floating point, 6th argument                  | no  |.     |.     |.     |
XMM6          | floating point, 7th argument                  | no  |.     |.     |.     |
...           |... |... |.|.|.|
XMM15         | | no |.|.|.|

-----------------------------------------------------------------------------------------------------------------------------------
Data types:

System       | Range                           | Byte | Initialized | Uninitialized | Bits |
-------------|---------------------------------|------|-------------|---------------|------|
byte         | 0 to 255                        |  1   |    db       |     resb      |  8   |
word         | 0 to 65.535                     |  2   |    dw       |     resw      |  16  |
doubleword   | 0 to 4.294.967.295              |  4   |    dd       |     resd      |  32  |
quadword     | 0 to 18.446.744.073.709.551.615 |  8   |    dq       |     resq      |  64  |

-----------------------------------------------------------------------------------------------------------------------------------

macOS Syscalls values:  [syscalls.master](https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master).

FreeBSD syscall | Syscall      | macOS value |
----------------|--------------|-------------|
1               | exit         | 0x02000001  |
2               | fork         | 0x02000002  |
3               | read         | 0x02000003  |
4               | write        | 0x02000004  |
5               | open         | 0x02000005  | 
6               | close        | 0x02000006  | 

-----------------------------------------------------------------------------------------------------------------------------------

macOS syscall open values:

Flag name       | macOS value | action                       |
----------------|-------------|------------------------------|
O_RDONLY        | 0x0000      | open for reading only        |
O_WRONLY        | 0x0001      | open for writing only        |
O_RDWR          | 0x0002      | open for reading and writing |
O_ACCMODE       | 0x0003      | mask for above modes         |
O_CREAT         | 0x0200      | create if nonexistant        |
O_TRUNC         | 0x0400      | truncate to zero length      |
O_EXCL          | 0x0800      | error if already exists      | 
O_TRUNC         | 0x0400      | truncate to zero length      | 

To combine flags use "OR" ex:

O_WRONLY + O_CREAT (O_WRONLY | O_CREAT) = 0x0202

-----------------------------------------------------------------------------------------------------------------------------------

macOS syscall open args:

Syscall | Id (RAX)   | 1st arg (*RDI*) | 2sd arg (*RSI*) | 3rd arg (*RDX*) | 4th arg (RCX) | 5th arg (R8) | 6th arg (R9) |
--------|------------|-----------------|-----------------|-----------------|---------------|--------------|--------------|
open    | 0x02000005 | $filename       | #flags          | #mode           |.              |.             |.             |

-----------------------------------------------------------------------------------------------------------------------------------

macOS syscall read args:

Syscall | Id (RAX)   | 1st arg (*RDI*) | 2sd arg (*RSI*) | 3rd arg (*RDX*) | 4th arg (RCX) | 5th arg (R8) | 6th arg (R9) |
--------|------------|-----------------|-----------------|-----------------|---------------|--------------|--------------|
read    | 0x02000003 | #filedescriptor | $buffer         | #count/len      |.              |.             |.             |

-----------------------------------------------------------------------------------------------------------------------------------

macOS syscall write args:

Syscall | Id (RAX)   | 1st arg (*RDI*) | 2sd arg (*RSI*) | 3rd arg (*RDX*) | 4th arg (RCX) | 5th arg (R8) | 6th arg (R9) |
--------|------------|-----------------|-----------------|-----------------|---------------|--------------|--------------|
write   | 0x02000004 | #filedescriptor | $buffer         | #count/len      |.              |.             |.             |

-----------------------------------------------------------------------------------------------------------------------------------

macOS syscall close args:

Syscall | Id (RAX)   | 1st arg (*RDI*) | 2sd arg (RSI) | 3rd arg (RDX) | 4th arg (RCX) | 5th arg (R8) | 6th arg (R9) |
--------|------------|-----------------|---------------|---------------|---------------|--------------|--------------|
close   | 0x02000006 | #filedescriptor |.              |.              |.              |.             |.             |

-----------------------------------------------------------------------------------------------------------------------------------

macOS syscall exit args:

Syscall | Id (RAX)   | 1st arg (*RDI*) | 2sd arg (RSI) | 3rd arg (RDX) | 4th arg (RCX) | 5th arg (R8) | 6th arg (R9) |
--------|------------|-----------------|---------------|---------------|---------------|--------------|--------------|
exit    | 0x02000001 | #exitcode       |.              |.              |.              |.             |.             |



