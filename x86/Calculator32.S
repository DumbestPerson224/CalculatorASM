section .text 
   global _add 
   global _subtract
   global _multiply
   global _divide

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

	; Save the return address
	push eax

	; Get the parameters 
	mov esi, [ebp + 8]
	mov edx, [ebp + 12]

	; Add them
	add esi, edx 

	; Put the sum into the accumulator 
        mov eax, esi

	; Destroy the stack frame
	pop eax
	pop ebp 
	mov esp, ebp 
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

        ; Save the return address
        push eax
  
	; Get the parameters and subtract them
	mov esi, [ebp + 8]
	mov edx, [ebp + 12]
	sub esi, edx 

        ; Move the result into the accumulator
        mov eax, esi

	; Destroy the stack frame
	pop eax
        pop ebp 
	mov esp, ebp 
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

        ; Save the return address
        push eax

	; Get the parameters and multiply them
	mov eax, [ebp + 8]
	mov edx, [ebp + 12]
	imul edx 
        
	; Destroy the stack frame
        pop eax
        pop ebp 
	mov esp, ebp 
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
	mov eax, [ebp + 8]
	mov edx, [ebp + 12]

	; Check for a division by zero error
	cmp eax, 0
	jg .notDivisionByZeroError
	mov eax, -1

	; Destroy the stack frame
	.done:
		pop ebp 
		mov esp, ebp 
		ret 

	.notDivisionByZeroError:
		div edx 
		jmp .done 



;;;;;;;;;;;;;;;;;;;;;;;;
;       C example      ;	
;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; uint32_t add(uint32_t num1, uint32_t num2){                         ;
;	return num1 + num2;                                           ;
;}                                                                    ;
;                                                                     ;
; int subtract(uint32_t num1, uint32_t num2){                         ;
;	return num1 - num2;                                           ;
; }                                                                   ;
;                                                                     ;
; int multiply(uint32_t num1, int32_t num2){                          ;
; 	return num1 * num2;                                           ;
; }                                                                   ;
;                                                                     ;
; int divide (uint32_t num1, uint32_t num2){                          ;
;	if(num1 > 0){                                                 ; 
;	   return num1 / num2;                                        ;
;	}else{                                                        ;
;	   num1 = -0;                                                 ;
;	   return num1;                                               ;
;	}                                                             ;
; }                                                                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
