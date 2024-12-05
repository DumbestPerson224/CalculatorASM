%use masm 
section .text 
  global _add 
  global _subtract
  global _multiply
  global _divide
  global _triangle
  global _square

_add:

  ; Get the parameters and add them
  ; MEMORY ADDRESSES ARE:
  ; PARAMETER 1: 0x00007E00 (16 bit integer)
  ; PARAMETER 2: 0x00007E01 (16 bit integer)
  ; Result stored at 0x00007E00
  mov al, byte ptr [0x00007E00]
  mov dl, byte ptr [0x00007E01]
  add al, dl 

_subtract:
  
  ; Get the parameters and subtract them
  ; MEMORY ADDRESSES ARE:
  ; PARAMETER 1: 0x00007E02 (16 bit integer)
  ; PARAMETER 2: 0x00007E03 (16 bit integer)
  ; Result stored at 0x00007E02
  mov al, byte ptr [0x00007E02]
  mov dl, byte ptr [0x00007E03]
  sub al, dl 

_multiply:

  ; Get the parameters and multiply them
  ; MEMORY ADDRESSES ARE:
  ; PARAMETER 1: 0x00007E04 (word)
  ; PARAMETER 2: 0x00007E05 (word)
  mov al, byte ptr [0x00007E04]
  mov dl, byte ptr [0x00007E05]
  mul dl 
  ; Result is stored at 0x0007E04

_divide:

  ; Get the parameters
  ; MEMORY ADDRESSES ARE:
  ; PARAMETER 1: 0x00007E04 (word)
  ; PARAMETER 2: 0x00007E05 (word)
  ; If the correct memory addresses or byte is not provided at either memory address the program will segfault, crash or corrupt 
  ; memory
  mov al, byte ptr [0x00007E07]
  mov dl, byte ptr [0x00007E08]

  ; Check for a division by zero error
  cmp al, 0
  jg .divide 
  mov byte ptr [0x00007E08], -0
  .divide:
    idiv dl

 ; Result is stored at 0x00007E07 if no division by zero error happened

_toNegative:

  ; Get the parameter and convert it to a negative
  ; MEMORY ADDRESS IS:
  ; PARAMETER: 0x00007E09 
  ; Result is stored at 0x00007E09
  mov al, byte ptr [0x00007E09]
  neg al 

_triangle:
  ; Get the parameter
  ; MEMORY ADDRESS IS:
  ; PARAMETER: 0x00007E0A
  ; Result is stored at 0x00007E0A
  mov al, byte ptr [0x0007E0A]
  mov dl, byte ptr [0x0007E0B] 
  mul dl 
  mov cl, 2 

  ; Check for divisions by zero
  cmp al, 0 
  jg .divide 
  mov al, -1 
  .divide:
    div cl 

_square:
 ; Get the parameter
 ; MEMORY ADDRESS IS:
 ; PARAMETER: 0x00007E0C
 ; Result is stored at 0x00007E0C
 mov al, byte ptr [0x00007E0C]
 mov dl, byte ptr [0x00007E0D]
 cmp al, dl
 jnz .multiply
 mov al, -1
 .multiply:
   mul dl
