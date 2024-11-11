.data
     divisionByZero: .word 1
     result: .word 0 

.text     
     .global _addIntegers
     .global _subIntegers
     .global _mulIntegers
     .global _toWhole 
     .global _toDecimal
     .global _getFactorial 

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

     // Destroy the stack frame  and return the result 
     pop {fp}
     mov sp, fp  
     bx lr

_toWhole:
    
    // Setup the stack frame 
    push {fp}
    mov fp, sp 

    // Get the parameters and divide them 
    ldr r0, [fp, #8]
    mov r1, #100
    mul r0, r1 

    // Store the result
    ldr r1, =result 
    str r1, [r0]

    // Destroy the stack frame and return the result
    pop {fp}
    mov sp, fp 
    bx lr 

_mulIntegers:
    
    // Setup the stack frame
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
	
_toDecimal:
	
	// Setup the stack frame
	push {fp}
	mov fp, sp
	
	// Get the paramater and set the divident to 100
 	ldr r0, [fp, #8]
	mov r1, #100
	
	// Check if the divider is 0
	cmp r0, #0
	bne .divide
	ldr r0, =divisionByZero
	
	.divide:
		udiv r0, r0, r1

		// Store the result
		ldr r2, =result
		str r2, [r0]
	// Destroy the stack frame and return the error code
	pop {fp}
	mov sp, fp
	bx lr 

_getFactorial:

    // Setup the stack frame 
    push {fp} 
    mov fp, sp 

    // Get the parameters 
    ldr r0, [fp, #8]
    ldr r1, [fp, #12]

    // Check if r1 is zero 
    .isZero:
    cmp r0, #0
    bne .multiply 
    ldr [=divisionByZero], r0
    
    // Destroy the stack frame and return the result
    pop {fp} 
    mov sp, fp 
    bx lr

    .multiply:
        mul r1, r0
  	sub r0, 1

    // Store the result 
    ldr r0, =result
    str r0, [r1]
    b .isZero
