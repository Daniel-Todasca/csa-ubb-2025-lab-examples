bits 32 
global start        
extern exit
import exit msvcrt.dll
                          
segment data use32 class=data
    ; signed representation
    ; a,b,c - byte 
    
    ; (a + a*b + a*b*c) / 100

    a db -1
    b db -2
    c db 10
    d dq 10
    hundred equ 100
    
; our code starts here
segment code use32 class=code
    start:
        mov EAX, 0
        
        mov AL, [a]
        cbw 
        mov BX, AX ; BX = a
        
        mov AL, [a]
        imul byte [b] ; AX = a*b
        add BX, AX ; BX = a + a*b
        
        mov AL, [a]
        mov CL, [b] 
        imul CL ; AX = CL*AL =  a*b 
        mov CX, AX ; CX = a*b
        
        mov AL, [c]
        cbw 
        imul CX ; DX:AX = CX*AX = a*b*c

        push DX
        push AX
        pop ECX ; ECX = a*b*c
        
        mov AX, BX ; AX = a + a*b
        cwde ; EAX = a + a*b 
        add EAX, ECX ; EAX = a + a*b + a*b*c
        cdq ; EDX:EAX = a + a*b + a*b*c

        mov ECX, hundred
        idiv ECX ; EDX:EAX / ECX = EAX
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
