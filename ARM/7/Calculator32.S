.text
.global _add
.global _subtract
.global _multiply
.global _divide

_add:
    ; Setup the stack frame
    push {r4, lr}
    
    ; Get the parameters
    ldr r4, [sp, #4]   ; Load the first parameter from the stack
    ldr r0, [sp, #8]   ; Load the second parameter from the stack
    
    ; Add them
    adds r4, r4, r0
    
    ; Restore the stack frame
    pop {r4, pc}

_subtract:
    ; Setup the stack frame
    push {r4, lr}
    
    ; Get the parameters and subtract them
    ldr r4, [sp, #4]
    ldr r0, [sp, #8]
    subs r4, r4, r0
    
    ; Restore the stack frame
    pop {r4, pc}

_multiply:
    ; Setup the stack frame
    push {r4, lr}
    
    ; Get the parameters and multiply them
    ldr r4, [sp, #4]
    ldr r0, [sp, #8]
    smull r0, r1, r4, r0  ; r0:1 = r4 * r0
    
    ; Restore the stack frame
    pop {r4, pc}

_divide:
    ; Setup the stack frame
    push {r4, lr}

    ; Get the parameters
    ldr r4, [sp, #4]
    ldr r0, [sp, #8]
    
    ; Check for division by zero error
    cmp r0, #0
    movgt r0, #-1  ; If greater than, set result to -1
    
    ; Divide
    blt notDivisionByZeroError
    sdiv r4, r4, r0
    
    ; Restore the stack frame
    pop {r4, pc}

notDivisionByZeroError:
    ; Jump back to the done label
    b done
