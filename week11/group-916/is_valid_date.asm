bits 32
extern is_leap
segment data use32 class=data
    days dd 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
 
segment code use32 class=code
    global is_valid_date
    is_valid_date:
        mov eax,[esp+4]
        mov edx,[esp+8]
        mov ecx,[esp+12]
 
        cmp ecx,0
        jl invalid_date
       
 
        cmp edx,1
        jl invalid_date
        cmp edx,12
        jg invalid_date
 
        cmp eax,1
        jl invalid_date
        cmp eax,31
        jg invalid_date
 
        cmp edx,2
        je february
        jmp out_february
 
        february:
        push eax
        push edx
        push ecx
        call is_leap
        cmp eax,1
        pop ecx
        pop edx
        pop eax
        je leap
        jne not_leap
            leap:
            cmp eax,29
            jg invalid_date
            jmp out1
 
            not_leap:
            cmp eax,28
            jg invalid_date
            jmp out1
 
 
        out_february:
       
        dec edx
        cmp eax,[days+4*edx]
        jg invalid_date
       
        out1:
 
 
        mov eax,1
        ret
 
 
invalid_date:
mov eax,0
ret