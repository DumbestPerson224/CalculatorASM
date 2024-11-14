.text    
     .global _setupStackFrame 

_setupStackFrame:

     push {fp}
     mov fp, sp 
     bx lr 