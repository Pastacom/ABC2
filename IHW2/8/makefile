separated-program-assembler: program.o functions.o
	gcc -o separated-program-assembler program.o functions.o
program.o:
	as --gstabs -o program.o program.s
functions.o:
	as --gstabs -o functions.o functions.s
