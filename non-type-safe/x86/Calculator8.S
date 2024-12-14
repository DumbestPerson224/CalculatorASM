%use masm 
section .text 
   global _add 
   global _subtract 
   global _multiply    


%macro addition 
   add ax, cx 
%endmacro


%macro setup_stack
  push bp
  mov bp, sp 
%endmacro

%macro destroy_stack
  pop bp 
  ret 
%endmacro 

%macro load 2
  movzx ax, byte ptr [%1]
  movzx cx, byte ptr [%2]
%endmacro 

%macro subtract 
   sub ax, cx 
%endmacro 

%macro multiply 
   mul cx 
%endmacro 

_add:
  setup_stack 
  load bp+4, bp+6
  addition 
  destroy_stack 

_subtract:
   setup_stack
   load bp+4, bp+6
   subtract
   destroy_stack 

_multiply:
   setup_stack 
   load bp+4, bp+6
   multiply 
   destroy_stack 
   jo .overflow

   .overflow:
     xor ax, ax 
     xor cx, cx 
     
