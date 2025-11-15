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
        mov edi ,result
        mov ecx ,a
        mov ebx ,b
        mov eax,len1
        cmp eax , 0
            je end
        mov eax,len2
        cmp eax , 0
            je end
        while_loop:
        cmp ecx, len1*2 + a
            jge exit_loop
        cmp ebx, len2*2 + b
            jge exit_loop
        mov esi,ecx
        lodsw ;ax<-a
        cmp ax,[ebx]
            jl mov_a_to_result
            jmp mov_b_to_result
        exit_loop:
       loop_rem_a:
       cmp ecx, len1*2 + a
       jge loop_rem_exit
       mov esi,ecx
       movsw
       inc ecx
       inc ecx
       jmp loop_rem_a
       loop_rem_b:
       cmp ebx, len2*2 + b
       jge loop_rem_exit
       mov ax,[ebx]
       stosw
       inc ebx
       inc ebx
       jmp loop_rem_b

        loop_rem_exit:
        ; exit(0)
        end:
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program   
        mov_a_to_result:
        stosw
        inc ecx
        inc ecx
        jmp while_loop
        mov_b_to_result:
        mov ax,[ebx]
        stosw 
        inc ebx
        inc ebx
        jmp while_loop