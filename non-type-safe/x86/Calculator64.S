%use masm 
section .text
  global _add
  global _subtract 
  global _multiply
  global _divide 
  global _toNegative 

_add:
  
     ; Setup the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the parameters 
     ; The parameters must be 64 bit integers and rbp + 16 and rbp + 24 must be memory addresses
     mov rax, qword ptr [rbp + 16]
     mov rdx, qword ptr [rbp + 24]
     
     ; Add the parameters
     add rax, rdx

     ; Destroy the stack frame
     pop rbp
     ret 

_subtract:

   ; Setup the stack frame
   push rbp 
   mov rbp, rsp 

   ; Get the parameters
   ; The parameters must be 64 bit integers and rbp + 16 and rbp + 24 must be memory addresses
   mov rax, qword ptr [rbp + 16]
   mov rdx, qword ptr [rbp + 24]

   ; Subtract the parameters
   sub rax, rdx

   ; Destroy the stack frame
   pop rbp  
   ret 

_multiply:

  ; Setup the stack frame
  push rbp 
  mov rbp, rsp 

  ; Get the parameters and multiply them together
  ; The parameters must be 64 bit integers and rbp + 16 and rbp + 24 must be memory addresses
  mov rax, qword ptr [rbp + 16]
  mov rdx, qword ptr [rbp + 24]
  imul rdx 

  ; Destroy the stack frame
  pop rbp
  ret 

_divide:
   
    ; Setup the stack frame
    push rbp 
    mov rbp, rsp 

    ; Get the parameters 
    ; The parameters must be 64 bit integers and rbp + 16 and rbp + 24 must be memory addresses
    mov rax, qword ptr [rbp + 16]
    mov rdx, qword ptr [rbp + 24]

    ; Check for a division by zero error
    test rax, rax
    jnz .divide 
    mov rax, -1
    .end:
      pop rbp
      ret 

    .divide:
       div rdx
       jmp .end

_toNegative:
   
   ; Setup the stack frame
   push rbp 
   mov rbp, rsp

   ; Get the parameter and convert it to a negative
   ; The parameter must be a 64 bit integer and rbp + 16 must be a memory address
   mov rax, qword ptr [rbp + 16]
   neg rax 

   ; Destroy the stack frame
   pop rbp
   ret 
