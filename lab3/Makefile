
EXEC_NAME=out
OBJ_NAME=out.o

all: compile link run

compile:
	as asm.s -o $(OBJ_NAME)

link:
	ld $(OBJ_NAME) -o $(EXEC_NAME)

run:
	./$(EXEC_NAME)

clean:
	rm $(OBJ_NAME) $(EXEC_NAME)

dump:
	objdump -D $(EXEC_NAME)

.SILENT:all
