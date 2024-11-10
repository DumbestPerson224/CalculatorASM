.data
	sum: .word 0
	msg: .byte "Division By Zero Error!"
.global _addIntegers
.global _subIntegers
.global _mulIntegers
.global _divIntegers

_addIntegers:

	// Setup the stack frame
	push {fp}
	mov fp, sp
	
	// Get the parameters and add them
	ldr r0, [fp, #8]
	ldr r1, [fp, #12]
	add r0, r1
	
	// Store the sum into the result variable
	ldr r1, =sum
	str r1, [r0]
	
	// Destroy the stack frame and return the sum
	pop {fp}
	mov sp, fp
	bx lr
	
_subIntegers:

	// Setup the stack frame
	push {fp}
	mov fp, sp
	
	// Get the parameters and subtract them
	ldr r0, [fp, #8]
	ldr r1, [fp, #12]
	sub r0, r1
	
	// Store the sum into the result variable
	ldr r0, =sum
	str r1, [r0]
	
	// Destroy the stack and return the result
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
	ldr r0, =sum
	str r1, [r0]
	
	// Destroy the stack frame and return the result
	pop {fp}
	mov sp, fp
	bx lr
	
_divIntegers:

	// Setup the stack frame
	push {fp}
	mov fp, sp
	
	// Get the parameters and multiply them
	ldr r0, [fp, #8]
	ldr r1, [fp, #12]
	cmp r1, #0
	bne .divide
	ldr r0, =msg
	.divide:
		div r0, r1
		
		// Store the result
		ldr r1, =sum
		str r1, [r0]
		
	// Destroy the stack frame and return the result
	pop {fp}
	mov sp, fp
	bx lr
