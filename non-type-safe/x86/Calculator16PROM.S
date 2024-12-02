%use masm 
section .text 
  global _add 
  global _subtract
  global _multiply
  global _divide
  global _toNegative
  org 0x7C00
_add:

  ; Get the parameters from memory and add them
  mov ax, byte ptr [0x7E00]
  mov dx, byte ptr [0x7E01]
  add ax, dx 

_subtract:
  
  ; Get the parameters from memory and subtract them
  mov ax, byte ptr [0x7E02]
  mov dx, byte ptr [0x7E03]
  sub ax, dx 

_multiply:

  ; Get the parameters from memory and multiply them
  mov ax, byte ptr [0x7E04]
  mov dx, byte ptr [0x7E05]
  mul dx 

_divide:

  ; Get the parameters from memory
  mov ax, byte ptr [0x7E06]
  mov dx, byte ptr [0x7E07]

  ; Check for a division by zero error
  cmp ax, 0
  jg .divide 
  mov byte ptr [0x7E08], -0
  .divide:
    idiv dx 

_toNegative:

  ; Get the parameter from memory and convert it to a negative
  mov ax, byte ptr [0x7E09]
  neg ax 
  
