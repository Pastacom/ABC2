	.file	"program.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Incorrect number of parameters."
	.align 8
.LC1:
	.string	"Incorrect length = %d.\nAvailable values: 1 <= length <= %d\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"Elapsed time: %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	endbr64
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbp
	push	rbx
	lea	r11, -98304[rsp]
.LPSRL0:
	sub	rsp, 4096
	or	DWORD PTR [rsp], 0
	cmp	rsp, r11
	jne	.LPSRL0
	sub	rsp, 1720
	lea	r13d, -1[rdi]
	cmp	r13d, 2
	ja	.L16
	mov	ebx, edi
	mov	r12, rsi
	mov	r14, rsp
	cmp	edi, 1
	je	.L17
	cmp	edi, 2
	je	.L18
	mov	rdi, r14
	call	readStringFromFile@PLT
	mov	ebp, eax
.L5:
	cmp	ebp, 1
	jle	.L19
	call	clock@PLT
	mov	r15, rax
	cmp	r13d, 2
	jne	.L8
.L10:
	mov	rdx, r12
	mov	esi, ebp
	mov	rdi, r14
	call	printStringToFile@PLT
.L9:
	call	clock@PLT
	pxor	xmm0, xmm0
	mov	edi, 1
	lea	rsi, .LC3[rip]
	sub	rax, r15
	cvtsi2sd	xmm0, rax
	mov	eax, 1
	divsd	xmm0, QWORD PTR .LC2[rip]
	call	__printf_chk@PLT
	xor	eax, eax
.L1:
	add	rsp, 100024
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L8:
	mov	esi, ebp
	mov	rdi, r14
	call	transformString@PLT
	cmp	ebx, 3
	jne	.L9
	jmp	.L10
.L19:
	lea	edx, -1[rbp]
	mov	ecx, 100000
	mov	edi, 1
	xor	eax, eax
	lea	rsi, .LC1[rip]
	call	__printf_chk@PLT
	mov	eax, 1
	jmp	.L1
.L16:
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L1
.L18:
	mov	rdi, r14
	call	generateString@PLT
	mov	ebp, eax
	jmp	.L5
.L17:
	mov	rdi, r14
	call	readString@PLT
	mov	ebp, eax
	jmp	.L5
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
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
