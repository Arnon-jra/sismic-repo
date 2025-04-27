    .cdecls "msp430.h"
    .global main
    .text
;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

main:										; Questão 3
        mov #0x07, R12
        mov #0x03, R13
        call    #umult16        
        jmp     $

umult16:									; Questão 2
        push	R4
        push	R5
        push	R6
        mov     R12, R4
        mov     R13, R5
        mov     #16, R6 ;i

        clr R12
        clr R13
                        
			
umult16_loop:
        rla R12
        rlc R13
        rla R5

        jnc umult16_next

umult16_inc:
        add R4, R12
        adc R13

umult16_next:
        dec R6
        jnz umult16_loop

umult16_ret:
        pop		R6
        pop		R5
        pop		R4
        ret