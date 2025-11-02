bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a dw 3
    b db 4
    c db 5
    e dd 6
    r resw 1
    q resq 1

; our code starts here
segment code use32 class=code
    start:
        ; 30. a*b-(100-c)/(b*b)+e; a-word; b,c-byte; e-doubleword; unsinged
        mov BL, 100
        mov AL, [c]
        sub BL, AL ; 100-c
        
        mov AL, [b]
        imul AL ; b*b
        mov word[r], AX
        
        mov AL, BL
        cbw
        cwd; AL->DX:AX
        
        idiv word[r] ; AX=(100-c)/(b*b)
        mov [r], AX
        
        mov AL, [b]
        cbw
        mov BX, [a]
        imul BX; DX:AX=a*b
        
        push DX
        push AX
        pop EAX ; DX:AX->EAX
        mov EBX, EAX
        
        mov AX, [r]
        cwde
        
        sub EBX, EAX ;EAX=a*b-(100-c)/(b*b)
        
        add EBX, [e]; a*b-(100-c)/(b*b)+e
        mov EAX, EBX
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
