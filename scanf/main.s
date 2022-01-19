# @author Konrad Filek
# Program wczytujący 2 liczby i wyświetlający je na ekran
# Aby skompilować i uruchomić, należy w konsoli wpisać
# polecenie make

.globl main

.data

x:  .long 0
y:  .long 0

input:  .string "%d%d"
output: .string "Suma %d\n"

.text

# Ściągawka, rejestry ABI i ich ułożenie w funkcjach C
# int fun(arg1, arg2, arg3, arg4, arg5, arg6)
# rax     rdi   rsi   rdx   rcx   r8    r9

# Znaczenie '$':
# Jeśli użyty przy stałych:
# mov $3, %eax

# to oznacza że chcemy przypisać wartość, jeśli go nie damy,
# instrukcja próbuje pobrać do eax wartość z adresu 3:
# mov 3, %eax

# W pozostałych przypadkach oznacza pobranie adresu symbolu np.:
# mov $input, %edi
# pobierz adres do edi, a w drugim przypadku:
# mov input, %edi
# pobierz wartość do edi

# Zapamiętać dla printf/scanf:

# scanf(, &a);
# mov $a, %esi

# printf(, a);
# mov a, %esi

main:

# wyrównywanie ramki stosu do 8 bajtów, ważne by działał scanf
  sub $8, %rsp

# scanf("%d%d", &x, &y)
  xor %eax, %eax # <=> %eax = 0
  mov $input, %edi
  mov $x, %esi
  mov $y, %edx
  call scanf

# x = x + y
  movl x, %eax
  add y, %eax
  mov %eax, x
 
# printf("Suma %d", &x, &y)
  xor %eax, %eax
  mov $output, %edi
  mov x, %esi
  call printf

# wyrównywanie ramki stosu
  add $8, %rsp

# return 0
  xor %eax, %eax
  ret

