	.file	"functions.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Input text: "
	.align 8
.LC1:
	.string	"Buffer overflow occured. Trimming your text."
	.text
	.globl	readString
	.type	readString, @function
readString:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	r12, rdi
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	r13d, 0
.L3:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	r14d, eax
	mov	eax, r13d
	lea	edx, 1[rax]
	mov	r13d, edx
	movsx	rdx, eax
	mov	rax, r12
	add	rax, rdx
	mov	edx, r14d
	mov	BYTE PTR [rax], dl
	cmp	r13d, 100001
	jne	.L2
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L2:
	cmp	r14d, -1
	jne	.L3
	mov	eax, r13d
	cdqe
	lea	rdx, -1[rax]
	mov	rax, r12
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	mov	eax, r13d
	leave
	ret
	.size	readString, .-readString
	.section	.rodata
.LC2:
	.string	"Result: %s\n"
	.text
	.globl	transformString
	.type	transformString, @function
transformString:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	r12, rdi
	mov	r13d, esi
	mov	DWORD PTR -15[rbp], 1869178209
	mov	WORD PTR -11[rbp], 31093
	mov	BYTE PTR -9[rbp], 0
	mov	r14d, 0
	jmp	.L6
.L10:
	mov	r15d, 0
	jmp	.L7
.L9:
	mov	eax, r14d
	movsx	rdx, eax
	mov	rax, r12
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	movzx	eax, BYTE PTR -15[rbp+rax]
	cmp	dl, al
	jne	.L8
	mov	eax, r14d
	movsx	rdx, eax
	mov	rax, r12
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	lea	ecx, -32[rax]
	mov	eax, r14d
	movsx	rdx, eax
	mov	rax, r12
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
.L8:
	add	r15d, 1
.L7:
	cmp	r15d, 5
	jle	.L9
	add	r14d, 1
.L6:
	mov	eax, r14d
	cmp	eax, r13d
	jl	.L10
	mov	rax, r12
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	nop
	leave
	ret
	.size	transformString, .-transformString
	.section	.rodata
.LC3:
	.string	"r"
.LC4:
	.string	"End up reading file."
	.text
	.globl	readStringFromFile
	.type	readStringFromFile, @function
readStringFromFile:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	r12, rdi
	mov	r13, rsi
	mov	r14d, 0
	mov	rax, r13
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	r15, rax
.L13:
	mov	rax, r15
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -20[rbp], eax
	mov	eax, r14d
	lea	edx, 1[rax]
	mov	r14d, edx
	movsx	rdx, eax
	mov	rax, r12
	add	rax, rdx
	mov	edx, DWORD PTR -20[rbp]
	mov	BYTE PTR [rax], dl
	cmp	r14d, 100001
	jne	.L12
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L12:
	cmp	DWORD PTR -20[rbp], -1
	jne	.L13
	mov	eax, r14d
	cdqe
	lea	rdx, -1[rax]
	mov	rax, r12
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	mov	rax, r15
	mov	rdi, rax
	call	fclose@PLT
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, r14d
	leave
	ret
	.size	readStringFromFile, .-readStringFromFile
	.section	.rodata
.LC5:
	.string	"w+"
.LC6:
	.string	"Result is in the output file."
	.text
	.globl	printStringToFile
	.type	printStringToFile, @function
printStringToFile:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	r12, rdi
	mov	r13d, esi
	mov	QWORD PTR -56[rbp], rdx
	mov	DWORD PTR -23[rbp], 1869178209
	mov	WORD PTR -19[rbp], 31093
	mov	BYTE PTR -17[rbp], 0
	mov	r14d, 0
	jmp	.L16
.L20:
	mov	r15d, 0
	jmp	.L17
.L19:
	mov	eax, r14d
	movsx	rdx, eax
	mov	rax, r12
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	eax, r15d
	cdqe
	movzx	eax, BYTE PTR -23[rbp+rax]
	cmp	dl, al
	jne	.L18
	mov	eax, r14d
	movsx	rdx, eax
	mov	rax, r12
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	lea	ecx, -32[rax]
	mov	eax, r14d
	movsx	rdx, eax
	mov	rax, r12
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
.L18:
	add	r15d, 1
.L17:
	cmp	r15d, 5
	jle	.L19
	add	r14d, 1
.L16:
	mov	eax, r14d
	cmp	eax, r13d
	jl	.L20
	mov	rax, QWORD PTR -56[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rdx, r12
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	puts@PLT
	nop
	leave
	ret
	.size	printStringToFile, .-printStringToFile
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
