	;.cdecls "msp430.h"
	.global main
	
	;.text

main:
	;mov.w	#(WDTPW|WDTHOLD), &WDTCTL

  mov.w #0x2400, R4
  mov.w #0xAB78, R5 
  add #3, R4  ;R4=2403h
  mov.w -1(R4), R5  ;R5=CDABh
  mov.b -1(R4), R5  ;R5=00ABh

  mov.w #0x2403, R4
  mov.w #0x789A, R5
  
  add.b @R4+, R5    ;R4=0x2404 R5=0x0067

  jmp $
  nop


  .data   ;tudo abaixo vai para RAM
  .retain
v1: .byte   0x12, 0x34, 0xFE, 0xCA, 0x89, 0x5C, 0x99



