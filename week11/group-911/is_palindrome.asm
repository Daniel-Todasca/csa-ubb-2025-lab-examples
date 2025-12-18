bits 32
 
global is_palindrome       
 
 
segment code use32 class=code
 
 
is_palindrome:
    ;day = [esp + 4]
    ;month = [esp + 8]
    ;year = [esp + 12]
concatenation:    
    mov ecx, [esp + 8]
    mov eax, 1
 
    while_loop1:
        cmp eax, ecx
        jg while_loop1_end
        mov edx, 10
        mul edx
        jmp while_loop1
    while_loop1_end:
    mov edx, [esp + 4]
    mul edx
    add eax, ecx
    push eax

    mov ecx, [esp + 12]
    mov eax, 1
 
    while_loop2:
        cmp eax, ecx
        jg while_loop2_end
        mov edx, 10
        mul edx
        jmp while_loop2
    while_loop2_end:
    pop edx
    mul edx
    add eax, ecx
    push eax
building_its_reverse:
    mov ecx, 0
    while_loop3:
        cmp eax, 0
        je while_loop3_end
        push ecx
        mov ecx, 10
        mov edx, 0
        div ecx
        pop ecx
        push eax
        push edx
        mov eax, ecx
        mov ecx, 10
        mul ecx
        pop edx
        add eax, edx
        mov ecx, eax
        pop eax
        jmp while_loop3
    while_loop3_end:
 
palindrome_check:
    pop eax
    cmp eax, ecx
    je one
    xor eax, eax
    jmp return
one:
    mov eax,1
return: 
    ret