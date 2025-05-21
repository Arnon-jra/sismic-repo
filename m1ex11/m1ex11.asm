	.cdecls "msp430.h"
	.global main
	
	.text

main:
	mov.w	#(WDTPW|WDTHOLD), &WDTCTL

  mov #vetor, R12
  mov #0x000A, R13
  call #reduceSum16
  jmp $
  nop

reduceSum16:
  push R4
  clr R4
  
soma:
  mov.w #0xffff,R4  ;o valor máx de reduceSum16 será qdo houver carry msb=1 0x0001 
  add.w @R12+, R4   ;0xfffe? como usar addc então??
  dec R13
  jnz soma
  
fim:
  mov.b R4, R12
  pop R4
  ret


  .data
  .retain
vetor:  .word 0xffff,2,3,4,5,6,7,8,9,10
  