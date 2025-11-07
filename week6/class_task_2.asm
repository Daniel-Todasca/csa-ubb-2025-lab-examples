bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; A character string S is given. Obtain the string D that contains all capital letters of the string S.
    s1 db '+', '4', '2', 'a', '8', '4', 'X', '5'
    len1 equ ($ - s1)
    d resb len1

; our code starts here
segment code use32 class=code
    start:
        ; ...
        mov esi,0
        mov edi,0
        while_loop:
            cmp ESI,len1
            je while_end
            mov AL, [s1+ESI]
            inc ESI

            cmp Al, 'A'
            ja AL_bigger
            jmp skip_if

                AL_bigger:

                cmp Al, 'Z'
                jb Z_bigger
                jmp skip_if

                Z_bigger: 
                    mov [d + EDI], Al
                    inc EDI
            skip_if:
                jmp while_loop
        while_end:



        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
 