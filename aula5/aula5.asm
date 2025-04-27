    .cdecls "msp430.h"
    .def main
    .ref umult8
    .text

main:
        mov     #(WDTHOLD|WDTPW), &WDTCTL

        mov     #200, R12
        mov     #50, R13
        call    #umult8
        mov     R12, R4

        jmp     $
        nop


