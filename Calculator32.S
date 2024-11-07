section .text 
  global _addIntegers
  global _subIntegers
  global _multiplyIntegers
  global _divideIntegers
  global _toDecimal
  global _toWhole

_addIntegers:
     
     ; Set up the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameters
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     add eax, edx      


     ; Destroy the stack frame
     pop ebp 
     mov esp, ebp 
     ret 

_subIntegers:

     ; Set up the stack frame
     push ebp
     mov ebp, esp 

     ; Get the parameters
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     sub eax, edx 
     
     ; Destroy the stack frame
     pop ebp 
     mov esp, ebp 
     ret 

_multiplyIntegers:

     ; Set up the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameters
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     imul edx 
     
     ; Destroy the stack frame 
     pop ebp 
     mov esp, ebp 
     ret 

_divide:

     ; set up the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameters
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
    

     .divisionByZeroError:
          mov eax, -1
     
     ; Check for a division by zero error
     test edx, edx
     jz .divisionByZeroError
     idiv edx 

     ; Destroy the stack frame 
     pop ebp 
     mov esp, ebp 
     ret 

_toDecimal:
     
     ; Setup the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameter and divide it by 100
     mov eax, [ebp + 8]
     mov edx, 100
     idiv edx
    
     ; Destroy the stack frame
     pop ebp 
     mov esp, ebp 
     ret  

_toWhole:

     ; Setup the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameter and multiply it by 100
     mov eax, [ebp + 8]
     mov edx, 100 
     imul edx

     ; Destroy the stack frame
     pop ebp 
     mov esp, ebp 
     ret
