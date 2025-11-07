bits 32
global start        
extern exit             
import exit msvcrt.dll  

; TASK: Two character strings S1 and S2 are given. Obtain the string D which contains all the elements of S1 that do not appear in S2.
; S1: '+', '4', '2', 'a', '8', '4', 'X', '5'
; S2: 'a', '4', '5'
; D: '+', '2', '8', 'X'

; read for more efficient implementations: https://softwareengineering.stackexchange.com/questions/280361/list-comparing-techniques-for-faster-performance

segment data use32 class=data
    s1 db '+', '4', '2', 'a', '8', '4', 'X', '5'
    len1 equ ($ - s1)
    s2 db 'a', '4', '5'
    len2 equ ($ - s2)
    d resb len1


segment code use32 class=code
    start:

        mov ecx, len1
        jecxz for_end

        mov esi, 0
        mov edi, 0
        for_loop:
            mov al, [s1 + esi]
            inc esi

            mov ebx, 0
            while_loop:
                cmp ebx, len2
                je while_end

                ;al == s2[ebx]
                cmp al, [s2 + ebx]
                je skip

                inc ebx
                jmp while_loop
            while_end:

            mov [d + edi], al
            inc edi

            skip:
        loop for_loop

        for_end:

        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
