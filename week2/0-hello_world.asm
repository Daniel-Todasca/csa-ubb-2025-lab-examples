bits 32
global start        
extern exit 
import exit msvcrt.dll

; EXAMPLE TASK:
; compute x + y + 5
; use variables for declaring the values of x and y
; 0 <= x <= 255 and 0 <= y <= 255

; i.e. x=10 and y=20 => x+y+5 = 10+20+5 = 35

; FIRST PART OF ANY ASSEMBLY PROGRAM - data segment for data declaration
segment data use32 class=data
    x db 10
    y db 20
    
; SECOND PART OF ANY ASSEMBLY PROGRAM - code segment for the actual code
segment code use32 class=code
    start:
        ; !!!!! always clean your registers!
        mov EAX, 0
        mov   , 0
        
        mov AL, byte [x]  ; AL = x
        mov BL, byte [y]  ; BL = y

        add AL, BL        ; AL = AL + BL = x + y
        add AL, 5         ; AL = AL + 5 = x + y + 5
    
        ; exit(0)
        push    dword 0
        call    [exit]