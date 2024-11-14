section .text 
     global _add 
     global _subtract 
     global _multiply 
     global _divide 

_add:
     ; Setup the stack frame
     push ebp
     mov ebp, esp 
     

     ; Get the parameters and add them together
     movps xmm0, [ebp + 8]
     movps xmm1, [ebp + 12]
     addps  xmm0, xmm1 

     ; Destroy the stack frame and return 
     pop ebp 
     mov esp, ebp 
     mov eax, xmm0 
     ret 

_subtract:

     ; Setup the stack frame
     push ebp 
     mov ebp, esp

     ; Get the parameters 
     movps xmm0, [ebp + 8]
     movps xmm1, [ebp + 12]
     
     ; Subtract them
     subps  xmm0, xmm1 

     ; Destroy the stack frame and return
     pop ebp 
     mov esp, ebp 
     mov eax, xmm0 
     ret 

_multiply:

     ; Setup the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameters
     movps  xmm0, [ebp + 8]
     movps  xmm1, [ebp + 1]

     ; Multiply them
     mulps  xmm0, xmm1 
     mov eax, xmm0 

     ; Destroy the stack frame and return
     pop ebp 
     mov esp, ebp 
     movps eax, xmm0 
     ret