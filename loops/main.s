# @author Konrad Filek
# Pętle w assembly
# Aby skompilować i uruchomić, należy w konsoli wpisać
# polecenie make
# Samo uruchomienie: make run
# lub: ./main.x

.globl main

.data


output: .string "Loop %d\n"

break_line: .string "------------------"

prompt_number: .string "Podaj liczbe:"
get_number: .string "%d"

x: .long 0
n: .long 0

output2: .string "Ilosc jedynek w liczbie: %d\n"

.text

# Ściągawka, rejestry ABI i ich ułożenie w funkcjach C
# int fun(arg1, arg2, arg3, arg4, arg5, arg6)
# rax     rdi   rsi   rdx   rcx   r8    r9

main:

# wyrównywanie ramki stosu do 8 bajtów, ważne by działał scanf
  sub $8, %rsp

# Loop 1)
# Najprostsza pętla, gdy wiemy ile razy ma się coś wykonać,
# i niekoniecznie chcemy się odnosić do danych elementów
  mov $10, %ebx # ebx nie zmienia stanu ABI str. 22
loop1:

# printf();
  xor %eax, %eax
  mov $output, %edi
  mov %ebx, %esi
  call printf
  
# while(ebx != 0), wykonuj to co wyżej
  dec %ebx
  jnz loop1

# puts("----")
  mov $break_line, %rdi
  call puts

# Loop 2)
# Odpowiednik for lub do-while, ecx odpowiada zmiennej iterowanej 'i'

  xor %ecx, %ecx # i = 0
loop2:

  mov %ecx, %ebx # zapisz do ebx wartosc ecx, ktora moze zostac utracona

# printf();
  xor %eax, %eax
  mov $output, %edi
  mov %ecx, %esi
  call printf

  mov %ebx, %ecx # odzyskaj wartosc ecx

  inc %ecx # i++
  cmp $7, %ecx 
  jle loop2 # i <= 7

# puts("----")
  mov $break_line, %rdi
  call puts

# Loop 3)
# Pętla za pomocą instrukcji loop. Niezalecana w użyciu
# gdyż obniża możliwości działania potokowego procesora

  mov $5, %ecx
loop3:
  mov %ecx, %ebx # zapisz do ebx wartosc ecx, ktora moze zostac utracona

# printf();
  xor %eax, %eax
  mov $output, %edi
  mov %ecx, %esi
  call printf

  mov %ebx, %ecx # odzyskaj wartosc ecx

  loop loop3

# puts("----")
  mov $break_line, %rdi
  call puts

# puts("Podaj liczbe");
  mov $prompt_number, %rdi
  call puts

# scanf("%d", &x");
  xor %eax, %eax
  mov $get_number, %edi
  mov $x, %esi
  call scanf

# Loop 4)
# while(warunek)
# Zliczanie 1 w reprezentacji binarnej podanej liczby

  jmp loop4cnd
loop4:
  mov x, %ecx
  and $0x1, %ecx # if(0x1 && x == 0x1)
  jz end_if

  incl n # n++
end_if:

  shrl x # x >>= 1
loop4cnd:
  mov x, %ecx
  jnz loop4 # while(x != 0)

# printf("Ilosc jedynek w podanej liczbie %d\n", n)
  xor %eax, %eax
  mov $output2, %edi
  mov n, %esi
  call printf

# wyrównywanie ramki stosu
  add $8, %rsp

# return 0;
  xor %eax, %eax
  ret

