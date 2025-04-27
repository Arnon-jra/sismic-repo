    .cdecls "msp430.h"
    .global main
    .text

main:
	mov.w	#(WDTPW|WDTHOLD), &WDTCTL
      mov.w #vetor, R12
      mov.w #0x0A, R13
      call #reduceSum8
      jmp $
      nop

reduceSum8:
      push R4
      clr R4
      
      cmp #0x00, R13
      jz fim

loop_sum:
      add.b @R12+, R4
      dec.b R13
      jnz loop_sum

fim: 
      mov.w R4, R12
      pop R4
      ret

      .data
vetor: .byte 1,2,3,4,5,6,7,8,9,10
      




      
      


