bits 32 

global start        
 
extern exit               

import exit msvcrt.dll    

segment data use32 class=data
    ;a,b,c - byte, d - word
    ;3. [-1+d-2*(b+1)]/a
    a db 10  ; 1Bytes
    b db 1   ; 1Bytes
    d dw 10  ; 2Bytes

    q dq 0x1234567877776666 ; observe little endian

segment code use32 class=code
    start:
        mov AL, [b]; AL = 1
        add AL, 1 ; AL = b+1
        mov DL, 2;
        mul DL; AX = AL*DX
        add AX, 1;
        sub [d], AX;
        mov AX, [d]; AX=d
        div byte[a];

        push    dword 0      ; push the parameter for exit onto the stack

        call    [exit]       ; call exit to terminate the program

 