
SRC_NAME=nwd.s
EXEC_NAME=out
OBJ_NAME=out.o


RUN_PARAMS?=12 48

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

.SILENT: all
