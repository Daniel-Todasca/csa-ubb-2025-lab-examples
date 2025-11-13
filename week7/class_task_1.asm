bits 32
global start        
extern exit             
import exit msvcrt.dll    
                          
segment data use32 class=data
    ; merge 2 sorted lists a and b given as input
    a dw -25, -10, 0, 0, 10, 100, 300
    len1 equ ($-a) / 2
    b dw -30, 0, 1, 2, 3, 150
    len2 equ ($-b) / 2
    result resw len1 + len2
    ; in this example, result = -30, -25, -10, 0, 0, 0, 1, 2, 3, 10, 100, 150, 300

segment code use32 class=code
    start:
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program    