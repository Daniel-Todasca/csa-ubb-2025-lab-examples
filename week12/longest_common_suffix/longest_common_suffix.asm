bits 32                         
segment code use32 public class=code
    global _longest_common_suffix
    ; int longest_common_suffix(const char* first, const char* second)
    ; abcabc 
    ; aaaabc
    _longest_common_suffix:
        mov EAX, [esp + 4]  ; first string pointer
        mov ECX, [esp + 8]  ; second string pointer
        push ESI
        push EDI
        push EBX
        mov ESI, 0
        loop_get_lenght:
            mov DL, [EAX + ESI]
            inc ESI
            cmp DL, 0
            jne loop_get_lenght
        dec ESI          ; ESI now has length of first string
        mov EDI, 0
        loop_get_lenght2:
            mov DL, [ECX + EDI]
            inc EDI
            cmp DL, 0
            jne loop_get_lenght2
        dec EDI          ; EDI now has length of second string

        mov EDX, 0      ; EDX will hold the count of common suffix characters
        compare_suffix:
            cmp ESI, 0
            je done
            cmp EDI, 0
            je done
            mov BH, [EAX + ESI - 1]
            mov BL, [ECX + EDI - 1]
            cmp BH, BL
            jne done
            dec ESI
            dec EDI
            inc EDX
            jmp compare_suffix
        done:
        mov EAX, EDX  ; move the result into EAX
        pop EBX
        pop EDI
        pop ESI
        ret