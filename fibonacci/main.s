# @author Konrad Filek
# Ciąg fibonacciego wersja iteracyjna
# Jako drugi argument podajemy interesujaca nas liczbe
# Aby skompilować i uruchomić, należy w konsoli wpisać
# polecenie make
# Samo uruchomienie: make run
# lub: ./main.x

.globl main

.data

i:  .long 0
n:  .long 0

x:  .quad 0
y:  .quad 1

output: .string "Fibonacci[%2d] %d\n"

output_msg: .string "Nieprawidlowa ilosc argumentow"

.text

# Ściągawka, rejestry ABI i ich ułożenie w funkcjach C
# int fun(arg1, arg2, arg3, arg4, arg5, arg6)
# rax     rdi   rsi   rdx   rcx   r8    r9

# Wykorzystywanie argumentow przesylanych do programu:
# w edi znajduje się ilość argumentów -> int argc
# w rsi znajdują się adresy argumentów -> char** argv

main:

# wyrównywanie ramki stosu do 8 bajtów, ważne by działał scanf
  sub $8, %rsp

# if(argc != 2)
  cmp $2, %edi
  jne error # skocz do error

# przekazanie adresów wartości argumentów do r15
  mov %rsi, %r15
  
# int n = atoi(argv[1])

  mov 8(%r15), %rdi
  call atoi
  mov %eax, n

loop_start:

# printf("Fibonacci[%d] %d\n", i, x);
  xor %eax, %eax
  mov i, %rsi
  mov x, %rdx
  mov $output, %edi
  call printf

  mov y, %rbx #y
  mov y, %rax #y
  add x, %rax #y=x+y
  mov %rbx, x #x=y
  mov %rax, y #y=x+y

# i++;
  incl i
# while (i < n)
  mov i, %ecx
  cmp n, %ecx

  jb loop_start


# wyrównywanie ramki stosu
  add $8, %rsp

# return 0;
  xor %eax, %eax
  ret

error:

# puts("Nieprawidlowa ilosc argumentow");
  mov $output_msg, %rdi
  call puts

# wyrównywanie ramki stosu
  add $8, %rsp

# return 1;
  xor $1, %eax
  ret

