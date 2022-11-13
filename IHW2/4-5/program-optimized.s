	.file	"program.c"
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
# Функция readString(char str[]) для считывания текста из потока.
# Заполняет массив переданный по ссылке и возвращает его длину.
readString:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
        # Передача значения в параметр char str[] и кладем его в -24 по стеку
	mov	QWORD PTR -24[rbp], rdi
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
        # Инициализируем нулем length и кладем его в -4 по стеку
	mov	DWORD PTR -4[rbp], 0
.L3:
        # Входной поток для чтения текста кладем в регистр rax
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
        # Читаем символ из потока
	call	fgetc@PLT
        # Кладем в переменную char ch символ, он кладется в -8 по стеку
	mov	DWORD PTR -8[rbp], eax
        # Кладем значение length в регистр eax
	mov	eax, DWORD PTR -4[rbp]
        # length++
	lea	edx, 1[rax]
	mov	DWORD PTR -4[rbp], edx
	movsx	rdx, eax
        # Кладем ссылку на начало массива в регистр rax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
        # Записываем символ в str[]
	mov	edx, DWORD PTR -8[rbp]
	mov	BYTE PTR [rax], dl
        # length == max_size
	cmp	DWORD PTR -4[rbp], 100001
        # Если length != max_size, то переходим к метке .L2
	jne	.L2
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L2:
        # ch == -1
	cmp	DWORD PTR -8[rbp], -1
        # Если ch != -1, то переходим к метке .L3
	jne	.L3
        # length кладем в регистр eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, -1[rax]
        # Кладем ссылку на начало массива str[] в регистр rax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	# Добавляем в конец символ конца последовательности
	mov	eax, DWORD PTR -4[rbp]
	leave
	ret
	.size	readString, .-readString
	.section	.rodata
.LC2:
	.string	"Result: %s\n"
	.text
	.globl	transformString
	.type	transformString, @function
# Функция transformString(char str[], int length), которая заменяет в тексте
# все строчные гласные буквы на заглавные.
transformString:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
        # Передача значения в параметр char str[] и кладем его в -24 по стеку
	mov	QWORD PTR -24[rbp], rdi
        # Передача значения в параметр length и кладем его в -28 по стеку
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -15[rbp], 1869178209
	mov	WORD PTR -11[rbp], 31093
	mov	BYTE PTR -9[rbp], 0
        # i = 0 и кладем его в -4 по стеку
	mov	DWORD PTR -4[rbp], 0
	jmp	.L6
.L10:
        # j = 0 и кладем его в -8 по стеку
	mov	DWORD PTR -8[rbp], 0
	jmp	.L7
.L9:
        # Считываем str[i]
        # Кладем i в регистр eax
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
        # Кладем ссылку на начало массива str в регистр rax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
        # Считываем lowerChars[j]
        # Кладем j в регистр eax
	mov	eax, DWORD PTR -8[rbp]
	cdqe
        # Считываем char в lowerChars[] по индексу j
	movzx	eax, BYTE PTR -15[rbp+rax]
	cmp	dl, al
        # Если str[i] != lowerChars[j], то переходим к метке .L8
	jne	.L8
        # str[i] = str[i] - 32;
        # Кладем i в регистр eax
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
        # Кладем ссылку на начало str[] в регистр rax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
        # Изменяем символ
	lea	ecx, -32[rax]
        # Кладем i в регистр eax
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
        # Кладем ссылку на начало str[] в регистр rax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
        # Перезаписываем str[i]
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
.L8:
        # ++j
	add	DWORD PTR -8[rbp], 1
.L7:
        # j < 6
	cmp	DWORD PTR -8[rbp], 5
        # Если j >= 5, то переходим к метке .L9
	jle	.L9
        # ++i
	add	DWORD PTR -4[rbp], 1
.L6:
        # i (eax) < length
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
        # Если i < length, то переходим к метке .L10
	jl	.L10
        # Передача str в регистр rax для использования в printf
	mov	rax, QWORD PTR -24[rbp]
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
	.align 8
.LC3:
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
	sub	rsp, 1712
        # Выделяем память для массива str[max_size] и кладем в -100016 по стеку
	lea	rax, -100016[rbp]
	mov	rdi, rax
        # Вызов функции readString(str) и запись возвращаемого значения в length
        # length кладется в -4 по стеку
	call	readString
	mov	DWORD PTR -4[rbp], eax
        # length <= 1
	cmp	DWORD PTR -4[rbp], 1
        # Если length > 1, то переходим на метку .L13
	jg	.L12
        # Передача параметров для printf и вычитания из них 1
        # length -1 кладем в eax
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
        # max_size - 1 кладем в edx
	mov	edx, 100000
	mov	esi, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
        # return 1;
	mov	eax, 1
	jmp	.L14
.L12:
        # Передаем в регистр edx length
	mov	edx, DWORD PTR -4[rbp]
        # Передаем в регистр rax str
	lea	rax, -100016[rbp]
	mov	esi, edx
	mov	rdi, rax
        # Вызываем функцию transformString(char str[], int length)
	call	transformString
        # return 0;
	mov	eax, 0
.L14:
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
