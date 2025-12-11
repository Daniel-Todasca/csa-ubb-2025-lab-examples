bits 32
segment code use32 class=code
    global is_valid_date
    is_valid_date:
        mov eax,[esp+4]
        mov edx,[esp+8]
        mov ecx,[esp+12]
 
        cmp ecx,0
        jl .invalid_date
        mov eax,1
        ret
 
 
.invalid_date:
mov eax,0
ret