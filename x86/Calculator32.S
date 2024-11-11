section .text 
  global _addIntegers
  global _subIntegers
  global _multiplyIntegers
  global _divideIntegers
  global _toDecimal
  global _toWhole
  global _getRemainder
  global _getFactorial
  global _getSummation

section .data
    divisionByZero: db "Division By Zero Error!", 0

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
     mov eax, divisionByZero

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

 ; Check for a divison by zero error 
 .divisionByZeroError:
 test edx, edx
 jnz .getRemainder
 mov eax, divisionByZero
 jz .end 

.end:
; Destroy the stack frame
pop ebp
mov esp,ebp
ret 
 
.getRemainder:
div edx
sub eax, edx
mov eax, edx 
xor edx, edx
jmp .end 

_getFactorial:

  ; Setup the stack frame
  push ebp
  mov ebp, esp

  ; Get the parameters
  mov eax, [ebp + 8]
  mov edx, [ebp + 12]

  .handle:
  ; Multiply until edx is zero
  test edx, edx
  jnz .multiply
  jz .end

  .multiply:
  imul edx
  sub edx, 1
  jmp .handle

_getSummation:

  ; Setup the stack frame
  push ebp
  mov ebp, esp

  ; Get the parameter
  mov eax, [ebp + 8]

  .handle:
  
  ; Add until edx is met
  cmp eax, edx
  jne .increment
  pop ebp
  mov esp, ebp
  ret

  .increment:
      mov edx, eax
      inc edx
      add eax, edx
      jmp .handle
