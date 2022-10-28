	.text
	.globl	main
main:
	movq $1, %rdi
	pushq %rdi
	movq $5, %rdi
	negq %rdi
	popq %rsi
	subq %rdi, %rsi
	movq %rsi, %rdi
	call print_int
	ret

      print_int: 
          movq    %rdi, %rsi
          movq    $S_int, %rdi
          xorq    %rax, %rax
          call printf
          ret
            	.data
S_int:
	.string "%d\n"
