%use masm 
section .text 
  global _add 
  global _subtract
  global _multiply

_add:

     ; Get the parameters and add them
     mov al, byte ptr [0x0100]
     mov dl, byte ptr [0x0101]
     add al, dl 

     ; Store into memory
     mov [0x0101], al 

_subtract:

     ; Get the parameters and subtract them
     mov al, byte ptr [0x0103]
     mov dl, byte ptr [0x0104]
     sub al, dl 

     ; Store into memory
     mov [0x0104], al 

_multiply:

     ; Get the parameters
     mov al, byte ptr [0x0105]
     mov dl, byte ptr [0x0106]
     mul al 

     ; Store into memory
     mov [0x0106], al 
