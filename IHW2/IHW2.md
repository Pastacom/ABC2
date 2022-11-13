﻿# ИДЗ №2
*Шиндяпкин Илья Дмитриевич БПИ-219*
## Задание
### Вариант №5
Разработать программу, заменяющую все строчные гласные буквы в заданной ASCII-строке заглавными.
***
То есть мы считываем строку, после чего определяем ее длину. Посимвольно проходимся по строке, заменяя гласные буквы нижнего регистра на аналоги верхнего регистра.
## Часть на 4-5.
В папке под названием "4-5" находится код на С, и код на ассемблере после компиляции без функций отладки и еще один модифицированный, в котором убраны макросы. Программы используют локальные переменные и функции с параметрами, для обработки задаваемой строки.  То есть программа сразу выполнена, чтобы удовлетворять критериям на 4 и 5 баллов.
 
Есть исполняемые файлы для трех версий программы: a.out для версии, написанной на С, b.out для версии, скомпилированной на ассемблере, а c.out для модифицированной версии, написанной на ассемблере.

В этой же директории есть папка с тестами, где есть входные данные и соответствующие им выходные. Все программы протестированы на входных данных и выдают корректные результаты. 

**Дублирование тестовых данных**:

Тест 1:

	Входные данные:
	Abuasj
	Выходные данные:
    AbUAsj

Тест 2:

	Входные данные:
	!@# $%789n 09371*()&^% /A
	Выходные данные:
    !@# $%789n 09371*()&^% /A

Тест 3:

	Входные данные:
	sajdij129KFJJkjkasoOP
	Выходные данные:
    sAjdIj129KFJJkjkAsOOP

Тест 4:

	Входные данные:
	kOKpllOHsakBals
	Выходные данные:
    kOKpllOHsAkBAls

Тест 5:

	Входные данные:
	gyRYYIYrvYTUB7TYUTUfJG
	BKUYybYFY gybfTUTKHFI
	UIIiifuahiyi12iohskajjifhasq
	Выходные данные:
    gYRYYIYrvYTUB7TYUTUfJG
	BKUYYbYFY gYbfTUTKHFI
	UIIIIfUAhIYI12IOhskAjjIfhAsq



Тест 6:

	Входные данные:
	IHYYTUIYIYUybusbcyui23yoi2ruoibyvutyuevruetbvrn32uibvgirevuq0970918c08097n283v8m94tuu
	Выходные данные:
    IHYYTUIYIYUYbUsbcYUI23YOI2rUOIbYvUtYUEvrUEtbvrn32UIbvgIrEvUq0970918c08097n283v8m94tUU



