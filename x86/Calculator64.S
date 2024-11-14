section .text 
 global _setupStackFrame
 global _destroyStackFrame
 global _add
 global _subtract 
 global _multiply
 global _divide 

_setupStackFrame:
     push rbp 
     mov rbp, rsp 
     mov dx, 1

_destroyStackFrame:
     pop rbp 
     mov rsp, rbp 
     mov dx, 0
     ret 

_add:

     ; Check if the stack frame is setup
     test dx, 1 
     jne _setupStackFrame
     .handle:

          ; Get the parameters and add them
          mov rax, [rbp + 8]
          mov rdx, [rbp + 12]
          add rax, rdx 

          ; Check if we need to destroy the stack frame
          test dx, dx 
          jnz _destroyStackFrame 
          ret

_subtract:

     ; Check if the stack frame is setup 
     test dx, 1
     jne _setupStackFrame 
     .handle:

          ; Get the parameers and subtract them
          mov rax, [rbp + 8]
          mov rdx, [rbp + 12]
          sub rax, edx 

          ; Check if we need to destroy the stack frame
          test dx, dx 
          jnz _destroyStackFrame 
          ret 

_multiply:

     ; Check if the stack frame is setup
     test dx, 1
     jne _setupStackFrame 
     .handle:

          ; Get the parameters and multiply them
          mov rax, [rbp + 8]
          mov rdx, [rbp + 12]
          mul rdx 


          ; Check if we need to destroy the stack frame
          test dx, dx 
          jnz _destroyStackFrame 
          ret

_divide:

     ; Check if the stack frame is setup
     test dx, 1 
     jne _setupStackFrame 
     .handle:

          ; Get the parameters and divide them m
          mov rax, [rbp + 8]
          mov rdx, [rbp + 12]

          ; Check for a division by zero error
          test rdx, rdx 
          je .divisionByZeroError
          div rdx 

          .divisionByZeroError:
               mov rax, 1 
               
          ; Check if we need to destroy the stack framee
          test dx, dx 
          jnz _destroyStackFrame 
          ret 
