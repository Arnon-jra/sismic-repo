	;.cdecls "msp430.h"
	.global main
	
	;.text

main:
	;mov.w	#(WDTPW|WDTHOLD), &WDTCTL
  
  mov #0x2400, R12
  mov #0x14, R13

  clr R4

  mov.w #0x01, 0(R12)
  inc R12
  inc R12
  dec R13
  mov.w #0x01, 0(R12)

  add.w -2(R12), R4
  add.w 0(R12), R4

loop1:
  inc R12
  inc R12
  mov.w R4, 0(R12)
  add.w -2(R12), R4

  dec R13
  jnz loop1

  inc R12
  inc R12
  mov.w R4, 0(R12)

  jmp $
  nop
  


  
  