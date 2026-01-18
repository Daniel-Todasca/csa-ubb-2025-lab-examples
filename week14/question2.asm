bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    TabHexa db '123456789ABCDEF'

; our code starts here
segment code use32 class=code
    start:
        mov EBX, [TabHexa]
        mov EAX, 1
        xlat 
        
        ; 1. fix all the syntax errors or logical errors in the code 
        ; 2. what will be inside AL after the code gets executed?
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
