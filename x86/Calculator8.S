section .text
   global _add
   global _subtract
   global _multiply
   global _divide
   global _toNegative

_add:

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; This function adds two integers              ;
   ; Parameter (uint8_t) AL                       ;
   ; Parameter (uint8_t) DL                       ;
   ; Returns AL + DL                              ;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ; Setup the stack frame
   push bp
   mov bp, sp

   ; Get the parameters and add them
   mov al, byte ptr [bp + 4]
   mov dl, byte ptr [bp + 8] 
   add byte ptr [al], byte ptr [dl]

   ; Save the accumulator's result, so if it is overwritten we can still save the sum
   push al
   
   ; Destroy the stack frame
   pop al 
   pop bp
   mov sp, bp
   ret

_subtract:

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; This function subracts two intebers ;
   ; Parameter (uint8_t) AL              ;
   ; Parameter (uint8_t) DL              ;
   ; Returns AL - DL                     ;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; Setup the stack frame
  push bp
  mov bp, sp

  ; Get the parameters and subtract them
  mov al, byte ptr [bp + 4]
  mov dl, byte ptr [bp + 8]
  sub byte ptr [al], byte ptr [dl]
  push al

  ; Destroy the stack frame
  pop al
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
   mov al, byte ptr [bp + 4]
   mov cl, byte ptr [bp + 8]
   mul byte ptr [cl] 

   ; Save the result
   push al

   ; Destroy the stack frame
   pop al
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
  mov al, byte ptr [bp + 4]
  mov cl, byte ptr [bp + 8]

 ; Check for a division by zero error
 cmp byte ptr [al], 0
 mov byte ptr [al], -1
 push al
 jg .divide
  
 .end:
   ; Destroy the stack frame
   pop al
   pop bp
   mov sp, bp
   ret

 .divide:
    div cl
    push al
    jmp .end

_toNegative:

    ; Setup the stack frame
    push bp
    mov bp, sp 

    ; Get the parameter and convert it into a negative
    mov si, byte ptr [bp + 8]
    neg byte ptr [si]
    mov al, byte ptr [si] 

    ; Destroy the stack frame
    pop bp
    mov sp, bp
    ret

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
