%use masm 
section .text
   global _add
   global _subtract
   global _multiply
   global _divide
   global _toNegative

_add:
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; This function adds two parameters  ;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ; Setup the stack frame
   push bp 
   mov bp, sp 

   ; Get the parameters and add them together
   mov al, byte ptr [bp - 4]
   mov cl, byte ptr [bp - 6]
   add al, cl

   ; Destroy the stack frame
   pop bp
   ret 

_subtract:
    
    ; Setup the stack frame
    push bp 
    mov bp, sp 

    ; Get the parameters and subtract the parameters
    mov al, byte ptr [bp + 4]
    mov dl, byte ptr [bp - 6]
    sub al, dl 
    
    ; Destroy the stack frame
    pop bp
    ret 

_multiply:

   ; Setup the stack frame
   push bp 
   mov bp, sp 

   ; Multiply the parameters
   mov al, byte ptr [bp - 4]
   mov dl, byte ptr [bp - 6]
   imul dl

   ; Destroy the stack frame
   pop bp
   ret

_divide:

  ; Setup the stack frame
  push bp 
  mov bp, sp 

  ; Get the parameters and check for a division by zero error
  mov al, byte ptr [bp - 4]
  mov cl, byte ptr [bp - 6]
  cmp al, 0
  mov al, -1
  jnz .divide 
  .end:
   pop bp
   ret 
  
  .divide: 
     div cl 
     jmp .end

;;;;;;;;;;;;;;;
;  C example  ;
;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; uint8_t add(uint8_t num1, uint8_t num2){      ;
;   return num1 + num2;                         ;
;}                                              ;
;                                               ;
; uint8_t subtract(uint8_t num1, uint8_t num2){ ;
;   return num1 - num2;                         ;
;}                                              ;
;                                               ;
; uint8_t multiply(uint8_t num1, uint8_t num2){ ;
;   return num1 * num2;                         ;
;}                                              ;
;                                               ;
; uint8_t divide(uint8_t num1, uint8_t num2){   ;
;   if(num1 > 0){                               ;
;      return num1 / num2;                      ;
;   }else{                                      ;
;     return -1;                                ;
;   }                                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
