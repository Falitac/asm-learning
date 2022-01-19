##################################################
# Laboratorium 2.
# Wywolanie System Calls
# Wydrukowanie ciagu tekstowego w oknie terminala
# Prosta petla "for"


# Nazwa (etykieta - label) programu glownego
# jest to wskaznik - adres pierwszej instrukcji programu

.global _start

# Defnicje stalych, uzywanych w programie (opcjonalnie)

.equ	sys_write,	1
.equ	sys_exit,	60
.equ	stdout,	1
.equ	iterations, 5
.equ	strlen,	new_line + 1 - str

##################################################
#
# Alokacja pamieci - zmienne statyczne, 8/16/32/64 bitowe,
# z nadana wartoscia poczatkowa

.data

str:	.ascii	"- x iteration"
new_line:	.byte	0x0A
counter:	.byte	0

##################################################
#
# Program glowny

.text
_start:

# Zadania:
# - 3 -wydrukuj ciag tekstowy "str" "iterations" razy - w petli for

# - 4 - korekcja ASCII - zmodyfikuj "x" w ciagu "str" tak,
# aby w jego miejscu drukowana byla wartosc licznika iteracji "counter"

# - 1 - przekaz argumenty i wywolaj System Call nr 1 (sys_write)

movb $1, counter
for:

cmpb $5, counter
ja forend

mov $1, %eax
mov $1, %edi
mov $str, %esi
mov $strlen, %edx
syscall

incb counter
jmp for
forend:

# - 2 przekaz argumenty i wywolaj System Call nr 60 (sys_exit)
mov $60, %eax
xor %edi, %edi #0
syscall

# Koniec programu

