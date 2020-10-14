# x86_64-NASM
NASM Assembler codes for Win

Let's start with registers and their assignments:

Name 64 bit   | Assignments                         | Preserved across function calls |
--------------|-------------------------------------|---------------------------------|
RAX           | **return register**                 | Volatile                        |
RBX           |                                     | ?                               | 
RDI           |                                     | Nonvolatile                     | 
RSI           |                                     | Nonvolatile                     | 
RCX           | **1rd argument**                    | Volatile                        | 
RDX           | **2th argument**                    | Volatile                        | 
RBP           |                                     | ?                               | 
RSP           | Stack pointer                       | Nonvolatile                     | 
R8            | **3th argument**                    | Volatile                        |
R9            | **4th arguemnt**                    | Volatile                        |
R10           |                                     | Volatile                        |
R11           |                                     | Volatile                        |
...           | ...                                 | ...                             |
R15           |                                     | ?                               | 

-----------------------------------------------------------------------------------------------------------------------------------

Name 128 bit  | Assignments                                       | Preserved across function calls | 32 bit | 16 bit | 8 bit |
--------------|---------------------------------------------------|---------------------------------|--------|--------|-------|
XMMO          | floating point, 1st argument, **return register** | no  |      |      |      |
XMM1          | floating point, 2sd argument                      | no  |.     |.     |.     |
XMM2          | floating point, 3rd argument                      | no  |.     |.     |.     |
XMM3          | floating point, 4th argument                      | no  |.     |.     |.     |
...           |... |... |.|.|.|
XMM15         |.   | no |.|.|.|

-----------------------------------------------------------------------------------------------------------------------------------

Example:
**func(int a, double b, int c, float d, int e, float f);** <br>
a in RCX, b in XMM1, c in R8, d in XMM3, f then e pushed on stack

