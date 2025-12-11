bits 32                        
segment code use32 public class=code
    global fibo_rec
    ; int fibo_rec(int n)
    fibo_rec:
        mov EAX,[ESP+4]
        cmp EAX,2
        jbe .skip_function_calls
 
        dec EAX
        mov ECX,EAX
        push ECX
        push EAX
        call fibo_rec
        add ESP,4
        pop ECX
        mov EDX,EAX
       
        push EDX
        dec ECX
        push ECX
        call fibo_rec
        add ESP,4
        pop EDX
        add EAX,EDX
        ret
 
        .skip_function_calls:
            mov EAX,1
        ret