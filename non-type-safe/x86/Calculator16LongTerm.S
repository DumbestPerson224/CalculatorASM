%use masm 
section .text 
  global _add 
  global _subtract
  global _multiply
  global _divide
  global _toNegative

_add:

  ; Get the parameters and add them
  mov ax, word ptr [0x00007E00]
  mov dx, word ptr [0x00007E01]
  add ax, dx 

_subtract:
  
  ; Get the parameters and subtract them
  mov ax, word ptr [0x00007E02]
  mov dx, word ptr [0x00007E03]
  sub ax, dx 

_multiply:

  ; Get the parameters and multiply them
  mov ax, word ptr [0x00007E04]
  mov dx, word ptr [0x00007E05]
  mul dx 

_divide:

  ; Get the parameters
  mov ax, word ptr [0x00007E07]
  mov dx, word ptr [0x00007E08]

  ; Check for a division by zero error
  cmp ax, 0
  jg .divide 
  mov word ptr [0x00007E08], -0
  .divide:
    idiv dx 

_toNegative:

  ; Get the parameter and convert it to a negative
  mov ax, word ptr [0x00007E09]
  neg ax 
