	.cdecls "msp430.h"
	.global main
	
	.text

main:
	mov.w	#(WDTPW|WDTHOLD), &WDTCTL
  mov.w #vetor_1, R12 ;contem vetor de elementos sem sinal
  mov.w @R12+, R8 ;decrementa para até chegar ao fim do vetor
  mov.w #0x01, R9 ;conta numero de x que o maior apareceu
  
  call #maior16
  jmp $
  nop

maior16:
  push R4

  mov.w @R12+, R4
  dec R8
  dec R8
loop:
  cmp @R12, R4
  jlo atualiza_maior; primeiro elemento é maior que o segundo?
  ;jeq atualiza_maior
  incd R12
  dec R8
  jnz loop
  jmp fim
  
atualiza_maior:
  ;cmp @R12, R4
  ;jeq incrementa
  ;jmp salto
;incrementa:
  ;inc R9
  
salto:
  mov.w @R12+, R4 ; atualiza r4 para maior valor
  dec R8
  jnz loop  ; volta para comparar o resto

fim:
  pop R4
  ret

  .data
  .retain
vetor_1:  .word 5, 0x02, 0x01, 0x02, 0x01, 0xFF

  