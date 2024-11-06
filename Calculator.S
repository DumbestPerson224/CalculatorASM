SECTION .text 
 global _addIntegers
 global _destroyStackFrame 
 global _subIntegers
 global _mulIntegers
 global _divIntegers 
 global _toDecimal 
 global _toWhole 

_addIntegers:  

     ; Setup the stack frame
     push ebp 
     mov ebp, esp
     
     ; Get the two parameters, add them and destroy the stack frame
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     add eax, edx 
     jmp _destroyStackFrame 

_destroyStackFrame:
     ; Destroy the stack frame
     pop ebp 
     mov esp, ebp 
    
     ; return eax 
     push eax 
     pop eax 
     ret 

_subIntegers:

     ; Setup the stack frame 
     push ebp 
     mov ebp, esp 

     ; Get the two parameters, subtract them and destroy the stack frame 
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     sub eax, edx 
     jmp _destroyStackFrame 

_mulIntegers:

     ; Setup the stack frame 
     push ebp 
     mov ebp, esp 

     ; Get the parameters, multiply them and destroy the stack frame
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     mul edx 
     jmp _destroyStackFrame

_divIntegers:

     ; Setup the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameters, divide them and destroy the stack frame 
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     
     ; check if the parameters are 0
     test eax, edx 
     jz .divisionByZeroError

     .divisionByZeroError:
          mov eax, -1
          
     div edx
     jmp _destroyStackFrame

_toDecimal:

     ; Setup the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameter and divide it by 100 and then destroy the stack frame
     mov eax, [ebp + 8]
     mov edx, 100
     div edx 
     jmp _destroyStackFrame 

_toWhole:

     ; Setup the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameter and multiply it by 100 and then destroy the stack frame
     mov eax, [ebp + 8]
     mov edx, 100
     mul edx 
     jmp _destroyStackFrame