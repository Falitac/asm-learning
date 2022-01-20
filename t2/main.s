# Uzywanie funkcji systemowych syscall
# przykład write
.globl main

.data

out:	.ascii "Mleko"
endline: .ascii "\n"

len:	.byte endline - out

in: .string "203493284"

.text

main:
	sub $8, %rsp

# eax nr funkcji
# edi arg0
# esi arg1
# edx arg2
# syscall <- instrukcja wywolujaca dana funkcje na podstawie rejestrow
	mov $1, %eax
	mov $1, %edi
	mov $out, %esi
	mov $len, %edx
	syscall

	mov $0, %eax
	mov $0, %edi
	mov $in, %esi
	mov $10, %edx
	syscall

	mov $1, %eax
	mov $1, %edi
	mov $in, %esi
	mov $10, %edx
	syscall

	add $8, %rsp
	mov $0, %eax # return 0
	ret

# int fun(arg0, arg1, arg2, arg3, arg)
# eax     edi   esi,  edx,  ecx,  r8, r9
rax # 
rbx

rcx
rdx

rdi
rsi

rbp
rsp

rax / zmienna
rax

mov $20, %eax
mov $3, %ebx

mov $0, edx
div %ebx


rdx 
div rejestr

