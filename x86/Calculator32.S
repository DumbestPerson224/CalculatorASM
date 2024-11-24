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

	; Get the parameters 
	mov eax, [ebp + 4]
	mov edx, [ebp + 8]

	; Add them
	add eax, edx 

	; Destroy the stack frame
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

	; Get the parameters and subtract them
	mov eax, [ebp + 4]
	mov edx, [ebp + 8]
	sub eax, edx 

	; Destroy the stack frame
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

	; Get the parameters and multiply them
	mov eax, [ebp + 4]
	mov edx, [ebp + 8]
	imul edx 

	; Destroy the stack frame
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
	mov eax, [ebp + 4]
	mov edx, [ebp + 8]

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
; int add(int num1, num2){                                            ;
;	return num1 + num2;                                           ;
;}                                                                    ;
;                                                                     ;
; int subtract(int num1, int num2){                                   ;
;	return num1 - num2;                                           ;
; }                                                                   ;
;                                                                     ;
; int multiply(int num1, int num2){                                   ;
; 	return num1 * num2;                                           ;
; }                                                                   ;
;                                                                     ;
; int divide (int num1, int num2){                                    ;
;	if(num1 > 0){                                                 ; 
;	   return num1 / num2;                                        ;
;	}else{                                                        ;
;	   num1 = -0;                                                 ;
;	   return num1;                                               ;
;	}                                                             ;
; }                                                                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
