.section .data
    divisionByZero: .asciz "Division By Zero Error!"

.section .text
.global _addIntegers
.global _subIntegers
.global _multiplyIntegers
.global _divideIntegers
.global _toDecimal
.global _toWhole
.global _getRemainder
.global _getFactorial

_addIntegers:
    push {fp, lr}
    add fp, sp, #4

    ldr r0, [fp, #8]  // Load first parameter
    ldr r1, [fp, #12] // Load second parameter
    add r0, r0, r1    // Perform addition
    mov r1, #0        // Clear r1

    pop {fp, lr}
    bx lr

_subIntegers:
    push {fp, lr}
    add fp, sp, #4

    ldr r0, [fp, #8]  // Load first parameter
    ldr r1, [fp, #12] // Load second parameter
    sub r0, r0, r1    // Perform subtraction
    mov r1, #0        // Clear r1

    pop {fp, lr}
    bx lr

_multiplyIntegers:
    push {fp, lr}
    add fp, sp, #4

    ldr r0, [fp, #8]  // Load first parameter
    ldr r1, [fp, #12] // Load second parameter
    mul r0, r0, r1    // Perform multiplication
    mov r1, #0        // Clear r1

    pop {fp, lr}
    bx lr

_divideIntegers:
    push {fp, lr}
    add fp, sp, #4

    ldr r0, [fp, #8]  // Load first parameter
    ldr r1, [fp, #12] // Load second parameter
    cmp r1, #0
    beq .divisionByZero
    udiv r0, r0, r1   // Perform division
    mov r1, #0        // Clear r1
    b .done

.divisionByZero:
    ldr r0, =divisionByZero

.done:
    pop {fp, lr}
    bx lr

_toDecimal:
    push {fp, lr}
    add fp, sp, #4

    ldr r0, [fp, #8]  // Load parameter
    mov r1, #100
    udiv r0, r0, r1   // Divide by 100
    mov r1, #0        // Clear r1

    pop {fp, lr}
    bx lr

_toWhole:
    push {fp, lr}
    add fp, sp, #4

    ldr r0, [fp, #8]  // Load parameter
    mov r1, #100
    mul r0, r0, r1    // Multiply by 100
    mov r1, #0        // Clear r1

    pop {fp, lr}
    bx lr

_getRemainder:
    push {fp, lr}
    add fp, sp, #4

    ldr r0, [fp, #8]  // Load first parameter
    ldr r1, [fp, #12] // Load second parameter
    cmp r1, #0
    beq .divisionByZero
    udiv r2, r0, r1   // Perform division
    mls r0, r2, r1, r0 // Calculate remainder
    mov r1, #0        // Clear r1
    b .done

_getFactorial:
    push {fp, lr}
    add fp, sp, #4

    ldr r0, [fp, #8]  // Load parameter
    mov r1, r0
.factorial_loop:
    subs r1, r1, #1
    ble .done
    mul r0, r0, r1
    b .factorial_loop

.done:
    pop {fp, lr}
    bx lr
