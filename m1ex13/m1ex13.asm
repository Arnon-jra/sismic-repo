	.cdecls "msp430.h"
	.global main
	
	.text

main:
	mov.w	#(WDTPW|WDTHOLD), &WDTCTL

  mov #0x2420, R12 ;end. de saída (s)
  clr 0(R12)
  mov #vetor_1, R5  ;end. do vetor 1
  mov #vetor_2, R6 ;end. do vetor 2
  mov #0x0008, R15
  call #mapSum16
  jmp $
  nop

mapSum16:
  push R4
  clr R4
  
sum:
  mov.w @R5+,R4
  add.w @R6+, R4
  mov.w R4, 0(R12)
  incd.w R12
  dec.w R15
  jnz sum

  
fim:
  
  pop R4
  ret


  .data
  .retain
vetor_1:  .word 7, 65000, 50054, 26472, 53000, 60606, 814, 41121
vetor_2:  .word 7, 226, 3400, 26472, 470, 1020, 44444, 12345
  