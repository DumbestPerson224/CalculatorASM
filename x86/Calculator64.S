section .text 
     global _add 
     global _subtract
     global _multiply
     global _divide 
     global _increment
     global _addDecimal

_add:
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ; Description This function adds two parameters ;
     ; Parameter   int (rax)    	    	     ;
     ; Parameter   int (rcx)    	             ;
     ; Returns     rax + rcx                         ;
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

     ; Setup the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the parameters and add them
     mov rax, [rbp + 16]
     mov rcx, [rbp + 24]
     add rax, rcx 
     
     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 
     ret 

_subtract:
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ; Description This function subtracts two parameters  ;
     ; Parameter   int (rax)        	    		   ;
     ; Parameter   int (rcx)        	    	           ;
     ; Returns     rax - rcx                               ;
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	

     ; Setup the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the parameters and subtract them
     mov rax, [rbp + 16]
     mov rcx, [rbp + 24]
     sub rax, rcx 

     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 
     ret 

_multiply:
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ; Description  This function multiplies two parameters ;
     ; Parameter    int (rdx)             	            ;
     ; Parameter    int (rax)                               ;
     ; Returns      rax * rdx                   	    ;
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

     ; Setup the stack frame
     push rbp
     mov rbp, rsp 

     ; Get the parameters and multiply them
     mov rax, [rbp + 16]
     mov rdx, [rbp + 24]
     mul rdx 

     ; Destroy the stack frame
     pop rbp 
     mov rsp, rbp 
     ret

_divide:
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ; Description This function divides two parameters                  ;
     ; Parameter   int (rax)                                             ;
     ; Parameter   int (rdx)                                             ;
     ; Returns     rax / rdx if rax is not zero, otherwise it returns -1 ;
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
     ; Setup the stack frame
     push rbp 
     mov rbp, rsp 

     ; Get the parameters 
     mov rax, [rbp + 16]
     mov rdx, [rbp + 24]

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

_addDecimal:
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;  Parameter xmm0 (double)                      ;
   ;  Parameter xmm1 (double)                      ;
   ;  Returns (RAX) xmm0 + xmm1                    ;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ; Setup the stack frame
   push rbp
   mov rsp, rbp

   ; Get the parameters
   movsd xmm0, [rbp + 12]
   movsd xmm1, [rbp + 16]

   ; Add it
   addsd xmm0, xmm1

   ; Move the value to the accumulator
   mov rax, xmm0

   ; Destroy the stack frame
   pop rbp
   mov rsp, rbp
   ret
   
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
;                                                          ;
; uint64_t add_decimal(uint64_t num1, uint64_t num2){      ;
;     return num1 + num2;                                  ;
; }                                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
