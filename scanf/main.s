# @author Konrad Filek
# Program wczytujący 2 liczby i wyświetlający je na ekran

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
  mov $0, %eax
  ret

