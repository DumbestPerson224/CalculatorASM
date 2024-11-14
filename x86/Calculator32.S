section .text 
     global _setupStackFrame
     global _add
     global _subtract
     global _multiply 
     global _divide 

_setupStackFrame:

     ; Check if the stack frame has already been setup
     cmp ax, 0
     je .allocate 
     jmp ecx 
     .allocate:
          push ebp 
          mov ebp, esp 
          mov ax, 1
          jmp ecx 

_add:
     mov ecx, esp 
     cmp ax, 0 
     je .setupStackFrame 
     jg .getParameters

     .setupStackFrame:
          call _setupStackFrame 

     .getParameters:
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     add eax, edx 
     mov dx, 1 
     
     ; Check if the function just blindly returned 
     .isReturnedBlindly:
          cmp dx, 1
          je .return 
          jne _return 
     
     .return:
          pop ebp 
          mov esp, ebp 
          ret 

_subtract:
     mov ecx, esp 
     cmp ax, 0
     je .setupStackFrame 
     jg .getParameters

     .setupStackFrame:
          call _setupStackFrame 

     .getParameters:
          mov eax, [ebp + 8]
          mov ecx, [ebp + 12]
          sub eax, ecx
          mov dx, 1
     
     .isReturnedBlindly:
          cmp dx, 1
          jne .getParameters
          je .return 

     .return:
          pop ebp 
          mov esp, ebp
          ret 

_multiply:
     mov ecx, esp 

     ; Check if the stack frame is setup 
     cmp ax, 0
     je .setupStackFrame 
     jne .getParameters 

     .setupStackFrame:
          call _setupStackFrame 

     .getParameters:
          mov eax, [ebp + 8]
          mov ecx, [ebp + 12]
          mul ecx 
          mov dx, 1
     
     ; Check if the function was blindly returned 
     .isReturnedBlindly:
          cmp dx, 1 
          je .return 
          jne .getParameters 
     .return:
          pop ebp 
          mov esp, ebp 
          ret

_divide:
     mov ecx, esp 
     cmp ax, 0
     je .setupStackFrame 
     jne .getParameters 
     
     .setupStackFrame:
          call _setupStackFrame 

     .getParameters:
          mov dx, 1 
          mov eax, [ebp + 8]
          mov ecx, [ebp + 12]
          cmp ecx, 0 
          jne .divide 
          mov eax, -1
          

     .isBlindlyReturned:
          cmp dx, 1
          je .getParameters 
          jne .return 
     .return:
          pop ebp 
          mov esp, ebp
          ret 
          
     .divide:
        div edx 
