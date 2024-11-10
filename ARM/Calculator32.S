.data
     divisionByZero: .byte "Division By Zero Error"
     result: .word 0 

.text     
     .global _addIntegers
     .global _subIntegers
     .global _mulIntegers
     .global _toWhole 

_addIntegers:

     // Setup the stack frame
     push {fp}
     mov fp, sp 

     // Get the parameters and add them
     ldr r0, [fp, #8]
     ldr r1, [fp, #12]
     add r0, r1

     // Store the result
     ldr r1, =result 
     str r1, [r0]

     // Destroy the stack frame and return the result
     pop {fp}
     mov sp, fp 
     bx lr 

_subIntegers:

     // Setup the stack frame
     push {fp}
     mov fp, sp

     // Get the parameters and add them
     ldr r0, [fp, #8]
     ldr r1, [fp, #12]
     sub r0, r1 

     // Store the result
     ldr r1, =result
     str r1, [r0]

     // Destroy the stack frame 
     pop {fp}
     mov sp, fp  


_toWhole:
    
    // Setup the stack frame 
    push {fp}
    mov fp, sp 

    // Get the parameters and divide them 
    ldr r0, [fp, #8]
    mov r1, 100
    mul r0, r1 

    // Store the result
    ldr r1, =result 
    str r1, [r0]

    // Destroy the stack frame and return the result
    pop {fp}
    mov sp, fp 
    bx lr 

_mulIntegers:
    
    ; Setup the stack frame
    push {fp}
    mov fp, sp 

    // Get the parameters and multiply them 
    ldr r0, [fp, #8]
    ldr r1, [fp, #12]
    mul r0, r1 

    // Store the result 
    ldr r1, =result 
    str r1, [r0]

    // Destroy the stack frame and return the result 
    pop {fp}
    mov sp, fp 
    bx lr 
