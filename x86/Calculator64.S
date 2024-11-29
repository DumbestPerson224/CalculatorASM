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
     mov rsi, qword ptr [rbp + 16]
     mov rdx, qword ptr [rbp + 24]
     
     ; Add the parameters
     add rsi, rdx
     mov rax, rsi
     push rax 

     ; Destroy the stack frame
     pop rax 
     pop rbp
     ret 

_subtract:

   ; Setup the stack frame
   push rbp 
   mov rbp, rsp 

   ; Get the parameters
   mov rsi, qword ptr [rbp + 16]
   mov rdx, qword ptr [rbp + 24]

   ; Subtract the parameters
   sub rsi, rdx
   mov rax, rsi
   push rax 

   ; Destroy the stack frame
   pop rax
   pop rbp  
   ret 

_multiply:

  ; Setup the stack frame
  push rbp 
  mov rbp, rsp 

  ; Get the parameters and multiply them together
  mov rsi, qword ptr [rbp + 16]
  mov rdx, qword ptr [rbp + 24]
  mov rax, rsi
  imul rdx 
  push rax 

  ; Destroy the stack frame
  pop rax 
  pop rbp
  ret 

_divide:
   
    ; Setup the stack frame
    push rbp 
    mov rbp, rsp 

    ; Get the parameters 
    mov rsi, qword ptr [rbp + 16]
    mov rdx, qword ptr [rbp + 24]

    ; Check for a division by zero error
    cmp rsi, 0
    jne .divide 
    mov rax, -1
    .end:
      pop rbp
      ret 

    .divide:
       mov rax, rdx
       div rsi
       jmp .end

_toNegative:
   
   ; Setup the stack frame
   push rbp 
   mov rbp, rsp

   ; Get the parameter and convert it to a negative
   mov rsi, qword ptr [rbp + 16]
   neg rsi 

   ; Store it into the accumulator for a proper return
   mov rax, rsi 

   ; Destroy the stack frame
   pop rbp
   ret 
