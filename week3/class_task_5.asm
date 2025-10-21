bits 32 ; assembling for the 32 bits architecture

global start        

extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll

segment data use32 class=data
    ;1. c+(a*a-b+7)/(2+a), a-byte; b-doubleword; c-doubleword
    a db -3
    b dd 10
    c dd 5
    ; 9-10+7= (6)/-1=-6+5=-1
segment code use32 class=code
    start:
        MOV AL,[a]
        IMUL AL  ; AX = a^2
        CWDE
        SUB EAX,[b]
        ADD EAX,7
        MOV CL,[a]
        ADD CL,2
        MOV EBX,EAX ; a*a-b+7
        MOV AL,CL
        CBW
        CWDE
        MOV ECX,EAX
        MOV EAX,EBX ; EAX=
        CDQ
        IDIV ECX
        ADD EAX,[c]

        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program