.text    
     .global _setupStackFrame 
     .global _destroyStackFrame
     .global _add 

_setupStackFrame:
     push {fp}
     mov fp, sp 
     bx lr 

_destroyStackFrame:
     pop {fp}
     mov sp, fp 
     bx lr 

_add:

     ; Check if the stack frame is setup 
     cmp r2, #0
     be _setupStackFrame 
