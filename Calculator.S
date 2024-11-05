_increment:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    inc eax
    mov esp, ebp
    pop ebp
    ret

_decrement:
    push ebp
    mov ebp, esp
    mov eax, [esp + 8]
    dec eax
    mov esp, ebp
    pop ebp
    ret 

_add:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov ebx, [ebp + 16]
    add eax, ebx
    mov esp, ebp
    pop ebp
    ret

_sub:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov ebx, [ebp + 16]
    sub eax, ebx
    mov esp, ebp
    pop ebp
    ret

_mul:
    push ebp
    mov ebp, esp
    mov eax, [esp + 8]
    imul eax, eax
    mov esp, ebp
    pop ebp 
    ret 

_div:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    div eax 
    mov esp, ebp
    pop ebp 
    ret
    
_square:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    imul eax
    pop ebp
    ret

_towhole:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    imul eax, 100
    mov esp, ebp
    pop ebp
    ret
