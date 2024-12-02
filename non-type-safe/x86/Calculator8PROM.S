%use masm 
section .text 
  global _add 
  global _subtract
  global _multiply
  global _divide
  global _toNegative
  org 0x00008001
_add:

  ; Get the parameters and add them
  mov ax, word ptr [0x00008002]
  mov dx, word ptr [0x00008003]
  add ax, dx 

_subtract:
  
  ; Get the parameters and subtract them
  mov ax, word ptr [0x00008004]
  mov dx, word ptr [0x00008005]
  sub ax, dx 

_multiply:

  ; Get the parameters and multiply them
  mov ax, word ptr [0x00008006]
  mov dx, word ptr [0x00008007]
  mul dx 

_divide:

  ; Get the parameters
  mov ax, word ptr [0x00008008]
  mov dx, word ptr [0x00008009]

  ; Check for a division by zero error
  cmp ax, 0
  jg .divide 
  mov word ptr [0x0000800A], -0
  .divide:
    idiv dx 

_toNegative:

  ; Get the parameter and convert it to a negative
  mov ax, word ptr [0x0000800B]
  neg ax 
  
