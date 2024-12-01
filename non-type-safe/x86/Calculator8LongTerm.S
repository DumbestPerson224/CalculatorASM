%use masm 
section .text 
  global _add 
  global _subtract

_add:

     ; Setup the stack frame 
     push bp 
     mov bp, sp 

     ; Get the parameters and add them
     mov al, byte ptr [bp + 4]
     mov dl, byte ptr [bp + 8]
     add al, dl 

     ; Store into memory
     mov [0x0000], al 

     ; Destroy the stack frame 
     pop bp 
     ret 

_subtract:

     ; Setup the stack frame
     push bp 
     mov bp, sp 

     ; Get the parameters and subtract them
     mov al, byte ptr [bp + 4]
     mov dl, byte ptr [bp + 8]
     sub al, dl 

     ; Store into memory
     mov [0x0001], al 

     ; Destroy the stack frame
     pop bp 
     ret 
