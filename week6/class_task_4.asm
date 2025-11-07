bits 32 ; assembling for the 32 bits architecture
 
; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
   a db "AbCdeF"
   len equ $-a
   line resb len


; our code starts here
segment code use32 class=code
    start:
        mov ecx,len
        jecxz end_loop
        mov edi,0
        start_loop:
        mov eax,len
        sub eax,ecx
        cmp byte[a+eax],'A'
        jb before_end_loop
        cmp byte[a+eax],'Z'
        ja before_end_loop

        mov dl,[a+eax]

        mov [line+edi],dl
        inc edi

        before_end_loop:
        loop start_loop

        end_loop:

        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program

