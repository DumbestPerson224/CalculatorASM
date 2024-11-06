SECTION .text
     GLOBAL _addIntegers
     GLOBAL _subIntegers
     GLOBAL _mulIntegers
     GLOBAL _divIntegers
     GLOBAL _destroyStackFrame


_destroyStackFrame:
     ; Destroy the stack frame
     pop ebp 
     mov esp, ebp 

     ; return eax
     push eax 
     pop eax 
     ret 

_addIntegers:

     ; Setup the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the two parameters and add them together
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     add eax, edx 

     jmp _destroyStackFrame 

_subIntegers:
     
     ; Setup the stack frame
     push ebp 
     mov ebp, esp

     ; Get the two parameters and subtract them together 
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     sub eax, edx 

     ; Destroy the stack frame 
     jmp _destroyStackFrame

_mulIntegers:

     ; Setup the stack frame 
     push ebp 
     mov ebp, esp

     ; Get the two parameters and multiply them together
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     mul eax 

     jmp _destroyStackFrame 

_divIntegers:
     
     ; Setup the stack frame 
     push ebp 
     mov ebp, esp

     ; Get the two parameters and divide them together 
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     
     ; Check if either is 0 
     test eax, edx 
     jz .divisionByZeroError
     
     .divide:
           div eax 
           push eax 

     .divisionByZeroError:
          mov eax, -1 
          push eax 

    jmp _destroyStackFrame
