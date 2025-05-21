	;.cdecls "msp430.h"
	.global main
	
	;.text

main:
	;mov.w	#(WDTPW|WDTHOLD), &WDTCTL

;verifica:
  mov.w #0xABCD, R4
  mov.w #0xABCD, R5

  add.w R4, R5
  jc  loop1
  
  jmp $
  nop

loop1:
  mov.w #0xFFFF, R5

  jmp $
  nop
   







