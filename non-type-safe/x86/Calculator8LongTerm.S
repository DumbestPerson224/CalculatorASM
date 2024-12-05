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
  ; PARAMETER 1: 0xF000 (16 bit integer)
  ; PARAMETER 2: 0xF001 (16 bit integer)
  ; Result stored at 0xF000
  mov al, byte ptr [0xF000]
  mov dl, byte ptr [0xF001]
  add al, dl 

_subtract:
  
  ; Get the parameters and subtract them
  ; MEMORY ADDRESSES ARE:
  ; PARAMETER 1: 0xF002 (16 bit integer)
  ; PARAMETER 2: 0xF003 (16 bit integer)
  ; Result stored at 0x00007E02
  mov al, byte ptr [0xF002]
  mov dl, byte ptr [0xF003]
  sub al, dl 

_multiply:

  ; Get the parameters and multiply them
  ; MEMORY ADDRESSES ARE:
  ; PARAMETER 1: 0xF004 (byte)
  ; PARAMETER 2: 0xF005 (byte)
  mov al, byte ptr [0xF004]
  mov dl, byte ptr [0xF005]
  mul dl 
  ; Result is stored at 0xF004

_divide:

  ; Get the parameters
  ; MEMORY ADDRESSES ARE:
  ; PARAMETER 1: 0xF006 (byte)
  ; PARAMETER 2: 0xF007 (byte)
  ; If the correct memory addresses or byte is not provided at either memory address the program will segfault, crash or corrupt 
  ; memory
  mov al, byte ptr [0xF006]
  mov dl, byte ptr [0xF007]

  ; Check for a division by zero error
  cmp al, 0
  jg .divide 
  mov byte ptr [0xF007], -0
  .divide:
    idiv dl

 ; Result is stored at 0xF007 if no division by zero error happened

_toNegative:

  ; Get the parameter and convert it to a negative
  ; MEMORY ADDRESS IS:
  ; PARAMETER: 0xF008 
  ; Result is stored at 0xF008
  mov al, byte ptr [0xF008]
  neg al 

_triangle:
  ; Get the parameter
  ; MEMORY ADDRESS IS:
  ; PARAMETER: 0xF009
  ; Result is stored at 0xF00A
  mov al, byte ptr [0xF00A]
  mov dl, byte ptr [0xF00B]
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
 mov al, byte ptr [0xF00C]
 mov dl, byte ptr [0xF00D]
 cmp al, dl
 jnz .multiply
 mov al, -1
 .multiply:
   mul dl
