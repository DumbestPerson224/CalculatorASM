section .text
     global _setupStackFrame 
     global _destroyStackFrame
     global _add 
     global _subtract 

_setupStackFrame:
     push ebp 
     mov ebp, esp 
     mov ax, 1

     ; Check if ecx is valid
     cmp ecx, 0
     jnle .goto 

     .goto:
          jmp ecx

_destroyStackFrame:
     pop ebp 
     mov esp, ebp 
     mov ax, 0 

     ; Check if ecx is valid
     cmp ecx, 0
     jnle .goto 
     .goto:
     jmp ecx

_add:
     mov ecx, esp 
     cmp ax, 1
     jne _setupStackFrame
     
     ; Get the parameters and add them  
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     add eax, edx 

     ; Check if the stack frame needs to be destroyed 
     cmp ax, 1 
     je _destroyStackFrame 

_subtract:
     mov ecx, esp 
     cmp ax, 1 
     jne _setupStackFrame 

     ; Get the parameters and add them 
     mov eax, [ebp + 8]
     mov edx, [ebp + 12] 
     sub eax, edx 

     ; Check if the stack frame needs to be destroyed 
     cmp ax, 1 
     je _destroyStackFrame 