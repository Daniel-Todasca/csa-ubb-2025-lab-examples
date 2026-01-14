bits 32
 
segment code use32 public class=code
    global _sqrt_root
 
    _sqrt_root:
        mov ecx, [esp+4]
 
 
    mov eax, 0
    while_loop:
        push eax
        mul eax
        cmp eax, ecx
        ja skip
        pop eax
        inc eax
 
    jmp while_loop
 
skip:
  pop eax
  dec eax
  ret