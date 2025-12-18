%include "leap.asm"

segment data use32 class=data
    months dd jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec

segment code use32 class=code
is_valid_date: ; day, month, year
    push EBP
    lea EBP, [ESP+(4*2)]
    ; args: [EBP+0], [EBP+4], ...[EBP+(4*n)]

    mov EAX, [EBP+4]
    dec EAX
    cmp EAX, 11
    jg month_not_ok
    mov EBX, [EBP]
    dec EBX ; to start from 0
    mov EDX, [EBP+(2*4)]
    call [months+EAX*4]
    jmp _quit
    month_not_ok:
    xor EAX, EAX
    _quit:
    pop EBP
    ret


; Param in (EDX - year, EBX - day), ret in EAX
apr:
jun:
sep:
nov:
    mov ECX, 30
    jmp continue

jan:
mar:
may:
jul:
oct:
dec:
aug:
    mov ECX, 31
    jmp continue

feb:
    push EDX
    call is_leap
    add ESP, 4
    cmp eax, 1
    je _29
    mov ECX, 28
    jmp continue
    _29:
    mov ECX, 29
continue:
    cmp EBX, ECX 
    jl is_ok
    mov EAX, 0
    ret
    is_ok:
    mov EAX, 1
    ret
