section .text 
   global _setupStackFrame
   global _destroyStackFrame 
   global _add 
   global _subtract 
   global _multiply 
   global _divide
   global _toWhole
   global _toDecimal 

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

     ; Check if either parameter is 0 
     test eax, edx 
     jz .additionError
     
     ; Add them together
     add eax, edx 

     .additionError:
          mov eax, -1

     ; Check if we need to destroy the stack frame
     test dx, dx
     jnz _destroyStackFrame 
     ret ;if not just return

_subtract:
     mov ecx, esp

     ; Check if the stack frame is setup
     test dx, dx 
     jnz _setupStackFrame 

     ; Get the parameters 
     mov eax, [ebp + 8]
     mov ecx, [ebp + 12]

     ; Check if either eax or ecx is zero
     test eax, ecx 
     jz .subtractionError
     sub eax, ecx
     .subtractionError:
          mov eax, -2

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
     mov ecx, [ebp + 12]

     ; Check if either parameter is zero 
     test eax, ecx
     jz .multiplyError
     .multiply:
     ; Multiply them
     mul edx 

     .multiplyError:
          mov eax, -3

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
     test edx, eax
     jnz .notDivisionByZeroError
     
     .divisionByZeroError:
     mov eax, -4

     .destroy: 
          ; Check if we need to destroy the stack frame
          test dx, dx 
          jz _destroyStackFrame 
          ret 

     .notDivisionByZeroError:
     div edx 
     jmp .destroy

_toWhole:

   ; Check if the stack frame is setup 
   test dx, dx 
   jnz _setupStackFrame 

   ; Get the parameter and divide it by 100
   movsd xmm0, [ebp + 8]
   movsd xmm1, 100

   ; Check for a division by zero error 
   cmpsd xmm0, 0
   jne .notDivisionByZeroError 
   .divisionByZeroError:
   mov eax, -1 
   
   .end:
     ; Check if we need to destroy the stack frame
     test dx, dx 
     jz _destroyStackFrame 
     ret
   .notDivisionByZeroError:
   divsd xmm0, xmm1
   jmp .end 

_toDecimal:

     ; Check if the stack frame needs to be setup 
     test dx, dx
     jnz _setupStackFrame 

     ; Get the parameter and multiply it by 100
     mov eax, [ebp + 8]
     mov ecx, 100
     mul ecx 

     ; Check if we need to destroy the stack frame 
     test dx, dx 
     jz _destroyStackFrame 
     ret 