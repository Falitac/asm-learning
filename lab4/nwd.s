#################################################################
#
# Laboratorium 5. Obliczanie NWD, przekazanie argumentow
# funkcjom bibliotecznym jezyka C oraz parametrow programu z linii komend
# 

.globl	main	# nazwa glownej etykiety/funkcji - tak, jak w C

#################################################################
#
# alokacja pamieci - dwie zmienne statyczne 32 bitowe,
# z nadana wartoscia poczatkowa oraz ciag tekstowy zgodny z C

.data

var_a:		.long	24
var_b:		.long	36
outstr:	.asciz	"nwd( %d , %d ) = %d\n"
printf_ret: .string "ret = %d\n"
error_info: .string "Wrong parameter count!"

#################################################################
#
# program glowny
  
.text

main:
  cmp $3, %edi
  jne arg_error
  mov %rsi, %r15

  mov 8(%r15), %rdi
  call atoi
  mov %eax, var_a # a = argv[1] 
  mov 16(%r15), %rdi
  call atoi
  mov %eax, var_b # b = argv[2] 

# wyrownanie wierzcholka stosu do granicy 16 bajtow (8 bajtow w dol)
# sub	$8,%rsp

#################################################################
#
# --- 3 --- zadanie dodatkowe
# zastapic wartosci poczatkowe zmiennych var_a i var_b
# argumentami przekazanymi z linii komend terminala do funkcji main:
#	int main(int argc, char **argv) - zgodnie z ABI


mov	var_a,%edi
mov	var_b,%esi

call	nwd

#################################################################
#
# --- 2 --- przekazac argumenty do funkcji printf:
#
# printf("nwd( %d , %d ) = %d\n", a, b, nwd);
#
# 1. wskaznik na poczatek ciagu tekstowego
# 2. i 3. - liczby a i b
# 4. obliczone NWD
# 5. informacja o liczbie wykorzystanych rejestrow wektorowych


mov %rax, %rcx
xor %rax, %rax
mov $outstr, %rdi
mov var_a, %rsi
mov var_b, %rdx
call	printf

mov %rax, %rsi
xor %rax, %rax
mov $printf_ret, %rdi
call	printf

#add	$8,%rsp			#przesun wskaznik stosu o 8 bajtow w gore aby prawidlowo sciagnac adres powrotu
xor %rax, %rax
ret
arg_error:
  xor %rax, %rax
  mov $error_info, %rdi
  call puts
  mov $1, %rax
  ret

#################################################################
#
# --- 1 --- uzupelnic - NWD
#
# argumenty i zwracana wartosc przekazac w rejestrach zgodnie z ABI
# algorytm Euklidesa:
# a i b - 32 bitowe liczby bez znaku
#
#	while (a!=b)
#	 {
#	   if (a>b) a=a-b
#	   else b=b-a
#	  }
#	return a
#
# lub:
#
# unsigned int NWD(unsigned int a, unsigned int b) 
# { 
#   if (b==0) return a; 
#   else NWD(b, a % b); 
# } 
 

nwd:
  cmp %esi, %edi
  je end
  ja above
  sub %edi, %esi
  jmp nwd
  
above:
  sub %esi, %edi
  jmp nwd


end:
  mov %edi, %eax
  ret
		
#################################################################

