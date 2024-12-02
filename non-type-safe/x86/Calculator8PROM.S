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
  mov al, byte ptr [0x7E00]
  mov dl, byte ptr [0x7E01]
  add al, dl 

_subtract:
  
  ; Get the parameters from memory and subtract them
  mov al, byte ptr [0x7E02]
  mov dl, byte ptr [0x7E03]
  sub al, dl

_multiply:

  ; Get the parameters from memory and multiply them
  mov al, byte ptr [0x7E04]
  mov dl, byte ptr [0x7E05]
  mul dl 

_divide:

  ; Get the parameters from memory
  mov al, byte ptr [0x7E06]
  mov dl, byte ptr [0x7E07]

  ; Check for a division by zero error
  cmp al, 0
  jg .divide 
  mov byte ptr [0x7E08], -0
  .divide:
    idiv dl 

_toNegative:

  ; Get the parameter from memory and convert it to a negative
  mov al, byte ptr [0x7E09]
  neg al 
  
