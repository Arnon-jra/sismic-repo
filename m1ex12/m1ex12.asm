	.cdecls "msp430.h"
	.global main
	
	.text

main:
	mov.w	#(WDTPW|WDTHOLD), &WDTCTL

  mov #0x3400, R12 ;end. de saída (s)
  clr 0(R12)
  mov #vetor_a, R13  ;end. do vetor a
  mov #vetor_b, R14 ;end. do vetor b
  mov #0x000A, R15
  call #mapSub8
  jmp $
  nop

mapSub8:
  push R4
  clr R4
  
sub:
  mov.w @R13+,R4
  sub.w @R14+, R4
  mov.w R4, 0(R12)
  incd.w R12
  dec.w R15
  jnz sub
  
fim:
  
  pop R4
  ret


  .data
  .retain
vetor_a:  .word 1,2,3,4,5,6,7,8,9,10
vetor_b:  .word 1,2,0,0,0,0,0,0,9,0
  