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
    x db 10  ;  (10)10 = (A)16     x - 32bit number equal to the memory location (address) 
       ; x - 32 bits number 
       ; byte [x] - the actual value = a byte
    y db 20  ;  (20)10 = 16 + 4 = (14)16
    
    
; Most assembly instructions have the following syntax:
; INSTR_NAME DEST, OPERAND
; mov EBX, 0         EBX = 0

; mov DEST, VALUE 
; DEST and VALUE must have the same representation range (datatype)


; mov EAX, ECX
; CANNOT: mov EAX, BL
    
; SECOND PART OF ANY ASSEMBLY PROGRAM - code segment for the actual code
segment code use32 class=code
    start:
        ; !!!!! always clean your registers!
        mov EAX, 5 ; EAX = 5 = AL
        
        add AL, byte [x]  ; AL = AL + x = 15
        add AL, byte [y]  ; AL = AL + y = x + y + 5 = 35
    
        ; exit(0)
        push    dword 0
        call    [exit]