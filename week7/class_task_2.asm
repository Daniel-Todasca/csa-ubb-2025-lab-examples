bits 32
global start        
extern exit             
import exit msvcrt.dll    
                          
segment data use32 class=data
    ; A word string s is given. Build the byte string d such that each element d[i] contains:
    ; - the count of zeros in the word s[i], if s[i] is a negative number
    ; - the count of ones in the word s[i], if s[i] is a positive number
    s dw -22, 145, -48, 127 ; in binary: 1111111111101010, 10010001, 1111111111010000, 1111111
    len equ ($-s)/2
    result resb len

segment code use32 class=code
    start:
        ; in the homework, when you want to build the output result:
        ; use stosb, stosw...

        ; when you want to iterate over your input:
        ; please use lodsb, lodsw...
		
		mov ESI, s
		mov EDI, result
		mov ECX, len
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program