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
  pop ebp 
  ret 
%endmacro 

%macro load 2
  movsx ax, byte ptr [%1]
  movsx cx, byte ptr [%2]
%endmacro 

%macro subtract 
   sub ax, cx 
%endmacro 

%macro multiply 
   mul cx 
%endmacro 

_add:
  setup_stack 
  load 
  addition 
  destroy_stack 

_subtract:
   setup_stack
   load 
   subtract
   destroy_stack 

_multiply:
   setup_stack 
   load 
   multiply 
   destroy_stack 
   jo .overflow

   .overflow:
     xor ax, ax 
     xor cx, cx 
     