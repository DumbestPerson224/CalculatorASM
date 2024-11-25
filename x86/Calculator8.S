section .text
   global _add
   global _subtract
   global _multiply
   global _divide

_add:

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; This function adds two integers              ;
   ; Parameter (uint8_t) AL                       ;
   ; Parameter (uint8_t) CL                       ;
   ; Returns AL + CL                              ;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ; Setup the stack frame
   push bp
   mov bp, sp

   ; Get the parameters and add them
   mov al, [bp + 4]
   mov cl, [bp + 8] 
   add al, cl

   ; Destroy the stack frame
   pop bp
   mov sp, bp
   ret

_subtract:

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; This function subracts two intebers ;
   ; Parameter (uint8_t) AL              ;
   ; Parameter (uint8_t) CL              ;
   ; Returns AL - CL                     ;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; Setup the stack frame
  push bp
  mov bp, sp

  ; Get the parameters and subtract them
  mov al, [bp + 4]
  mov cl, [bp + 8]
  sub al, cl

  ; Destroy the stack frame
  pop bp
  mov sp, bp
  ret

_multiply:

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; This function multiplies two integers ;
   ; Parameter (uint8_t) AL                ;
   ; Parameter (uint8_t) CL                ; 
   ; Returns AL * CL                       ;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ; Setup the stack frame
   push bp
   mov bp, sp

   ; Get the parameters and multiply them
   mov al, [bp + 4]
   mov cl, [bp + 8]
   mul cl 

   ; Destroy the stack frame
   pop bp
   mov sp, bp
   ret

_divide:

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; This function divides the two parameters   ;
   ; Paramerer AL (uint8_t)                     ;
   ; Parameter CL (uint8_t)                     ;
   ; Returns AL / BL if AL > 0                  ;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ; Setup the stack frame
   push bp
   mov sp, bp

  ; Get the parameters
  mov al, [bp + 4]
  mov cl, [bp + 8]

 ; Check for a division by zero error
 cmp al, 0
 mov al, -1
 jg .divide
  
 .end:
   ; Destroy the stack frame
   pop bp
   mov sp, bp
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
