#!/bin/bash

MAIN_FILE=main.s

as $MAIN_FILE -o obj.o
ld obj.o -o run
./run
