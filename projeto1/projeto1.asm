	.cdecls "msp430.h"
	.global main
	.text

main:
	mov.w	#(WDTPW|WDTHOLD), &WDTCTL

  mov #matriz, R11 ; Ponteiro para a matriz de entrada
  mov #2, R12 ; Número de linhas da matriz
  mov #3, R13 ; Número de colunas da matriz
  call #MAT_TRANSP ; Chamar sub-rotina
  jmp $ ; Loop infinito
  nop

MAT_TRANSP:
  
  mov.w R13, R4 ;R4 recebe numero de colunas 
  mov.w R11, R14
  ;mov.w R12,R5 ; guarda qtde de linhas
  call #umult8
  ;mov.w R12,R15 ; r15=linha x colunas
  ;mov.w R5,R12 ; retorna qtde de linhas
  add.w R15, R15
  add.w R15, R14  ;R14 recebe valor linha x colunas x 2
  mov.w @R11, 0(R14)
  add.w #0x02, R14
  mov.w 6(R11), 0(R14)
  sub   #0x01, R4
  
  
loop1:
  add.w #0x02, R11
  add.w #0x02, R14
  mov.w @R11, 0(R14)
  add.w #0x02, R14
  mov.w 6(R11), 0(R14)
  sub   #0x01, R4
  jnz loop1
  ret


umult8:
        push R4
        push R5
        push R6
        clr R4
        mov #BIT0, R6   ;R6 = BIT0
        mov #0x08, R5   ; numero de bits a multiplicar
 
umult8_loop:
        bit R6, R13     ;testa se bi == 0 ou 1 {faço isso 2 vezes}
        jz umult8_salto
        add R12, R4    ; R = R + A (R inicial = 0)
umult8_salto:
        rla R6       ;mask << 1
        rla R12
        dec R5
        jnz umult8_loop

umult8_ret:
        mov R4, R15
        pop R4
        pop R5
        pop R6
        ret


; Especificar a matriz de entrada na seção de dados
  .data
  .retain
matriz: .word 1, 2, 3, 4, 5, 6