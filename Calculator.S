SECTION .text 
 global _addIntegers
 global _destroyStackFrame 
 global _subIntegers
 global _mulIntegers
 global _divIntegers 
 global _toDecimal 
 global _toWhole 
 global _setupStackFrame 

org 0x1000 
_addIntegers:
     .setup:
          test ecx, 0x1000 
          jne .setupAddress
          .setupAddress:
               mov ecx, 0x1000
               push ecx 
               jmp _setupStackFrame 

_subIntegers:

     ; check if we need to setup the stack frame
     .setup:
          test ecx, 0x1001 
          jne .setupAddress
          .setupAddress:
               mov ecx, 0x1001 
               push ecx 
               jmp _setupStackFrame 

     ; handle the subtraction
     .handle:
          mov eax, [ebp + 8]
          mov edx, [ebp + 12]
          add eax, edx 
          push eax 
          jmp _destroyStackFrame
          
_mulIntegers:

     ; check if we need to setup the stack frame
     .setup:
          test ecx, 0x1002
          jne .setupAddress 
          .setupAddress:
               mov ecx, 0x1002
               push ecx 
               jmp _setupStackFrame

     ; handle the multiplication
     .handle:
          mov eax, [ebp + 8]
          mov edx, [ebp + 12]
          mul edx 
          push eax 
          jmp _destroyStackFrame 

_divIntegers:

     ; check if we need to setup the stack frame
     .setup:
          test ecx, 0x1003
          jne .setupAddress
          .setupAddress:
               mov ecx, 0x1003
               push ecx 
               jmp _setupStackFrame 

     ; handle the division
     .handle:
          mov eax, [ebp + 8]
          mov edx, [ebp + 12]
          div edx 
          push eax 
          jmp _destroyStackFrame 

_toDecimal:

     ; check if we need to setup the stack frame
     .setup:
          test ecx, 0x1004 
          jne .setupAddress
          .setupAddress:
                    mov ecx, 0x1004
                    push ecx 
                    jmp _setupStackFrame 
     
     ; handle the conversion
     .handle:
          mov eax, [ebp + 8]
          mov edx, 100
          div edx 
          push eax 
          jmp _destroyStackFrame 

_toWhole:

     ; check if we need to setup the stack frames
     .setup:
          test ecx, 0x1005
          jne .setupAddress 
          .setupAddress:
               mov ecx, 0x1005 
               push ecx 
               jmp _setupStackFrame
               
     ; handle the conversion
     .handle:
          mov eax, [ebp + 8]
          mov edx, 100
          mul edx 
          push eax 
          jmp _destroyStackFrame 

_setupStackFrame:  

     ; Setup the stack frame 
     push ebp 
     mov esp, ebp 
     
     ; Go back to the function
     pop ecx 
     jmp ecx 

_destroyStackFrame:
     
     ; Destroy the stack frame
     pop ebp 
     mov esp, ebp 

     ; Return eax
     pop eax 
     ret