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
        # Передача значения в параметр char str[] и кладем его в регистр r12
	mov	r12, rdi
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
        # Инициализируем нулем length и кладем его в регистр r13d
	mov	r13d, 0
.L3:
        # Входной поток для чтения текста кладем в регистр rdi
	mov	rdi, QWORD PTR stdin[rip]
        # Читаем символ из потока
	call	fgetc@PLT
        # Кладем в переменную char ch символ, он кладется в регистр r14d
	mov	r14d, eax
        # Кладем значение length в регистр eax
	mov	eax, r13d
        # length++
	lea	edx, 1[rax]
	mov	r13d, edx
	movsx	rdx, eax
        # Кладем ссылку на начало массива в регистр rax
	mov	rax, r12
	add	rax, rdx
        # Записываем символ в str[]
	mov	edx, r14d
	mov	BYTE PTR [rax], dl
        # length == max_size
	cmp	r13d, 100001
        # Если length != max_size, то переходим к метке .L2
	jne	.L2
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L2:
        # ch == -1
	cmp	r14d, -1
        # Если ch != -1, то переходим к метке .L3
	jne	.L3
        # length кладем в регистр eax
	mov	eax, r13d
	cdqe
	lea	rdx, -1[rax]
        # Кладем ссылку на начало массива str[] в регистр rax
	mov	rax, r12
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	# Добавляем в конец символ конца последовательности
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
# Функция transformString(char str[], int length), которая заменяет в тексте
# все строчные гласные буквы на заглавные.
transformString:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
        # Передача значения в параметр char str[] и кладем его в регистр r12
	mov	r12, rdi
        # Передача значения в параметр length и кладем его в регистр r13d
	mov	r13d, esi
        # Инициализация массива char lowerChars[] строкой и кладем его в -15 по стеку
	mov	DWORD PTR -15[rbp], 1869178209
	mov	WORD PTR -11[rbp], 31093
	mov	BYTE PTR -9[rbp], 0
        # i = 0 и кладем его в регистр r14d
	mov	r14d, 0
	jmp	.L6
.L10:
        # j = 0 и кладем его в регистр r15d
	mov	r15d, 0
	jmp	.L7
.L9:
        # Считываем str[i]
        # Кладем i в регистр eax
	mov	eax, r14d
	movsx	rdx, eax
	movzx	edx, BYTE PTR [r12 + rdx]
        # Считываем lowerChars[j]
        # Кладем j в регистр eax
	mov	eax, r15d
	cdqe
        # Считываем char в lowerChars[] по индексу j
	movzx	eax, BYTE PTR -15[rbp+rax]
	cmp	dl, al
        # Если str[i] != lowerChars[j], то переходим к метке .L8
	jne	.L8
        # str[i] = str[i] - 32;
        # Кладем i в регистр eax
	mov	eax, r14d
	movsx	rdx, eax
        # Получаем результат в str[] по позиции i
	movzx	eax, BYTE PTR [r12 + rdx]
        # Изменяем символ
	lea	ecx, -32[rax]
        # Кладем i в регистр eax
	mov	eax, r14d
	movsx	rdx, eax
        # Кладем ссылку на начало str[] в регистр rax
	mov	rax, r12
	add	rax, rdx
        # Перезаписываем str[i]
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
.L8:
        # ++j
	add	r15d, 1
.L7:
        # j < 6
	cmp	r15d, 5
        # Если j >= 5, то переходим к метке .L9
	jle	.L9
        # ++i
	add	r14d, 1
.L6:
        # i (eax) < length
	mov	eax, r14d
	cmp	eax, r13d
        # Если i < length, то переходим к метке .L10
	jl	.L10
        # Передача str в регистр rax для использования в printf
	mov	rsi, r12
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
        # length кладется в регистр r12d
	call	readString
	mov	r12d, eax
        # length <= 1
	cmp	r12d, 1
        # Если length > 1, то переходим на метку .L13
	jg	.L12
        # Передача параметров для printf и вычитания из них 1
        # length -1 кладем в eax
	mov	eax, r12d
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
	mov	edx, r12d
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
