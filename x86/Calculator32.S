section .text 
   global _add 
   global _subtract
   global _multiply
   global _divide

_add:

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
	
	; Setup the stack frame
	push ebp 
	mov ebp, esp 

	; Get the parameters 
	mov eax, [ebp + 4]
	mov edx, [ebp + 8]

	; Check for a division by zero error
	cmp eax, 0
	je .divisionByZero 
	idiv edx 
	.done:
		pop ebp 
		mov esp, ebp 
		ret 

	.divisionByZero:
		mov eax, - 1
		jmp .done 
