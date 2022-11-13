	.file	"program.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Incorrect number of parameters."
.LC1:
	.string	"Incorrect length = %d.\nAvailable values: 1 <= length <= %d\n"
.LC3:
	.string	"Elapsed time: %f\n"
	.section	.text.startup,"ax",@progbits
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
	lea	r14d, -1[rdi]
	cmp	r14d, 2
	jbe	.L2
	lea	rdi, .LC0[rip]
	call	puts@PLT
	jmp	.L16
.L2:
	cmp	edi, 1
	mov	ebx, edi
	lea	r12, 15[rsp]
	mov	r13, rsi
	jne	.L4
	mov	rdi, r12
	call	readString@PLT
	jmp	.L15
.L4:
	cmp	edi, 2
	jne	.L6
	mov	rdi, r12
	call	generateString@PLT
	jmp	.L15
.L6:
	mov	rdi, r12
	call	readStringFromFile@PLT
.L15:
	mov	ebp, eax
	cmp	eax, 1
	jg	.L7
	lea	edx, -1[rax]
	mov	ecx, 100000
	lea	rsi, .LC1[rip]
	xor	eax, eax
	mov	edi, 1
	call	__printf_chk@PLT
.L16:
	mov	eax, 1
	jmp	.L1
.L7:
	call	clock@PLT
	mov	r15, rax
	cmp	r14d, 2
	jne	.L8
.L10:
	mov	rdx, r13
	mov	esi, ebp
	mov	rdi, r12
	call	printStringToFile@PLT
	jmp	.L9
.L8:
	mov	esi, ebp
	mov	rdi, r12
	call	transformString@PLT
	cmp	ebx, 3
	je	.L10
.L9:
	call	clock@PLT
	lea	rsi, .LC3[rip]
	mov	edi, 1
	sub	rax, r15
	cvtsi2sd	xmm0, rax
	mov	al, 1
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
