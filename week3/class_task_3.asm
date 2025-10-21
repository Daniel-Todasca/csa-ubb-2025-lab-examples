bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
;a,b,c,d-byte, e,f,g,h-word
; 14. a*d*e/(f-5)
segment data use32 class=data
    ; ...
    a db 2
    d db 3
    e dw 4
    f dw 20
    

; our code starts here
segment code use32 class=code
    start:
        mov AX, 0
        mov AL, [d]
        mul byte[a] ; -> AX
        mul word[e] ; -> DX:AX
        mov BX, [f]
        SUB BX, 5
        DIV BX
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
