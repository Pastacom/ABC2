	.file	"functions.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Input text: "
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Buffer overflow occured. Trimming your text."
	.text
	.p2align 4
	.globl	readString
	.type	readString, @function
readString:
	endbr64
	push	r13
	lea	rsi, .LC0[rip]
	xor	eax, eax
	lea	r13, .LC1[rip]
	push	r12
	mov	r12d, 1
	push	rbp
	mov	rbp, rdi
	mov	edi, 1
	push	rbx
	sub	rsp, 8
	call	__printf_chk@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	fgetc@PLT
	mov	BYTE PTR 0[rbp], al
	mov	ebx, eax
	.p2align 4,,10
	.p2align 3
.L2:
	cmp	ebx, -1
	je	.L7
.L4:
	mov	rdi, QWORD PTR stdin[rip]
	add	rbp, 1
	add	r12d, 1
	call	fgetc@PLT
	mov	BYTE PTR 0[rbp], al
	mov	ebx, eax
	cmp	r12d, 100001
	jne	.L2
	xor	eax, eax
	mov	rsi, r13
	mov	edi, 1
	call	__printf_chk@PLT
	cmp	ebx, -1
	jne	.L4
.L7:
	mov	BYTE PTR 0[rbp], 0
	add	rsp, 8
	mov	eax, r12d
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret
	.size	readString, .-readString
	.section	.rodata.str1.1
.LC2:
	.string	"Result:\n%s\n"
	.text
	.p2align 4
	.globl	transformString
	.type	transformString, @function
transformString:
	endbr64
	mov	eax, 31093
	mov	BYTE PTR -9[rsp], 0
	mov	r10, rdi
	mov	r11d, esi
	mov	DWORD PTR -15[rsp], 1869178209
	mov	r9d, 100000
	mov	WORD PTR -11[rsp], ax
	lea	eax, -1[rsi]
	lea	rsi, -9[rsp]
	lea	r8, 1[rdi+rax]
	lea	rdi, -15[rsp]
	.p2align 4,,10
	.p2align 3
.L9:
	mov	rcx, r10
	test	r11d, r11d
	jle	.L16
	.p2align 4,,10
	.p2align 3
.L13:
	mov	rax, rdi
	mov	edx, 97
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L18:
	movzx	edx, BYTE PTR [rax]
.L12:
	cmp	BYTE PTR [rcx], dl
	jne	.L10
	sub	edx, 32
	mov	BYTE PTR [rcx], dl
.L10:
	add	rax, 1
	cmp	rax, rsi
	jne	.L18
	add	rcx, 1
	cmp	rcx, r8
	jne	.L13
.L16:
	sub	r9d, 1
	jne	.L9
	mov	rdx, r10
	lea	rsi, .LC2[rip]
	mov	edi, 1
	xor	eax, eax
	jmp	__printf_chk@PLT
	.size	transformString, .-transformString
	.section	.rodata.str1.1
.LC3:
	.string	"r"
.LC4:
	.string	"End up reading file."
	.text
	.p2align 4
	.globl	readStringFromFile
	.type	readStringFromFile, @function
readStringFromFile:
	endbr64
	push	r14
	lea	r14, .LC1[rip]
	push	r13
	push	r12
	mov	r12d, 1
	push	rbp
	mov	rbp, rdi
	push	rbx
	mov	rdi, QWORD PTR 8[rsi]
	lea	rsi, .LC3[rip]
	call	fopen@PLT
	mov	rdi, rax
	mov	r13, rax
	call	fgetc@PLT
	mov	BYTE PTR 0[rbp], al
	mov	ebx, eax
	.p2align 4,,10
	.p2align 3
.L20:
	cmp	ebx, -1
	je	.L24
.L22:
	mov	rdi, r13
	add	rbp, 1
	add	r12d, 1
	call	fgetc@PLT
	mov	BYTE PTR 0[rbp], al
	mov	ebx, eax
	cmp	r12d, 100001
	jne	.L20
	xor	eax, eax
	mov	rsi, r14
	mov	edi, 1
	call	__printf_chk@PLT
	cmp	ebx, -1
	jne	.L22
