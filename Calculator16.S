SECTION .text 
  GLOBAL _addIntegers 
  GLOBAL _subIntegers 
  GLOBAL _mulIntegers 
  GLOBAL _divIntegers 

SECTION .data 
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
     
     ; Set up the stack frame 
     push bp 
     mov bp, sp 

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