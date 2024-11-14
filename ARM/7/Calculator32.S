.text    
     .global _setupStackFrame 
     .global _destroyStackFrame
     .global _add 

_setupStackFrame:
     mov r2, #1
     push {fp}
     mov fp, sp 
     bx lr 

_destroyStackFrame:
     mov r2, #1
     pop {fp}
     mov sp, fp 
     bx lr 

_add:

     ; Check if the stack frame is setup 
     cmp r2, #0
     beq _setupStackFrame 

     ; Get the parameters
     ldr r0, [fp, #8]
     ldr r1, [fp, #12]

     add r0, r1 

     ; Check if we need to destroy the stack frame
     cmp r2, #1
     beq _destroyStackFrame