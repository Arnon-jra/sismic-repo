	;.cdecls "msp430.h"
	.global main
	
	;.text

main:
	;mov.w	#(WDTPW|WDTHOLD), &WDTCTL
  mov #vetor, R12
  mov #0x000A, R13
  

  
  call #reduceSum8
  jmp $
  nop

reduceSum8:
  push R4
  clr R4
  
soma:
  add.b @R12+, R4
  dec R13
  jnz soma
  
fim:
  mov.b R4, R12
  pop R4
  ret

  .data
  .retain
vetor:  .byte 1,2,3,4,5,6,7,8,9,10