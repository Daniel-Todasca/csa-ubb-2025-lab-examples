; further reading: https://en.wikipedia.org/wiki/Leap_year_problem
; https://en.wikipedia.org/wiki/Leap_year

section .text
is_leap:
    push EBP
    lea EBP, [ESP+(4*2)]
    ; args: [EBP+0], [EBP+4], ...[EBP+(4*n)]
    mov EAX, [EBP]
    test EAX, 0b11
    jz .diviz4
        xor eax, eax
        jmp .quit
    .diviz4:
        mov ECX, 100
        xor EDX, EDX
        div ECX
        cmp EDX, 0
        je .diviz100
        mov EAX, 1
        jmp .quit
    .diviz100:
        test EAX, 0b11
        jz .diviz400
        xor eax, eax
        jmp .quit
    .diviz400:
        mov EAX, 1
        jmp .quit
    .quit:
    pop EBP
    ret