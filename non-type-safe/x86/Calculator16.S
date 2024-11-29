%use masm 
section .text
  global _add
  global _subtract
  global _multiply
  global _divide

_add:
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; This function adds two parameters  ;
  ; Parameter AX (int)                 ;
  ; Parameter CX (int)                 ;
  ; Returns AX + CX                    ;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; Setup the stack frame
  push bp
  mov bp, sp

  ; Get the parameters and add them
  mov ax, word ptr [bp + 4]
  mov dx, word ptr [bp + 8]
  add ax, dx

  ; Destroy the stack frame
  pop bp
  ret 

_subtract:
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; This function subtracts two parameters ;
   ; Parameter AX (int)                     ;
   ; Parameter DX (int)                     ;
   ; Returns AX - DX                        ;  
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ; Setup the stack frame
   push bp
   mov bp, sp

   ; Get the parameters and subtract them
   mov ax, word ptr [bp + 4]
   mov dx, word ptr [bp + 8]
   sub ax, dx

   ; Destroy the stack frame
   pop bp
   ret

_multiply:

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; This function multiplies two parameters  ;
  ; Parameter AX (int)                       ; 
  ; Parameter DX (int)                       ;
  ; Returns AX * DX                          ;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; Setup the stack frame
  push bp
  mov bp, sp

  ; Get the parameters and multiply them
  mov ax, word ptr [bp + 4]
  mov dx, word ptr [bp + 8]
  imul dx

  ; Destroy the stack frame
  pop bp
  ret

_divide:

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; This function multiplies two parameters  ;
  ; Parameter AX (int)                       ;
  ; Parameter DX (int)                       ;
  ; Returns AX / DX if AX > 0 else returns 0 ;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; Get the parameters 
  mov ax, word ptr [bp + 4]
  mov dx, word ptr [bp + 8]

  ; Check for a division by zero error
  cmp ax, 0
  jnz .notDivisionByZeroError
  mov ax, -1
  .end:
     pop bp
     ret

 .notDivisionByZeroError:
    idiv dx 
    jmp .end

;;;;;;;;;;;;;;
; C example  ;
;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; uint16_t add(uint16_t num1, uint16_t num2){     ;
;     return num1 + num2;                         ;
;}                                                ;
;                                                 ;
; uint16_t subtract(uint16_t num1, uint16_t num2){;
;    return num1 - num2;                          ;
;}                                                ;
;                                                 ;
;                                                 ;
; uint16_t multiply(uint16_t num1, uint16_t num2){;
;    return num1 * num2;                          ;
;}                                                ;
;                                                 ;
; uint16_t divide(uint16_t num1, uint16_t num2){  ;
;    if(num1 > 0){                                ;
;        return num1 / num2;                      ;
;    }else{                                       ;
;       return -1;                                ;
;    }                                            ;
;}                                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
