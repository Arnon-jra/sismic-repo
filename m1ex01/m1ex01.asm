	;.cdecls "msp430.h"
	.global main
	
	;.text

main:
	;mov.w	#(WDTPW|WDTHOLD), &WDTCTL

  mov.w #0x2400, R4
  mov.b #0xFE, 0(R4)    ;mov.b #0xFE, @R4 ; b) Illegal destination operand
  mov.b #0xCA, 1(R4)

  mov.w #0x1234, 2(R4)
  mov.w #0x5678, 4(R4)

  mov.w #0xABCD, 5(R4)  ;e)considera como 4(r4)

  jmp $
  nop


; .data   ;tudo abaixo vai para RAM
;  .retain
;v1: .byte   0x12, 0x34, 0xFE, 0xCA, 0x89, 0x5C, 0x99



