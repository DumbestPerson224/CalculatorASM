section .text 
  global _add 
  global _subtract
  global _multiply 
  global _divide 

_add:

     ; setup the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameters
     mov eax, [ebp + 8]
     mov ecx, [ebp + 12]
     
     ; add them together
     add eax, ecx 

     ; Destroy the stack frame 
     pop ebp 
     mov esp, ebp 
     ret 

_subtract:

     ; setup the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameters
     mov eax, [ebp + 8]
     mov ecx, [ebp + 12]

     ; subtract them
     sub eax, ecx 

     ; Destroy th stack frame
     pop ebp 
     mov esp, ebp 
     ret 

_multiply:

     ; Setup the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameters
     mov eax, [ebp + 8]
     mov ecx, [ebp + 12]

     ; subtact them 
     sub eax, ecx 

     ; Destroy the stack frame
     pop ebp 
     mov esp, ebp 
     ret 

_divide:
     
     ; Setup the stack frame
     push ebp 
     mov ebp, esp 

     ; Get the parameters
     mov eax, [ebp + 8]
     mov edx, [ebp + 12]

     ; Divide 
     div edx 

     ; Destroy the stack frame 
     pop ebp 
     mov esp, ebp 
     ret