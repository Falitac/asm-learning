
FILENAME=main

all: compile link run

compile:
	gcc	-c $(FILENAME).s -o	$(FILENAME).o

link:
	gcc	$(FILENAME).o -o	$(FILENAME).x -no-pie

run:
	./$(FILENAME).x
