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
        
        ; (a + a*b) + a*b*c = BX + DX:AX = 0:BX + DX:AX
        add AX, BX 
        adc DX, 0 
        
        mov CX, 100
        idiv CX ; DX:AX / 100 = AX
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
