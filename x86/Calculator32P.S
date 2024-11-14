SECTION .text
     global _add
     global _sub
     global _multiply
     global _divide 
_add:
     movsd xmm0, [rbp + 8]
     movsd xmm1, [rbp + 12]
     addsd xmm0, xmm1
     mov rax, xmm0
     ret 

_sub:    
     movsd xmm0, [rbp + 8]
     movsd xmm1, [rbp + 12]
     subsd xmm0, xmm1 
     movsd rax, xmm0 
     ret 

_multiply:
     movsd xmm0, [rbp + 8]
     movsd xmm1, [rbp + 12]
     mulsd xmm0, xmm1 
     movsd rax, xmm0
     ret 
_divide:
     movsd xmm0, [rbp + 8]
     movsd xmm1, [rbp + 12]
     divsd xmm0, xmm1 
     mov rax, xmm0
     ret 
