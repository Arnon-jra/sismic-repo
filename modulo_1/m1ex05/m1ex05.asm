	;.cdecls "msp430.h"
	.global main
	
	;.text

main:
	;mov.w	#(WDTPW|WDTHOLD), &WDTCTL

s_mult8:
  clr R4
  mov.w #0x0005, R12
  mov.w #0x0004, R13

s_mult8_loop:
  add.w R4, R12
  dec R13
  jnz  umult8_loop
  
fim:
  jmp $
  nop
