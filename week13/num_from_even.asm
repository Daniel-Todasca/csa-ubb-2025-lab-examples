bits 32
segment code use32 public class=code
    global _num_from_even

    _num_from_even:
        mov EAX, [ESP+4]
        push EBX

    mov EBX, 0

    while_digits:

        cmp EAX, 0
        je skip
        mov EDX, 0
        mov ECX, 10
        div ECX
        test EDX, 1
        jnz is_odd

        push EDX
        inc EBX

        is_odd:

    jmp while_digits

    skip:

    mov EAX, 0

    while_num:
        cmp EBX, 0
        je skip2
        dec EBX
        mov ECX, 10
        mul ECX
        pop EDX
        add EAX, EDX
    jmp while_num

    skip2:
        pop EBX
        ret