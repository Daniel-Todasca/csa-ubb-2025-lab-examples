bits 32
global start        
extern exit, printf,scanf,fib
import exit msvcrt.dll    
import printf msvcrt.dll
import scanf msvcrt.dll
 
segment data use32 class=data
a dd 0
format db "%d",0
segment code use32 class=code
    start:
    push a
    push format
    call[scanf]
    add esp,4*2
    push dword[a]
    call fib
    push eax
    push format
    call[printf]
    add esp,4*2
