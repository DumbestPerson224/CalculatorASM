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
  add word ptr [ax], word ptr [dx]
  push ax ; save the sum
  
  ; Destroy the stack frame
  pop ax
  pop bp
  mov sp, bp
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
   mov si, word ptr [bp + 4]
   mov dx, word ptr [bp + 8]
   sub word ptr [si], word ptr [dx]
   mov ax, word ptr [si]

   ; Save the result into the stack
   push ax 

   ; Destroy the stack frame
   pop ax
   pop bp
   mov sp, bp
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
  mov si, word ptr [bp + 4]
  mov dx, word ptr [bp + 8]
  mov ax, word ptr [si]
  imul word ptr [dx] 
  push ax ; save the result

  ; Destroy the stack frame
  pop ax
  pop bp
  mov sp, bp
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
  cmp word ptr [ax], 0
  jnz .notDivisionByZeroError
  mov ax, -1
  push ax
  .end:
     pop ax
     pop bp
     mov sp, bp
     ret

 .notDivisionByZeroError:
    idiv word ptr [dx] 
    push ax
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
