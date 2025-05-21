	.cdecls "msp430.h"
	.global main
	
	.text

main:
	mov.w	#(WDTPW|WDTHOLD), &WDTCTL

	mov.b 	#3, R4		; Inicializa
	mov.b 	#4, R5		; R5 = 3, R5 = 4
	clr     R6			; R6 = 0

main_loop:
    call #acumula ;chama acumula
    dec   R4  ;Decrementa R4 x vezes até zerar
    jnz main_loop

    jmp $
    nop

acumula:
      add R5,R6
      ret



