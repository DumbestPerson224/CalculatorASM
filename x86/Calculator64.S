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
     mov edx, 1

_destroyStackFrame:
     pop rbp 
     mov rsp, rbp
     ret 
     mov edx, 0

_add:

     ; Check if the stack frame is setup
     cmp edx, 0 
     je _setupStackFrame

     .handle:

          ; Get the parameters and add them
          mov rax, [rbp + 8]
          mov rdx, [rbp + 12]
          add rax, rdx 

          ; Check if we need to destroy the stack frame
          cmp edx, 1
          je _destroyStackFrame 
          ret

_subtract:

     ; Check if the stack frame is setup 
     cmp edx, 0
     je _setupStackFrame 

     .handle:

          ; Get the parameers and subtract them
          mov rax, [rbp + 8]
          mov rdx, [rbp + 12]
          sub rax, rdx 

          ; Check if we need to destroy the stack frame
          cmp edx, 1
          je _destroyStackFrame 
          ret 

_multiply:

     ; Check if the stack frame is setup
     cmp edx, 0
     je _setupStackFrame 
     .handle:

          ; Get the parameters and multiply them
          mov rax, [rbp + 8]
          mov rdx, [rbp + 12]
          mul rdx 


          ; Check if we need to destroy the stack frame
          cmp edx, 1
          je _destroyStackFrame 
          ret

_divide:

     ; Check if the stack frame is setup
     cmp edx, 0
     je _setupStackFrame 

     .handle:
          ; Get the parameters and divide them 
          mov rax, [rbp + 8]
          mov rdx, [rbp + 12]

          ; Check for a division by zero error
          test rdx, rdx 
          jz .divisionByZeroError
          div rdx 
          .needToDestroyStackFrame:
                       ; Check if we need to destroy the stack framee
                       cmp edx, 1
                       je _destroyStackFrame 
                       ret 

          .divisionByZeroError:
               mov rax, 1 
               jmp .needToDestroyStackFrame
          
