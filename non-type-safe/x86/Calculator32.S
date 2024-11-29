%use masm 
section .text 
   global _add 
   global _subtract
   global _multiply
   global _divide
   global _toNegative

_add:
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;  This function adds the two parameters ;
        ;  Parameter eax (int)                   ;
        ;  Paramater edx (int)                   ; 
        ;  Returns eax + edx                     ;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	; Setup the stack frame
	push ebp 
	mov ebp, esp 

	; Get the parameters 
	mov eax, dword ptr [ebp + 12]
	mov edx, dword ptr [ebp + 16]

	; Add them
	add eax, edx

	; Destroy the stack frame
	pop ebp 
	ret 

_subtract:
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;   This function subtracts two parameters ;
        ;   Parameter eax (int)                    ;
        ;   Parameter edx (int)                    ;
        ;   Returns   eax - edx                    ;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
        ; Setup the stack frame
	push ebp 
	mov ebp, esp 
  
	; Get the parameters and subtract them
	mov eax, dword ptr [ebp + 12]
	mov edx, dword ptr [ebp + 16]
	sub eax, edx

	; Destroy the stack frame
	pop ebp
	ret

_multiply:
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;  This function multiplies two parameters ;
        ;  Parameter eax (int)                     ;
        ;  Parameter edx (int)                     ;
        ;  Returns   eax * edx                     ;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	; Setup the stack frame
	push ebp 
	mov ebp, esp 

	; Get the parameters and multiply them
	mov eax, dword ptr [ebp + 12]
	mov edx, dword ptr [ebp + 16]
	imul edx
        
	; Destroy the stack frame
        pop ebp
	ret 

_divide:
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ; This function divides two parameters      ;
        ; Parameter eax (int)                       ;
        ; Parameter edx (int)                       ;
        ; Returns eax / edx if eax > 0 otherwise -1 ;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ; Setup the stack frame
	push ebp 
	mov ebp, esp 

	; Get the parameters 
	mov esi, dword ptr [ebp + 12]
        mov edx, dword ptr [ebp + 16]

	; Check for a division by zero error
	cmp esi, 0
	jg .notDivisionByZeroError
	mov eax, -1

	; Destroy the stack frame
	.done:
        pop ebp
        ret 

	.notDivisionByZeroError:
          idiv edx
          jmp .end

_toNegative:

   ; Setup the stack frame
   push ebp
   mov ebp, esp 

  ; Get the parameter and convert it to a negative number then store it into the accumulator
  mov eax, dword ptr [ebp + 12]
  neg eax

  ; Destroy the stack frame
  pop ebp
  ret

;;;;;;;;;;;;;;;;;;;;;;;;
;       C example      ;	
;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; uint32_t add(uint32_t num1, uint32_t num2){                         ;
;	return num1 + num2;                                           ;
;}                                                                    ;
;                                                                     ;
; uint32_t subtract(uint32_t num1, uint32_t num2){                    ;
;	return num1 - num2;                                           ;
; }                                                                   ;
;                                                                     ;
; uint32_t multiply(uint32_t num1, int32_t num2){                     ;
; 	return num1 * num2;                                           ;
; }                                                                   ;
;                                                                     ;
; uint32_t divide (uint32_t num1, uint32_t num2){                     ;
;	if(num1 > 0){                                                 ; 
;	   return num1 / num2;                                        ;
;	}else{                                                        ;
;	   num1 = -0;                                                 ;
;	   return num1;                                               ;
;	}                                                             ;
; }                                                                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
