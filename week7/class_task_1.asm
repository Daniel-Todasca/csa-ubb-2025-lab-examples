bits 32
global start        
extern exit             
import exit msvcrt.dll    

segment data use32 class=data
    ; merge 2 sorted lists a and b given as input
    a dw -25, -10, 0, 0, 10, 100, 300
    len1 equ ($-a) / 2
    b dw -30, 0, 1, 2, 3, 150
    len2 equ ($-b) / 2
    result resw len1 + len2
    ; in this example, result = -30, -25, -10, 0, 0, 0, 1, 2, 3, 10, 100, 150, 300

segment code use32 class=code
    start:
        mov esi, a
        mov ecx, b
        mov edi, result

        while_loop_start:
            cmp esi, a + len1 * 2
            jge while_loop_end
            cmp ecx, b + len2 * 2
            jge while_loop_end

            lodsw 
            cmp ax,word [ecx]
            jl a_less

            dec esi
            dec esi
            mov ax, word [ecx]
            inc ecx
            inc ecx
            a_less:
                stosw

            jmp while_loop_start
        while_loop_end:

        while_a:
            cmp esi, a + len1 * 2
            jge while_a_end

            movsw

            jmp while_a
        while_a_end:

        while_b:
            cmp ecx, b + len2 * 2
            jge while_b_end

            mov ax, word [ecx]
            inc ecx
            inc ecx
            stosw

            jmp while_b
        while_b_end:

        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program    