section .text
     global _setupStackFrame 
     global _destroyStackFrame
     global _add 
     global _subtract 

_setupStackFrame:
     push ebp 
     mov ebp, esp 
     mov ax, 1

     ; Check if esp is valid 
     cmp ecx, esp 
     j
_destroyStackFrame:
     pop ebp 
     mov esp, ebp 
     mov ax, 0 

     ; Validate esp 
     cmp esp, ecx 
     je esp 
     jne ecx 

_add:
     mov ecx, esp 
     cmp ax, 0
     je .setupStackFrame 
     jg .handle 

     .setupStackFrame
          call _setupStackFrame
     
     .handle:
     ; Get the parameters and add them  
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     add eax, edx 

     ; Check if the stack frame needs to be destroyed 
     cmp ax, 1 
     je .destroyStackFrame 

     .destroyStackFrame:
          call _destroyStackFrame 

_subtract:
     mov ecx, esp 
     cmp ax, 1 
     jne .setupStackFrame 
     je .handle 

     .setupStackFrame:
          call _setupStackFrame 

     .handle:
     ; Get the parameters and add them 
     mov eax, [ebp + 8]
     mov edx, [ebp + 12] 
     sub eax, edx 

     ; Check if the stack frame needs to be destroyed 
     cmp ax, 1 
     je .destroyStackFrame 

     .destoryStackFrame:
          call _destroyStackFrame