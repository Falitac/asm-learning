
SRC_NAME=lib_asm.s
EXEC_NAME=out
OBJ_NAME=out.o


RUN_PARAMS?=6

all: compile link run

compile:
	as $(SRC_NAME) -g -o $(OBJ_NAME) 

link:
	gcc $(OBJ_NAME) -o $(EXEC_NAME) -no-pie

run:
	./$(EXEC_NAME) $(RUN_PARAMS)

clean:
	rm $(OBJ_NAME) $(EXEC_NAME)

dump:
	objdump -D $(EXEC_NAME)

cprog:
	gcc -c main.c -o prog.o
	gcc prog.o lib_asm.o -o run -no-pie --static
	./run 12 36
cprog_dynamic:
	as lib_asm.s -o lib_asm.o
	gcc -shared lib_asm.o -o lib_asm.so
	gcc -c main.c -o prog.o
	gcc prog.o lib_asm.so -o run -no-pie --static
	./run 12 36


.SILENT: all
