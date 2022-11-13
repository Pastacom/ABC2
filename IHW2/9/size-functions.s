	.file	"functions.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Input text: "
.LC1:
	.string	"Buffer overflow occured. Trimming your text."
	.text
	.globl	readString
	.type	readString, @function
readString:
	endbr64
	push	r14
	lea	rsi, .LC0[rip]
	xor	eax, eax
	lea	r14, .LC1[rip]
	push	r13
	push	r12
	xor	r12d, r12d
	push	rbp
	push	rbx
	mov	rbx, rdi
	mov	edi, 1
	call	__printf_chk@PLT
.L3:
	mov	rdi, QWORD PTR stdin[rip]
	inc	r12d
	mov	r13, rbx
	call	fgetc@PLT
	mov	BYTE PTR [rbx], al
	mov	ebp, eax
	cmp	r12d, 100001
	jne	.L2
	mov	rsi, r14
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
.L2:
	inc	rbx
	inc	ebp
	jne	.L3
	mov	BYTE PTR 0[r13], 0
	mov	eax, r12d
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	ret
	.size	readString, .-readString
	.section	.rodata.str1.1
.LC3:
	.string	"Result:\n%s\n"
.LC2:
	.string	"aeiouy"
	.text
	.globl	transformString
	.type	transformString, @function
transformString:
	endbr64
	mov	rdx, rdi
	mov	r9d, esi
	lea	rdi, -15[rsp]
	mov	ecx, 7
	lea	rsi, .LC2[rip]
	mov	r8d, 100000
	rep movsb
	lea	rsi, -15[rsp]
.L8:
	xor	eax, eax
.L12:
	cmp	r9d, eax
	jle	.L15
	xor	ecx, ecx
.L10:
	mov	dil, BYTE PTR [rdx+rax]
	cmp	dil, BYTE PTR [rsi+rcx]
	jne	.L9
	sub	edi, 32
	mov	BYTE PTR [rdx+rax], dil
.L9:
	inc	rcx
	cmp	rcx, 6
	jne	.L10
	inc	rax
	jmp	.L12
.L15:
	dec	r8d
	jne	.L8
	lea	rsi, .LC3[rip]
	mov	edi, 1
	xor	eax, eax
	jmp	__printf_chk@PLT
	.size	transformString, .-transformString
	.section	.rodata.str1.1
.LC4:
	.string	"r"
.LC5:
	.string	"End up reading file."
	.text
	.globl	readStringFromFile
	.type	readStringFromFile, @function
readStringFromFile:
	endbr64
	push	r15
	push	r14
	lea	r14, .LC1[rip]
	push	r13
	push	r12
	xor	r12d, r12d
	push	rbp
	push	rbx
	mov	rbx, rdi
	push	rcx
	mov	rdi, QWORD PTR 8[rsi]
	lea	rsi, .LC4[rip]
	call	fopen@PLT
	mov	r13, rax
.L18:
	mov	rdi, r13
	inc	r12d
	mov	r15, rbx
	call	fgetc@PLT
	mov	BYTE PTR [rbx], al
	mov	ebp, eax
	cmp	r12d, 100001
	jne	.L17
	mov	rsi, r14
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
.L17:
	inc	rbx
	inc	ebp
	jne	.L18
	mov	BYTE PTR [r15], 0
	mov	rdi, r13
	call	fclose@PLT
	lea	rdi, .LC5[rip]
	call	puts@PLT
	pop	rdx
	mov	eax, r12d
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
	.size	readStringFromFile, .-readStringFromFile
	.section	.rodata.str1.1
.LC6:
	.string	"w+"
.LC7:
	.string	"Result is in the output file."
	.text
	.globl	printStringToFile
	.type	printStringToFile, @function
printStringToFile:
	endbr64
	push	r12
	mov	r8d, esi
	mov	r12, rdi
	lea	rsi, .LC2[rip]
	push	rbp
	mov	ecx, 7
	xor	eax, eax
	sub	rsp, 24
	lea	rdi, 9[rsp]
	rep movsb
	lea	rdi, 9[rsp]
.L22:
	cmp	r8d, eax
	jle	.L28
	xor	ecx, ecx
.L24:
	mov	sil, BYTE PTR [r12+rax]
	cmp	sil, BYTE PTR [rdi+rcx]
	jne	.L23
	sub	esi, 32
	mov	BYTE PTR [r12+rax], sil
.L23:
	inc	rcx
	cmp	rcx, 6
	jne	.L24
	inc	rax
	jmp	.L22
.L28:
	mov	rdi, QWORD PTR 16[rdx]
	lea	rsi, .LC6[rip]
	call	fopen@PLT
	mov	rcx, r12
	mov	esi, 1
	lea	rdx, .LC3[rip]
	mov	rbp, rax
	mov	rdi, rax
	xor	eax, eax
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	add	rsp, 24
	lea	rdi, .LC7[rip]
	pop	rbp
	pop	r12
	jmp	puts@PLT
	.size	printStringToFile, .-printStringToFile
	.section	.rodata.str1.1
.LC8:
	.string	"Generated string:\n%s\n"
	.text
	.globl	generateString
	.type	generateString, @function
generateString:
	endbr64
	push	r13
	mov	r13, rdi
	xor	edi, edi
	push	r12
	push	rbp
	mov	ebp, 96
	push	rbx
	xor	ebx, ebx
	push	rcx
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	mov	ecx, 9999
	cdq
	idiv	ecx
	lea	r12d, 1[rdx]
.L30:
	cmp	r12d, ebx
	jle	.L36
	call	rand@PLT
	cdq
	idiv	ebp
	mov	al, 10
	test	edx, edx
	je	.L31
	lea	eax, 31[rdx]
.L31:
	mov	BYTE PTR 0[r13+rbx], al
	inc	rbx
	jmp	.L30
.L36:
	movsx	rax, r12d
	mov	rdx, r13
	mov	edi, 1
	mov	BYTE PTR 0[r13+rax], 0
	lea	rsi, .LC8[rip]
	xor	eax, eax
	call	__printf_chk@PLT
	pop	rdx
	mov	eax, r12d
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret
	.size	generateString, .-generateString
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
