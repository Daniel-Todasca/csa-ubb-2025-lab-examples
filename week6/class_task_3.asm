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
    s2 db "a45"
    length1 equ s2-s1
    length2 equ $-s2
    d resb length1

segment code use32 class=code
    start:
        mov ESI, 0
        mov EDI,0
        start_while:
            cmp ESI, length1
            jae end_while
            inc ESI
            mov EDX, 0
            start_iterate_s2:
                cmp EDX, length2
                jae end_iterate_s2
                mov BL, [s2+EDX]
                cmp [s1+ESI-1], BL
                je start_while
                inc EDX
                jmp start_iterate_s2
            end_iterate_s2:
            mov BL, [s1+ESI-1]
            mov [d+EDI], BL
            inc EDI
            jmp start_while
        end_while:
        ; exit(0)

        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
 