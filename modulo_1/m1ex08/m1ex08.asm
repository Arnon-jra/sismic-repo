    .cdecls "msp430.h"
    .global main
    .text

    ;FIB16
    ;i: R12
    ;R13: end de memoria 0x2400
    ;f(i) = f(i-2)+f(i-1)

main:
	    mov.w	#(WDTPW|WDTHOLD), &WDTCTL
      call #fib16
      jmp $
      nop
fib16:
      push R4
      clr R4
      clr R12
      mov.w #0x2400, R13
      mov.w #0x01, 0(R13)
      incd.w R13
      mov.w #0x01, 0(R13)
      

loop_fib:  
      incd.w R13
      mov.w -2(R13), R4
      add.w -4(R13), R4
      cmp.w #0xFFFF, R4
      jl fim_loop_fib
      mov.w R4, 0(R13)
      jmp loop_fib
fim_loop_fib:
      pop R4
      ret


      
      


