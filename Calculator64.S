section .text 
  global _addIntegers
  global _subIntegers
  global _multiplyIntegers
  global _divideIntegers
  global _toDecimal
  global _toWhole
  global _getFactorial 

section .data 
     divisionByZero: db "Division By Zero!"

_addIntegers:
     
     ; Set up the stack frame
     push rbp 
     mov rbp, rsp

     ; Get the parameters and handle the addition
     mov rax, [rbp + 8]
     mov rdx, [rbp + 12]
     add rax, rdx   
     
     ; destroy the stack frame
     pop rbp 
     mov rsp, rbp
     ret 

_subIntegers:

     ; Set up the stack frame
     push rbp 
     mov rbp, rsp

     ; Get the parameters and handle the subtraction
     mov rax, [rbp + 8]
     mov rdx, [rbp + 12]
     sub rax, rdx  ; a -= b 
     
     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 
     ret

_multiplyIntegers:

     ; Set up the stack frame
     push rbp
     mov rbp, rsp 

     ; Get the parameters and handle the multiplication
     mov rax, [rbp + 8]
     mov rdx, [rbp + 12]
     imul rdx ; a *= b 

     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 
     ret

_divideIntegers:

     ; Setup the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the parameters and handle the division
     mov rax, [rbp + 8]
     mov rdx, [rbp + 12]
     test rdx. rdxidiv rdx ; a = a / d
     
     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 
     ret 

_toDecimal:

     ; setup the stack frame
     push rbp
     mov rbp, rsp 

     ; Get the parameters
     mov rax, [rbp + 8]
     mov rdx, 100
     
     ; Check for a division by zero error
     test rdx, rdx 
     jnz .divide 
     mov eax, divisionByZero
   
     .divide:
     idiv rdx ; a = a / 100
     
     ; Destroy the stack frame 
     pop rbp 
     mov rsp, rbp
     ret 

_toWhole:

     ; setup the stack frame
     push rbp 
     mov rbp, rsp 
     
     ; Get the parameters
     mov rax, [rbp + 8]
     mov rdx, 100
     imul rdx 
     
     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 
     ret 

_getFactorial:

     ; setup the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the parameters
     mov rax, [rbp + 8]
     mov rdx, [rbp + 12]
     
     .handle:
     ; Check for a division by zero error
     test rdx, rdx 
     jnz .handleFactorial
     mov rax, divisionByZero 
   
     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 

     ; Handle the factorial
     .handleFactorial:
          mul rdx 
          sub rdx, 1
          jmp .handle 