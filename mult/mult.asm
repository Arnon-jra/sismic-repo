    .cdecls "msp430.h"
    .def main
    .text

main:
        mov     #(WDTHOLD|WDTPW), &WDTCTL
        
        mov.w #0x05, R12 ; A    SOMA = A + A + A + ...(B vezes)
        mov.w #0x05, R13 ; B
        call #umult8

        jmp $
        nop

umult8:
        push R4
        push R5
        push R6
        clr R4
        mov #BIT0, R6   ;R6 = BIT0
        mov #0x08, R5   ; numero de bits a multiplicar
 
umult8_loop:
        bit R6, R13     ;testa se bi == 0 ou 1 {faço isso 2 vezes}
        jz umult8_salto
        add R12, R4    ; R = R + A (R inicial = 0)
umult8_salto:
        rla R6       ;mask << 1
        rla R12
        dec R5
        jnz umult8_loop

umult8_ret:
        mov R4, R14
        pop R4
        pop R5
        pop R6
        ret


   


; a x b (R12 x R13) -> r (R12)
; r: R4 -> R12
; cnt: R5
; mask: R6
