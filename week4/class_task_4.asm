bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
; 16. x/2+100*(a+b)+e*e; a,c-word; b,d-byte; e-doubleword; x,y-qword
segment data use32 class=data
    a dw 10
    c dw 10
    b db 10
    d db 10
    e dd 10
    x dq 0x1_0000_0000

    ; ...

; our code starts here
segment code use32 class=code
    start:
        mov ax, 0
        mov ax,[a]

        ; mov bx,0
        ; mov bl,byte[b]
        mov bx, ax

        mov al, byte [b]
        cbw ; ax = word from [b]


        add ax, bx ; ax = a + b
        mov cx, 100  ; cx = 100
        imul cx ; ax * cx = dx:ax

        push dx
        push ax

        mov eax, e ; eax = e
        imul eax ; edx:eax = e*e
        pop ebx
        add eax, ebx  ; edx:eax + 0:ebx = e*e + (a+b)*100
        adc edx, 0

        mov edi, edx
        mov esi, eax 

        mov eax,[x]
        mov edx,[x+4]
        mov ecx, 2
        idiv ecx

        mov edx, 0
        add eax, esi
        adc edx, edi

        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
 