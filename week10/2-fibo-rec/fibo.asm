bits 32
segment code use32 class=code
;first on stack int n
global fib
fib:
    mov eax,[esp+4]
    CMP eax ,1
    je .return
 
    CMP eax ,0
    je .return
 
    dec EAX ;n-1
    push eax;n-!
    push eax;fib(n-1)
    call fib;eax<-fib(n-1)
    add esp,4;
    mov ecx,eax;ecx<-fib(n-1)
    pop eax;eax<-n-1
    push ecx ;stack<-fib(n-1)
    dec eax;n-2
    push eax
    call fib ;fib(n-2)
    add esp,4
    pop ecx
    add eax,ecx
    ret
 
.return:
    ret