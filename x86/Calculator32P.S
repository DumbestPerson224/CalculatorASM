SECTION .text
     global _add
     global _sub
     global _multiply
     global _divide 
_add:
     push ebp
     mov ebp, esp
     movsd xmm0, [rbp + 8]
     movsd xmm1, [rbp + 12]
     addsd xmm0, xmm1
     pop ebp
     mov esp, ebp 
     ret 

_sub:    
     push ebp
     mov ebp, esp
     movsd xmm0, [rbp + 8]
     movsd xmm1, [rbp + 12]
     subsd xmm0, xmm1 
     pop ebp     
     mov esp, ebp
     ret 

_multiply:
     push esp
     mov ebp, esp
     movsd xmm0, [rbp + 8]
     movsd xmm1, [rbp + 12]
     mulsd xmm0, xmm1 
     movsd rax, xmm0
     pop ebp
     mov esp, ebp
     ret 
_divide:
     push ebp
     mov ebp, esp
     movsd xmm0, [rbp + 8]
     movsd xmm1, [rbp + 12]
     divsd xmm0, xmm1 
     mov rax, xmm0
     pop ebp
     mov esp, ebp
     ret 
