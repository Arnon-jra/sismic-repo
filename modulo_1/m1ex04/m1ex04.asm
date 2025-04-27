	;.cdecls "msp430.h"
	.global main
	
	;.text

main:
	;mov.w	#(WDTPW|WDTHOLD), &WDTCTL

umult8:
  clr R4
  mov.w #0x0005, R12
  mov.w #0x0004, R13

umult8_loop:
  add.w R12, R4
  dec R13
  jnz  umult8_loop
  
fim:
  jmp $
  nop
