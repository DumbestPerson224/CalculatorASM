section .data
   video_interrupt: equ 0x10
   disk_interrupt:  equ 0x13
   kernel_address:  equ 0x7E00
section .text
   global _start

%macro output 1
  mov ah, 0x0E
  mov al, %1
  int video_interrupt
%endmacro

%macro read_disk 4
  mov ah, 0x02
  mov al, 0x01  ; Number of sectors to read
  mov bx, %1    ; Buffer address 
  mov ch, %2    ; Cylinder
  mov cl, %3    ; Sector number
  mov dh, %4    ; Head number
  int disk_interrupt
%endmacro

%macro write_disk 4
  mov ah, 0x01
  mov al, 0x01 ; Number of sectors to read
  mov bx, %1   ; Bufferr address
  mov ch, %2   ; Cylinder
  mov cl, %3   ; Sector number
  mov dh, %4   ; Head number
  int disk_interrupt

%macro setup_stack 1
  xor ax, ax
  mov ss, ax
  mov sp, %1
%endmacro

_start:
   setup_stack 0x7C00
   read_disk 0x0, 0x7E00, 0x0, 0x0
   jc .write
   .boot:
      jmp 0x7E00:0x0000

   .write:
      write_disk 0x0, kernel_address, 0x0, 0x0
  
dw 0xAA55 ; Boot signature
times 510 - ($ - $$) db 0 ; Fill the rest with zeros
