%use masm 
section .text 
  global _add 
  global _subtract
  global _multiply
  global _divide
  global _toNegative
  global _start
  global _output
  org 0x7C00

_output:
 mov ah, 0x0E
 int 0x10

_halt:
   hlt

_start:

  ; Setup the stack
  cli
  xor ax, ax 
  mov ss, ax
  mov sp, 0x7C00

_readSectorNumber:
  ; Read the sector number
  mov dx, 0x1F2
  in al, dx 
  ret

_writeSector: 
  ; Write to the sector
  mov dx, 0x1F2
  in al, dx 
  mov al, dl 
  ret 

_add:

  ; Get the parameters from memory and add them
  mov al, byte ptr [0x7E00]
  mov dl, byte ptr [0x7E01]
  add al, dl 
  call _writeSector

_subtract:
  
  ; Get the parameters from memory and subtract them
  mov al, byte ptr [0x7E02]
  mov dl, byte ptr [0x7E03]
  sub al, dl
  call _writeSector

_multiply:

  ; Get the parameters from memory and multiply them
  mov al, byte ptr [0x7E04]
  mov dl, byte ptr [0x7E05]
  mul dl 
  call _writeSector
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
  call _writeSector

_toNegative:

  ; Get the parameter from memory and convert it to a negative
  mov al, byte ptr [0x7E09]
  call _writeSector
  neg al 

times 510 - ($ - $$) db 0 ; fill the rest of the boot sector with zeros
dw 0xAA55                 ; boot signature
