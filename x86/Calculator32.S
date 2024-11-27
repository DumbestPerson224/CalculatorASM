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
	mov esi, [ebp + 8]
	mov edx, [ebp + 12]

	; Add them
	add esi, edx 

        ; Save the result
	mov eax, esi
        push eax

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
  
	; Get the parameters and subtract them
	mov esi, [ebp + 8]
	mov edx, [ebp + 12]
	sub esi, edx

        ; Move the result into the accumulator and save the accumulator
        mov eax, esi
        push eax

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

	; Get the parameters and multiply them
	mov eax, [ebp + 8]
	mov edx, [ebp + 12]
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
	mov esi, [ebp + 8]
	mov edx, [ebp + 12]

	; Check for a division by zero error
	cmp esi, 0
	jg .notDivisionByZeroError
	mov eax, -1
        push eax

	; Destroy the stack frame
	.done:
                pop eax
		pop ebp 
		mov esp, ebp 
		ret 

	.notDivisionByZeroError:
                mov eax, esi
		div edx 
                push eax
		jmp .done 

_toNegative:

   ; Setup the stack frame
   push ebp
   mov ebp, esp 

  ; Get the parameter and convert it to a negative number then store it into the accumulator
  mov esi, [ebp + 8]
  neg esi
  mov eax, esi 
  push eax ; save the result

  ; Destroy the stack frame
  pop eax
  pop ebp 
  mov esp, ebp
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