Тест 7:

	Входные данные:
	fhjHJKH GKUUGUjsbaasklnflkh
	86186 7 3 18 AJFASG978*&
	!@* (*!@*#)* (!*91724 741297
	HHAJHSUWHSJASFG adiwao8 (!)@#09aAo

	Выходные данные:
    fhjHJKH GKUUGUjsbAAsklnflkh
	86186 7 3 18 AJFASG978*&
	!@* (*!@*#)* (!*91724 741297
	HHAJHSUWHSJASFG AdIwAO8 (!)@#09AAO





***
*Особенность работы*:  при вводе пустой строки программа будет выдавать ошибку с указанием допустимого диапазона длины строки, при выходе за максимальный порог длины буфера будет вызываться та же ошибка, а строка будет обрезаться. Из консоли читаем до CTRL+D, а из файла до конца файла.
***
Коды на ассемблере прокомментированы. Указана связь переменных с регистрами и памятью на стеке, а так же связь регистров и переменных при возвращении из функций и передачи их, как параметров, то есть эквивалентное представление переменных и регистров/памяти на стеке на различных языках. 
***
Из модифицированной версии кода на ассемблере убраны ненужные макросы с помощью компиляции с флагами. 

Код на С был скомпилирован со следующими флагами:
-masm=intel (для использования синтаксиса Intel)
-fno-asynchronous-unwind-tables (отключает генерацию отладочной информации)
-fno-jump-tables (отключает использование jump-таблиц в switch-case конструкциях)
-fno-stack-protector (отключение стекового индикатора)
-fno-exceptions (позволяет корректно работать с исключениями)

## Часть на 6.
В папке под названием "6" находится тот же код на С, и улучшенный код на ассемблере после компиляции с флагами.
 
Есть исполняемые файлы для двух версий программы: a.out для версии, написанной на С, b.out для рефакторинговой версии на ассемблере, а также папка с теми же тестами.
***
Была модифицирована работа с массивом символов. Теперь для каждой локальной переменной и параметров были выделены постоянные регистры соответствующих размеров, вместо выделения места на стеке, что ускоряет работу. 
В функции readString:
 - rbp[-24] -> r12
 - rbp[-4] -> r13d
 - rbp[-8] -> r14d

В функции transformString:
 - rbp[-24] -> r12
 - rbp[-28] -> r13d
 - rbp[-4] -> r14d
 - rbp[-8] -> r15d
В функции main:
- rbp[-4] -> r12d
***
Так же из всех функций были убраны излишние конструкции по типу двойного переноса значения по регистрам. Пример:
	    
	    mov     rax, r12
		mov     rdi, rax 

Переписанный вариант:

	    mov		rdi, r12
***
Оптимизирован процесс обращения по индексу массива, где это было возможно. Пример:

        mov     rax, r12
        add     rax, rdx
        movzx   edx, BYTE PTR [rax]


Переписанный вариант:

        movzx   edx, BYTE PTR [r12 + rdx]
***
Исправленный код был проверен на тех же тестах и показывал корректные результаты.
***
Код на ассемблере прокомментирован. Указана связь между регистрами и переменными.
***
Использование регистров и рефакторинг позволил ускорить программу и сократить количество строк в нашем коде.

## Часть на 7.
Программа была разделена на несколько единиц компиляции как на языке С, так и на ассемблере. Программы на ассемблере были так же оптимизированы. 

Программа на С собиралась с помощью следующих команд:

    $ gcc -c functions.c -o functions.o

	$ gcc -c program.c -o program.o

	$ gcc functions.o program.o -o separated-program

Программа на ассемблере собирается с помощью makefile, который компонует производный файл из ассемблерных файлов functions.s и program.s.

Чтобы собрать файл на базе ассемблера использовалась команда:

    $ make -f makefile

***
В итоге получили два исполняемых файла с несколькими единицами компиляции. 
Файл на С: separated-program-c
Файл на ассемблере: separated-program-assembler
***
У обеих программ работающий ввод/вывод данных через консоль и файлы. 
Для работы через консоль запускаем исполняемые файлы, как прежде:

    $ ./separated-program-assembler



Для работы с файлами необходимо передать имена файлов, как аргументы, т.е. входного и выходного:

	$ ./separated-program-assembler input.in output.out



Производится проверка командной строки на корректность вводимых аргументов.
***
Обе программы были протестированы на тестовых данных и показали корректное поведение.

Для удобства проверки из папки с тестами был скопирован файл с наиболее комплексными входными данными test7.in и переименован в input.in. Также в этой же папке лежит файл output.out с результатом работы программы после ввода в нее этого теста.

## Часть на 8.
Программа была модифицирована возможностью генерировать тексты. Сгенерированный текст, выводится в консоль, после чего обработанный текст выводится туда же. Так же была использована функция для замера времени выполнения программы. 

Для избежания захламления консоли генерируются тексты длины не более 9999. Однако наглядность замеров все равно останется, поскольку мы искусственно замедляем работу программы за счет добавления цикла на 10000 итераций в функцию обработки текста. При генерации не используются символы чьи коды меньше 32, исключением является символ переноса строки.
***
Были оптимизированы коды на ассемблере и разделены файлы на единицы компиляции аналогичным способом, как в пункте на 7 баллов. 

Командная строка теперь может принимать один аргумент, который будет означать, что необходимо сгенерировать входной текст:

    ./separated-program-assembler -g

***
Было проведено тестирование 15 раз на сгенерированных данных. По результатам замеров выяснилось, что ассемблерная программа работает быстрее на небольших объемах данных, однако при размере превышающий ~190 начинает проигрывать в скорости программе разработанной на С. При этом максимальный разброс может достигать до 0.023 с, при больших объемах данных. В среднем различия по скорости составляют 1.8%
