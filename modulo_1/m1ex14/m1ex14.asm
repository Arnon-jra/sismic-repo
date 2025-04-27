	.cdecls "msp430.h"
	.global main
	
	.text

main:
	mov.w	#(WDTPW|WDTHOLD), &WDTCTL

m2m4:
  mov.w #vetor_1, R12
  mov.b @R12, R13 ;tamanho do vetor
  inc.w R12 ;endereço do primeiro byte dentro do vetor
  clr R4
  clr R5
  mov.b #0x01, R8  ;BIT MASK: 0000 0001
  mov.b #0x02, R9  ;BIT MASK: 0000 0010

salto1:
  bit.b @R12+, R8
  jnz salto3  ;se z=0 salta
  inc.w R4  ;cnt_2

salto2:
  bit.b @R12+, R9
  jnz salto3  ;se z=0 salta
  inc R5

salto3:
  dec R13
  jnz salto1

fim:
  jmp $
  nop
  
  .data
  .retain
vetor_1:  .byte 8, 0x01, 0x02, 0x04, 0x08, 0x09, 0x0A, 0x0B

  