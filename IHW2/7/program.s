	.file	"program.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Incorrect number of parameters."
	.align 8
.LC1:
	.string	"Incorrect length = %d.\nAvailable values: 1 <= length <= %d\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	lea	r11, -98304[rsp]
.LPSRL0:
	sub	rsp, 4096
	or	DWORD PTR [rsp], 0
	cmp	rsp, r11
	jne	.LPSRL0
	sub	rsp, 1728
	mov	r12d, edi
	mov	r13, rsi
	cmp	r12d, 1
	je	.L2
	cmp	r12d, 3
	je	.L2
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L9
.L2:
	cmp	r12d, 1
	jne	.L4
	lea	rax, -100016[rbp]
	mov	rdi, rax
	call	readString@PLT
	mov	r14d, eax
.L4:
	cmp	r12d, 3
	jne	.L5
	mov	rdx, r13
	lea	rax, -100016[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	readStringFromFile@PLT
	mov	r14d, eax
.L5:
	cmp	r14d, 1
	jg	.L6
	mov	eax, r14d
	sub	eax, 1
	mov	edx, 100000
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L9
.L6:
	cmp	r12d, 1
	jne	.L7
	mov	edx, r14d
	lea	rax, -100016[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	transformString@PLT
.L7:
	cmp	r12d, 3
	jne	.L8
	mov	rdx, r13
	mov	ecx, r14d
	lea	rax, -100016[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	printStringToFile@PLT
.L8:
	mov	eax, 0
.L9:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
