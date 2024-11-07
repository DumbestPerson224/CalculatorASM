section .text 
  global _addIntegers
  global _subIntegers
  global _multiplyIntegers
  global _divideIntegers
  global _toDecimal
  global _toWhole
  global _getRemainder

_addIntegers:
     
     ; Set up the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameters
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]
     add eax, edx      

     ; Clear edx
     xor edx, edx
 
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

     ; Clear EDX
     xor edx, edx

   
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

     ; Clear edx
     xor edx, edx 
 
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
    

     .divisionByZeroError:
     test edx, edx
     jnz .divide
     mov eax, -1

     .divide:
     idiv edx 

     ; Clear EDX to ensure that we don't have any issues related to storing the unneeded sum
     xor edx, edx 

     ; Destroy the stack frame 
     pop ebp 
     mov esp, ebp 
     ret 

_toDecimal:
     
     ; Setup the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameter and divide it by 100
     mov eax, [ebp + 8]
     mov edx, 100
     idiv edx

     ; Clear edx
     xor edx, edx

     ; Destroy the stack frame
     pop ebp 
     mov esp, ebp 
     ret  

_toWhole:

     ; Setup the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameter and multiply it by 100 
     mov eax, [ebp + 8]
     mov edx, 100 
     imul edx

     ; Clear edx
     xor edx, edx

     ; Destroy the stack frame
     pop ebp 
     mov esp, ebp 
     ret

_getRemainder:

  ; Setup the stack frame
  push ebp
  mov ebp, esp

  ; Get the parameters
  mov eax, [ebp + 8]
  mov edx, [ebp + 12]

 ; Check if the dividant is zero
 test edx, edx
 jz .divisionByZeroError
 jnz .getRemainder

 .getRemainder:
   idiv edx 
   sub eax, edx

   ; Clear edx
   xor edx, edx
   
; handle division by zero error
.divisionByZeroError:
    mov eax, -1
    xor edx, edx

; Destroy the stack frame
pop ebp
mov esp, ebp
ret
