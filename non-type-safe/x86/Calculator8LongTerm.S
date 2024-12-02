%use masm 
section .text 
  global _add 
  global _subtract
  global _multiply
  global _divide

_add:

     ; Get the parameters and add them
     mov al, byte ptr [0x0100]
     mov dl, byte ptr [0x0101]
     add al, dl 

     ; Store into memory
     mov ptr [0x0101], al 

_subtract:

     ; Get the parameters and subtract them
     mov al, byte ptr [0x0102]
     mov dl, byte ptr [0x0103]
     sub al, dl 

     ; Store into memory
     mov ptr [0x0103], al

_multiply:

     ; Get the parameters
     mov al, byte ptr [0x0104]
     mov dl, byte ptr [0x0105]
     mul dl 

     ; Store into memory
     mov ptr [0x0105], al 

_divide:

     ; Get the parameters
     mov al, byte ptr [0x0106]
     mov dl, byte ptr [0x0107]

     ; Check for a division by zero
     cmp al, 0
     jg .divide
     mov byte ptr [0x0107], -0
     
     .divide:
          idiv dl 
          mov ptr [0x0107], al
