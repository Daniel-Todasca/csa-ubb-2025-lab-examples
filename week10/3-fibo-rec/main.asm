bits 32
global start        
extern exit, printf
import exit msvcrt.dll    
import printf msvcrt.dll
 
extern fibo_rec
                         
segment data use32 class=data
    n dd 32
    format db "fib(%d)=%d", 0
 
segment code use32 class=code
    start:
        ; fibo_rec(int n)
        push dword [n]
        call fibo_rec
        add ESP,4
 
        ; printf(&format, n,fibo_rec(n))
        push EAX
        push dword [n]
        push format
        call [printf]
        add ESP, 4 * 3
       
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program