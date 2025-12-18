bits 32 ; assembling for the 32 bits architecture
; declare the EntryPoint (a label defining the very first instruction of the program)
global start 
%include "is_valid_date.asm"

extern exit, printf, scanf, is_palindrome    
import exit msvcrt.dll
import printf msvcrt.dll
import scanf msvcrt.dll
                           ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions
; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    day dd 0
    month dd 0
    year dd 0
    int_format db "%d", 0
    int_print_format db "%d", 10, 0
; our code starts here
segment code use32 class=code
test_leap:
    push dword 2000
    call is_leap
    add ESP, 4
    push dword 2004
    call is_leap
    add ESP, 4
    push dword 2006
    call is_leap
    add ESP, 4
    push dword 2100
    call is_leap
    add ESP, 4
    ret
test_date_valid:
    mov edx, 2000
    push edx
    mov edx, 2
    push edx
    mov edx, 29
    push edx
    call is_valid_date
    add ESP, 4*3
    push 2000
    push 12
    push 31
    call is_valid_date
    add ESP, 4*3
    push 1999
    push 2
    push 29
    call is_valid_date
    add ESP, 4*3
    ret

    start:
        ;call test_leap
        ;call test_date_valid
        push day         ; so we push the address
        push int_format 
        call [scanf]    ; external function needs []
        add ESP, 4 * 2
        push month         ; so we push the address
        push int_format 
        call [scanf]    ; external function needs []
        add ESP, 4 * 2
        push year         ; so we push the address
        push int_format 
        call [scanf]    ; external function needs []
        add ESP, 4 * 2
        push dword [year]
        push dword [month]
        push dword [day]
        call is_valid_date
        add esp, 4 * 3
        push eax
        push int_print_format
        call [printf]
        add ESP, 4 * 2
        push dword [year]
        push dword [month]
        push dword [day]
        call is_palindrome
        add esp, 4 * 3
        push eax
        push int_print_format
        call [printf]
        add ESP, 4 * 2
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program