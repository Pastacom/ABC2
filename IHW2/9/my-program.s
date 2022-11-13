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
.LC3:
	.string	"Elapsed time: %f\n"
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
	sub	rsp, 1760
	mov	r12d, edi
	mov	r13, rsi
	cmp	r12d, 0
	jle	.L2
	cmp	r12d, 3
	jle	.L3
.L2:
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L12
.L3:
	cmp	r12d, 1
	jne	.L5
	lea	rax, -100048[rbp]
	mov	rdi, rax
	call	readString@PLT
	mov	r14d, eax
.L5:
	cmp	r12d, 2
	jne	.L6
	lea	rax, -100048[rbp]
	mov	rdi, rax
	call	generateString@PLT
	mov	r14d, eax
.L6:
	cmp	r12d, 3
	jne	.L7
	mov	rdx, r13
	lea	rax, -100048[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	readStringFromFile@PLT
	mov	r14d, eax
.L7:
	cmp	r14d, 1
	jg	.L8
	mov	eax, r14d
	sub	eax, 1
	mov	edx, 100000
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L12
.L8:
	call	clock@PLT
	mov	r15, rax
	cmp	r12d, 1
	je	.L9
	cmp	r12d, 2
	jne	.L10
.L9:
	mov	edx, r14d
	lea	rax, -100048[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	transformString@PLT
.L10:
	cmp	r12d, 3
	jne	.L11
	mov	rdx, r13
	mov	ecx, r14d
	lea	rax, -100048[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	printStringToFile@PLT
.L11:
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, r15
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
.L12:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	1093567616
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
