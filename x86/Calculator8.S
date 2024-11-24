section .text
   global _add
   global _subtract

_add: 

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; This function adds two integers              ;
   ; Parameter (uint8_t) AL                       ;
   ; Parameter (uint8_t) CL                       ;
   ; Returns AL + CL                              ;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ; Setup the stack frame
   push bl
   mov bl, sp

   ; Get the parameters and add them
   mov al, [bl + 4]
   mov cl, [bl + 8] 
   add al, cl

   ; Destroy the stack frame
   pop bl
   mov sp, bl 
   ret

_subtract:

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; This function subracts two intebers ;
   ; Parameter (uint8_t) AL              ;
   ; Parameter (uint8_t) CL              ;
   ; Returns AL - CL                     ;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; Setup the stack frame
  push bl
  mov bl, sp

  ; Get the parameters and subtract them
  mov al, [bl + 4]
  mov cl, [bl + 8]
  sub al, cl

  ; Destroy the stack frame
  pop bl
  mov sp, bl
  ret
