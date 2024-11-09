section .text 
  global _addIntegers
  global _subIntegers 
  global _mulIntegrs 
  global _divIntegers 
  global _getFactorial 

section .data 
     divisionByZero: db "Division By Zero" 
     
_addIntegers:

     ; Set up the stack frame 
     push bp 
     mov bp, sp 

     ; Get the parameters and add them together
     mov ax, [bp + 8]
     mov dx, [bp + 12]
     add ax, dx 
     mov dx, 0
     
     ; Destroy the stack frame
     pop bp 
     mov sp, bp 
     ret 

_subIntegers:
          


     ; Get the parameters and subtract them
     mov ax, [bp + 8]
     mov dx, [bp + 12]
     sub ax, dx 

     ; Destroy the stack frame     

     pop bp 
     mov sp, bp 
     ret 

_mulIntegers:

     ;Set up the stack frame
     push bp 
     mov bp, sp 


     ; Get the parameters and subtract them 
     mov ax, [bp + 8]
     mov dx, [bp + 12]
     imul dx 

     ; Destroy the stack frame
     pop bp 
     mov sp, bp 
     ret 

_divIntegers:
     
     ; set up the stack frame
     push bp 
     mov bp, sp

     ; Get the parameters and subtract them 
     mov ax, [bp + 8]
     mov dx, [bp + 12]
     
     ; Check for a division by zero error
     test dx, dx 
     jnz .notDivisionByZeroError
     mov ax, divisionByZero 

     .notDivisionByZeroError:
     idiv dx  

     ; Destroy the stack frame
     pop bp 
     mov sp, bp 
     ret 

_getFactorial:
     
     ; Setup the stack frame
     push bp 
     mov bp, sp 

     ; Get the parameters
     mov ax, [bp + 8]
     mov dx, [bp + 12]

     .handle:

     ; Check for a division by zero error 
     test dx, dx 
     jnz .notDivisionByZeroError 
     mov ax, divisionByZeroError 
     pop bp 
     mov sp, bp 
     ret 

     .notDivisionByZeroError:

     ; Check if the value of dx is 1 
     cmp dx, 1 
     jne .multiply 

     ; Destroy the stack frame and return eax
     pop bp 
     mov sp, bp 
     ret 

     .multiply:

     ; Get the factorial
     mul dx 
     sub dx 
     jmp .handle 