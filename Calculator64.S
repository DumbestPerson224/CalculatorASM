section .text 
  global _addIntegers
  global _subIntegers
  global _multiplyIntegers
  global _divideIntegers
  global _toDecimal
  global _toWhole

_addIntegers:
     
     ; Set up the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the parameters
     mov rax, [rbp + 8]
     mov rdx, [rbp + 12]
     add rax, rdx      

     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 
     ret 

_subIntegers:

     ; Set up the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the parameters
     mov rax, [rbp + 8]
     mov rdx, [rbp + 12]
     sub rax, rdx 
     
     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 
     ret 

_multiplyIntegers:

     ; Set up the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the parameters
     mov rax, [rbp + 8]
     mov rdx, [rbp + 12]
     imul rdx 
     
     ; Destroy the stack frame 
     pop rbp 
     mov rsp, rbp 
     ret 

_divide:

     ; set up the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the parameters
     mov rax, [rbp + 8]
     mov rdx, [rbp + 12]
     
    
     
     ; Check for a division by zero error
     test rdx, rdx
     jnz .notDivisionByZeroError 

     ; Handle the error code
     mov eax, -1 

     ; Destroy the stack frame 
     pop rbp 
     mov rsp, rbp 
     ret 
     
     .notDivisionByZeroError:
     idiv rdx

_toDecimal:
     
     ; Setup the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the parameter
     mov rax, [rbp + 8]
     mov rdx, 100  

     ; Check for division by zero errors
     test rax, rax
     jnz .notDivisionByZeroError
     
     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 
     ret  
     
     ; Handle division by zero error
     mov rax, -1 

     .notDivisionByZeroError:
     idiv rdx 

_toWhole:

     ; Setup the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the parameter and multiply it by 100
     mov rax, [rbp + 8]
     mov rdx, 100 
     imul rdx

     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 
     ret
