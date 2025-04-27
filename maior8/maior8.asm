	.cdecls "msp430.h"
	.global main
	
	.text

main:
	mov.w	#(WDTPW|WDTHOLD), &WDTCTL
  mov.w #vetor_1, R5;endereço do vetor
  mov.b @R5+, R6 ;conta até chegar ao último elemento do vetor
  mov.b @R5+, R10 ;r10 recebe o maior elemento do vetor
  mov.w #0x01, R7
  dec R6

loop1:
  cmp.b @R5, R10  ; cuidado cmp
  jhs loop2
  mov.b @R5, R10
  mov.w #0x01, R7
  
loop2:
  ;cmp.b @R5, R10
  jne salto
  inc R7
salto:
  inc R5
  dec R6
  jnz loop1

fim:
  jmp $
  nop

  .data
  .retain
vetor_1:  .byte 5, 0x01, 0x05, 0x05, 0x06, 0x05

  