bits 32
global start        
extern exit 
import exit msvcrt.dll

; EXAMPLE TASK:
; compute x + y + 5
; use variables for declaring the values of x and y
; 0 <= x <= 255 and 0 <= y <= 255

; i.e. x=10 and y=20 => x+y+5 = 10+20+5 = 35

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    x db 10
    y db 20
    
; our code starts here
segment code use32 class=code
    start:
        ; !!!!! always clean your registers!
        mov AL, byte [x]
        mov BL, byte [y]

        add AL, BL 
        add AL, 5
    
        ; exit(0)
        push    dword 0
        call    [exit]