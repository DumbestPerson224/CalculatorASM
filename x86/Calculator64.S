section .text
global _add
global _subtract
global _multiply
global _divide
global _toNegative

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Description This function gets two parameters and adds them  ;
; Returns RAX (uint64_t + RDX (uint64_t)                                  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_add:

; Setup the stack frame
push rbp
mov rbp, rsp

; Get the parameters and add them together
mov rax, [rbp + 16]
mov rdx, [rbp + 24]
add rax, rdx 

; Destroy the stack frame 
pop rbp  
mov rsp, rbp 
ret 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Description This function gets two parameters and subtracts them  ;
; Returns RAX (uint64_t) - RDX (uint64_t)                                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_subtract:

; Setup the stack frame 
push rbp
mov rbp, rsp

; Get the parameters and subtract them
mov rax, [rbp + 16]
mov rdx, [rbp + 24]
sub rax, rdx 

; Destroy the stack frame 
pop rbp 
mov rsp, rbp 
ret 

_multiply:

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Description This function gets two parameters and divides them  ;
; Returns RAX (uint64_t)  / RDX (uint64_t)                                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_divide:

; Setup the stack frame
push rbp
mov rbp, rsp 

; Get the parameters 
mov rax, [rbp + 16]
mov rdx, [rbp + 24]
test rax, rax 
jnz .divide
mov rax, -1

.done:
pop rbp 
mov rsp, rbp 
ret 

.divide:
div rdx 
jmp .done 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Description This function gets a parameter and makes it negative ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_toNegative:

; Setup the stack frame 
push rbp 
mov rbp, rsp

; Get the parameter and convert it into a negative number
mov rax, [rbp + 16]
neg rax 

; Destroy the stack frame 
pop rbp 
mov rsp, rbp 
ret 
