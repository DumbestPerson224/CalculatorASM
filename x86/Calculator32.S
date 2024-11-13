section .text 
   global _setupStackFrame
   global _destroyStackFrame 
   global _add 
   global _subtract 
   global _multiply 
   global _divide

_setupStackFrame:
     mov dx, 1
     cmp cx, 0
     je .allocate
     jmp ecx 

     .allocate:
     mov cx, 1
     push ebp 
     mov ebp, esp
     
_destroyStackFrame:
     mov dx, 0
     cmp cx, 1
     je .deallocate
     jmp ecx 

     .deallocate:
     mov cx, 0
     pop ebp 
     mov esp, ebp 
     ret 

_add:
     mov ecx, ebp
     
     ; Check if the stack frame is setup
     test dx, dx
     jz _setupStackFrame 

     ; Get the parameters
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]

     ; Add them together
     add eax, edx 

     ; Check if we need to destroy the stack frame
     test dx, dx
     jz _destroyStackFrame 
     ret ;if not just return

_subtract:
     mov ecx, esp

     ; Check if the stack frame is setup
     test dx, dx 
     jnz _setupStackFrame 

     ; Get the parameters 
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]

     ; Subtract them together
     sub eax, edx 

     ; Check if we need to destroy the stack frame 
     test dx, dx 
     jz _destroyStackFrame 
     ret 

_multiply:
     mov ecx, esp 

     ; Check if we need to setup the stack frame
     test dx, dx 
     jnz _setupStackFrame 
     
     ; Get the parameters
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]

     ; Multiply them
     mul edx 

     ; Check if we need to destroy the stack frame
     test dx, dx 
     jz _destroyStackFrame 
     ret

_divide:
     mov ecx, esp  

     ; Check if we need to setup the stack frame
     test dx, dx 
     jnz  _setupStackFrame 

     ; Get the parameters
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]

     ; Check for a division by zero error
     cmp edx, 0
     jnz .notDivisionByZeroError
     
     .divisionByZeroError:
     mov eax, -1 

     .destroy: 
          ; Check if we need to destroy the stack frame
          test dx, dx 
          jz _destroyStackFrame 
          ret 

     .notDivisionByZeroError:
     div edx 
     jmp .destroy
