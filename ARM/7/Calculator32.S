.section .text
.global add
.global subtract
.global multiply
.global divide

add:
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Description This function adds two parameters ;
    ; Parameter   int (r0)                          ;
    ; Parameter   int (r1)                          ;
    ; Returns     r0 + r1                           ;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ; Get the parameters and add them
    add r0, r0, r1

    ; Return
    bx lr

subtract:
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Description This function subtracts two parameters  ;
    ; Parameter   int (r0)                                ;
    ; Parameter   int (r1)                                ;
    ; Returns     r0 - r1                                 ;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ; Get the parameters and subtract them
    sub r0, r0, r1

    ; Return
    bx lr

multiply:
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Description  This function multiplies two parameters ;
    ; Parameter    int (r0)                                ;
    ; Parameter    int (r1)                                ;
    ; Returns      r0 * r1                                 ;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ; Get the parameters and multiply them
    mul r0, r0, r1

    ; Return
    bx lr

divide:
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Description This function divides two parameters                  ;
    ; Parameter   int (r0)                                              ;
    ; Parameter   int (r1)                                              ;
    ; Returns     r0 / r1 if r1 is not zero, otherwise it returns -1    ;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ; Check for a division by zero error
    cmp r1, #0
    beq divisionByZeroError

    ; Get the parameters and divide them
    mov r2, r0  ; Store numerator in r2
    mov r0, r0, lsr #31  ; Extend sign bit into r1
    sdiv r0, r2, r1

    ; Return
    bx lr

divisionByZeroError:
    mov r0, #-1
    bx lr
