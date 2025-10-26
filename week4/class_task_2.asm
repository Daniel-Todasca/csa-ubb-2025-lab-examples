bits 32 ; assembling for the 32 bits architecture
;unsgined
; declare the EntryPoint (a label defining the very first instruction of the program)
global start        
; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions
; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a dw 10
    c dw 11
    b db 2
    d db 7
    e dd 13
    x dq 0x10000000   
;16. x/2+100*(a+b)-3/(c+d)+e*e; a,c-word; b,d-byte; e-doubleword; x,y-qword
segment code use32 class=code
    start:
        mov eax,[e]
        imul eax 
        push edx
        push eax
        ; stack qw e*e
        mov al,[d]
        cbw
        add ax,[c];(c+d)
        mov bx,ax;bx<-(c+d)
        mov ax,3
        mov dx,0
        idiv bx
        push ax;  3/(c+d) on the stack word
        ;good to clear eax first
        mov al,[b]
        cbw
        add ax,[a]
        mov bx,100
        imul bx;100*(a+b)
        push dx
        push ax;100*(a+b) stack dd
        mov eax ,[d]
        mov edx,[d+4]
        mov ebx,2
        idiv ebx;eax
        pop ebx
        add eax,ebx
        mov ebx, eax
        pop ax
        cwde
        sub ebx,eax
        mov eax,ebx
        cdq
        pop ebx ;eax
        pop ecx ;edx
        add eax,ebx
        adc edx,ecx
 
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program