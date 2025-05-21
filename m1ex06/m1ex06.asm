	;.cdecls "msp430.h"
	.global main
	
	;.text

main:
	;mov.w	#(WDTPW|WDTHOLD), &WDTCTL
  mov #0x0003, R12
  mov #0x0004, R13

umult8:
  push R4
  clr R4
  call #umult8_loop
  jmp $
  nop

umult8_loop:
  add.w R12, R4
  dec R13
  jnz  umult8_loop
  mov R4, R12
  pop R4
  ret