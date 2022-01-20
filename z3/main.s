.globl main

.data

n:  .long 0

out: .string "%d\n"
in: .string "%d"

.text


main:
	push %rbp
	mov %rsp, %rbp
  sub $0x10, %rsp

	xor %eax, %eax
	mov $in, %edi
	mov $n, %esi
	call scanf

	mov $1, %ecx
	jmp loop1_cnd
loop1:
	push %rax

	mov $0, %edx
	mov %ecx, %eax
	mov $3, %ebx

	div %ebx

	pop %rax

cmp $0, %edx
	je end_if
	add $1, %eax
end_if:

	inc %ecx
loop1_cnd:
	cmp n, %ecx
	jbe loop1
	
	push %rax

	mov %eax, %esi
	mov $0,	%eax
	mov $out, %edi
	call printf

	pop %rax

	leave
  xor %rax, %rax
  ret

