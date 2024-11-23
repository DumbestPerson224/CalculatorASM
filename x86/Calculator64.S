section .text 
     global _add 
     global _subtract
     global _multiply
     global _divide 

_add:
     
     ; Setup the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the parameters and add them
     mov rax, [rbp + 8]
     mov rcx, [rbp + 12]
     add rax, rcx 
     
     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 
     ret 

_subtract:

     ; Setup the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the parameters and subtract them
     mov rax, [rbp + 4]
     mov rcx, [rbp + 8]
     sub rax, rcx 

     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 
     ret 

_multiply:

     ; Setup the stack frame
     push rbp
     mov rbp, rsp 

     ; Get the paramaters and multiply them
     mov rax, [rbp + 4]
     mov rdx, [rbp + 8]
     mul rdx 

     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 
     ret

_divide:

     ; Setup the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the paramaters 
     mov rax, [rbp + 4]
     mov rdx, [rbp + 8]

     ; Check for a division by zero error
     cmp rax, 0 
     jg .notDivisionByZeroError
     mov rax, -1

     .done:
          
          ; Destroy the stack frame
          pop rbp 
          mov rsp, rbp 
          ret 

     .notDivisionByZeroError:
          idiv rdx 
          jmp .done

;;;;;;;;;;;;;;;;;;;;;
;    C example      ;
;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; uint64_t add(uint64_t num1, uint64_t num2){              ;
;   return num1 + num2;                                    ;
; }                                                        ;
;                                                          ;
; uint64_t subtract(uint64_t num1, uint64_t num2){         ;
;        return num1 - num2;                               ;
; }                                                        ;
;                                                          ;
; uint64_t multiply(uint64_t num1, uint64_t num2){         ;
;      return  num1 * num2;                                ;
; }                                                        ;
;                                                          ;
; uint64_t divide(uint64_t num1, uint64_t num2){           ;
;      if(num1 > 0){                                       ;
;           return num1 / num2;                            ;
;      }else{                                              ;
;          num1 = -1;                                      ;
;          return num1;                                    ;
;      }                                                   ;
;}                                                         ;                             
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
