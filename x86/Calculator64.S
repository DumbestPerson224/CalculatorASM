section .text
global _add
global _subtract
global _multiply
global _divide
global _toNegative

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Description This function gets two parameters and adds them                                ;
; Returns RAX (uint64_t + RDX (uint64_t)                                                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_add:

; Setup the stack frame
push rbp
mov rbp, rsp


; Get the parameters and add them together
mov rsi, qword ptr [rbp + 16]
mov rdx, qword ptr [rbp + 24]
add qword ptr [rsi], qword ptr [rdx]
mov rax, qword ptr [rsi]

; Save the sum to the stack, so if rax is overwritten the result is still preserved
push rax

; Destroy the stack frame 
pop rax
pop rbp  
mov rsp, rbp 
ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Description This function gets two parameters and subtracts them                                 ;
; Returns RAX (uint64_t) - RDX (uint64_t)                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_subtract:

; Setup the stack frame 
push rbp
mov rbp, rsp


; Get the parameters and subtract them
mov rsi, qword ptr [rbp + 16]
mov rdx, qword ptr [rbp + 24]
sub qword ptr [rdx], qword ptr [rsi]
mov rax, qword ptr [rdx]

; Save the result into the stack, so if rax is overwritten the result is still preserved
push rax 

; Destroy the stack frame 
pop rbp 
pop rax
mov rsp, rbp
ret 

_multiply:

; Setup the stack frame 
push rbp 
mov rbp, rsp


; Get the parameters and multiply them 
mov rsi, qword ptr [rbp + 16]
mov rdx, qword ptr [rbp + 24]
mov rax, qword ptr [rsi]
mul qword ptr [rdx] 

; Save the result into the stack, so if rax is overwritten the result is still preserved
push rax

; Destroy the stack frame
pop rax
pop rbp 
mov rsp, rbp 
ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Description This function gets two parameters and divides them                               ;
; Returns RAX (uint64_t)  / RDX (uint64_t)                                                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_divide:

; Setup the stack frame
push rbp
mov rbp, rsp 


; Get the parameters 
mov rsi, qword ptr [rbp + 16]
mov rdx, qword ptr [rbp + 24]
mov rax, qword ptr [rsi]
test qword ptr [rax], qword ptr [rax]
jnz .divide
mov rax, -1
push rax ; Save the return code

.done:
pop rax
pop rbp 
mov rsp, rbp 
ret 

.divide:
 div qword ptr [rdx] 
 push rax ; Save the result
 jmp .done 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Description This function gets a parameter and makes it negative                               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_toNegative:

; Setup the stack frame 
push rbp 
mov rbp, rsp

; Get the parameter and convert it into a negative number
mov rsi, qword ptr [rbp + 16]
neg rsi
mov rax, qword ptr [rsi]

; Save the result
push rax

; Destroy the stack frame 
pop rax
pop rbp 
mov rsp, rbp 
ret 
