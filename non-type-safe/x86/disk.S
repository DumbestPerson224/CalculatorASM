org [0x7C00]
section .text
  global _start

_start:

  ; Check if the bootloader already there
  mov ah, 02h  ; Read to disk
  mov cl, 0    ; Cylinder number
  mov dh, 0x00 ; Sector number
  mov dx, 0x7C00 ; Where it is
  int 0x13
  jc .write

  .write:

     ; Tell the computer where to write the bootloader

     mov ah, 03h    ; Write to disk
     mov cl, 0      ; Cylinder number
     mov dh, 0x0    ; Sector number
     mov dx, 0x7C00 ; Where it is
     int 0x13

  jmp $