.L24:
	mov	BYTE PTR 0[rbp], 0
	mov	rdi, r13
	call	fclose@PLT
	lea	rdi, .LC4[rip]
	call	puts@PLT
	pop	rbx
	mov	eax, r12d
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	ret
	.size	readStringFromFile, .-readStringFromFile
	.section	.rodata.str1.1
.LC5:
	.string	"w+"
.LC6:
	.string	"Result is in the output file."
	.text
	.p2align 4
	.globl	printStringToFile
	.type	printStringToFile, @function
printStringToFile:
	endbr64
	push	r12
	mov	eax, 31093
	mov	r12, rdi
	push	rbp
	sub	rsp, 24
	mov	DWORD PTR 9[rsp], 1869178209
	mov	WORD PTR 13[rsp], ax
	mov	BYTE PTR 15[rsp], 0
	test	esi, esi
	jle	.L31
	lea	eax, -1[rsi]
	lea	r8, 9[rsp]
	lea	r9, 1[rdi+rax]
	lea	rsi, 15[rsp]
	.p2align 4,,10
	.p2align 3
.L30:
	mov	rax, r8
	mov	ecx, 97
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L34:
	movzx	ecx, BYTE PTR [rax]
.L29:
	cmp	BYTE PTR [rdi], cl
	jne	.L27
	sub	ecx, 32
	mov	BYTE PTR [rdi], cl
.L27:
	add	rax, 1
	cmp	rax, rsi
	jne	.L34
	add	rdi, 1
	cmp	rdi, r9
	jne	.L30
.L31:
	mov	rdi, QWORD PTR 16[rdx]
	lea	rsi, .LC5[rip]
	call	fopen@PLT
	mov	rcx, r12
	mov	esi, 1
	lea	rdx, .LC2[rip]
	mov	rbp, rax
	mov	rdi, rax
	xor	eax, eax
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	add	rsp, 24
	lea	rdi, .LC6[rip]
	pop	rbp
	pop	r12
	jmp	puts@PLT
	.size	printStringToFile, .-printStringToFile
	.section	.rodata.str1.1
.LC7:
	.string	"Generated string:\n%s\n"
	.text
	.p2align 4
	.globl	generateString
	.type	generateString, @function
generateString:
	endbr64
	push	r14
	push	r13
	push	r12
	mov	r12, rdi
	xor	edi, edi
	push	rbp
	push	rbx
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	movsx	rdx, eax
	mov	ecx, eax
	imul	rdx, rdx, 109962159
	sar	ecx, 31
	sar	rdx, 40
	sub	edx, ecx
	imul	ecx, edx, 9999
	sub	eax, ecx
	mov	edx, eax
	lea	r13d, 1[rdx]
	test	r13d, r13d
	jle	.L39
	mov	r14, r12
	lea	rbp, 1[r12+rdx]
	mov	ebx, 10
	.p2align 4,,10
	.p2align 3
.L38:
	call	rand@PLT
	movsx	rdx, eax
	mov	ecx, eax
	imul	rdx, rdx, 715827883
	sar	ecx, 31
	sar	rdx, 36
	sub	edx, ecx
	lea	ecx, [rdx+rdx*2]
	sal	ecx, 5
	sub	eax, ecx
	lea	eax, 31[rax]
	cmove	eax, ebx
	add	r14, 1
	mov	BYTE PTR -1[r14], al
	cmp	r14, rbp
	jne	.L38
.L39:
	movsx	rax, r13d
	mov	rdx, r12
	mov	edi, 1
	mov	BYTE PTR [r12+rax], 0
	lea	rsi, .LC7[rip]
	xor	eax, eax
	call	__printf_chk@PLT
	pop	rbx
	mov	eax, r13d
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
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
