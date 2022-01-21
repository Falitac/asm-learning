.globl main
 
.data
 
output: .string "Podaj imie:"
cos: .string "Imie: %s\n                   "
imie: .string "%s"
imie1: .string "            "
 
 
.text
 
main:
 
sub $8, %rsp
 
mov $output, %rdi
call puts
 
xor %eax, %eax
mov $imie, %edi
mov $imie1, %esi
call scanf
 
mov $cos, %edi
mov $imie1, %esi
xor %eax, %eax
call printf
 
 
add $8, %rsp
 
xor %eax, %eax
ret
