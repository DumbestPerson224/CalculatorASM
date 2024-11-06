section .text 
  global _addIntegers
  global _subIntegers
  global _multiplyIntegers
  global _divideIntegers

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
     idiv edx 

     ; Destroy the stack frame 
     pop ebp 
     mov esp, ebp 
     ret 