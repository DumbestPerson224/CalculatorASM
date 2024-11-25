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

; Save the return address
push rax

; Get the parameters and add them together
mov rsi, [rbp + 16]
mov rdx, [rbp + 24]
add rsi, rdx 
mov rax, rsi

; Destroy the stack frame 
pop rax ; rax now contains the return address
pop rbp ; rbp now contains the original address it was holding
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

; Save the return address
push rax 

; Get the parameters and subtract them
mov rsi, [rbp + 16]
mov rdx, [rbp + 24]
sub rsi, rdx 
mov rax, rsi

; Destroy the stack frame 
pop rbp ; rbp now contains the original value of rbp before pushing it
pop rax ; rax now contains the return address
mov rsp, rbp 
ret 

_multiply:

; Setup the stack frame 
push rbp 
mov rbp, rsp

; Save the return address
push rax

; Get the parameters and multiply them 
mov rsi, [rbp + 16]
mov rdx, [rbp + 24]
mov rax, rsi
mul rdx 

; Destroy the stack frame
pop rax ; rax now contains the return address
pop rbp ; rbp now contains the original value of rbp
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

; Save the return address
push rax

; Get the parameters 
mov rsi, [rbp + 16]
mov rdx, [rbp + 24]
mov rax, rsi
test rsi, rsi 
jnz .divide
mov rax, -1

.done:
pop rax ; rax now contains the return address
pop rbp 
mov rsp, rbp 
ret 

.divide:
div rdx 
jmp .done 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Description This function gets a parameter and makes it negative                               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_toNegative:

; Setup the stack frame 
push rbp 
mov rbp, rsp

; Save the return address
push rax

; Get the parameter and convert it into a negative number
mov rsi, [rbp + 16]
neg rsi
mov rax, rsi

; Destroy the stack frame 
pop rax ; rax now contains the return address
pop rbp ; rbp now contains the original value of rbp
mov rsp, rbp 
ret 
