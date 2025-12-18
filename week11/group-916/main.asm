bits 32
global start        
extern exit, printf,scanf,is_leap
 
import exit msvcrt.dll    
import printf msvcrt.dll
import scanf msvcrt.dll
extern is_valid_date
                         
segment data use32 class=data
    day dd 0
    month dd 0
    year dd 0
    format db '%d',0
    text db "it works",0
    leap_work db "it also works",0
    leap_dosent db "it sodent work :(",0
    palindrom_str resb 8
segment code use32 class=code
    start:
        push day
        push format
        call[scanf]
        add esp,4*2
 
        push month
        push format
        call[scanf]
        add esp,4*2
 
        push year
        push format
        call[scanf]
        add esp,4*2
 
        push dword[year]
        call is_leap
        add esp,4
 
        cmp eax,1
        je leap_print
        push leap_dosent
        call[printf]
        add esp,4
        jmp out_leap_print
        leap_print:
            push dword leap_work
            call [printf]
            add esp,4
        out_leap_print:
 
        push dword [year]
        push dword [month]
        push dword [day]
        call is_valid_date
        add esp,4*3
        cmp eax,1
      ; je print
        jmp out_print
        ;
        push dword[year]
        push dword[month]
        push dword[day]
        call day_date_to_str
        add esp,4*3

        ; idea is:
        ; convert date to string
        ; then implement a separate module to do palindrome checking on the string
     
 
        print:
 
        push dword text
        call[printf]
        add esp,4
   
        out_print:
 
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program  
;day/month/year
day_date_to_str:
    mov esi,0
    loop_day:
    mov ax,[esp+4]
    cmp ax,0
    je month_date_str
    mov dx,0
    mov bx,10
    div bx
    mov [palindrom_str+esi],bx
    inc esi
    jmp loop_day
 
month_date_str:
   
    mov ax,[esp+8]
    loop_month:
    mov dx,0
    mov bx,10
    div bx
    mov [palindrom_str+esi],bx
    inc esi
 
    cmp ax,0
    je year_date_str
    jmp loop_month
 
year_date_str:
    mov ax,[esp+12]
    year_loop:
    mov dx,0
    mov bx,10
    div bx
    mov [palindrom_str+esi],bx
    inc esi
 
    je return
    jmp year_loop
 
return:
    ret