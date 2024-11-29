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
   mov rax, qword ptr [rbp + 16]
   neg rax 

   ; Destroy the stack frame
   pop rbp
   ret 
