    .cdecls "msp430.h"
    .def umult8
    .text


; a x b (R12 x R13) -> r (R12)
; r: R4 -> R12
; cnt: R5
; mask: R6
umult8:
        push R4
        push R5
        push R6 ; --> TOS

        clr R4              ; r = 0
        mov #8,R5           ; cnt = 8
        mov #BIT0, R6       ; mask = 0x01
umult8_loop:
        bit R6, R13         ; verifica se b_i é 1 ou 0
        jnc  umult8_pula
        add R12, R4         ; r += a
umult8_pula:
        rla R12             ; a <<= 1
        rla R6              ; desloca a mascara para 
                            ; pegar o próximo bit
        dec R5              ; cnt -- 
        jnz umult8_loop            ; 
umult8_ret:
        mov R4, R12
        pop R6 ; <-- TOS
        pop R5
        pop R4
        ret

