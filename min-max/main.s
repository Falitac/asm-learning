
.globl main

.data

table:	.long 4, 2, 8, 5, 4, 1, 9, 0
string:	.ascii "Min=%u, max=%u\n\0"

.text

main:
	sub $8, %rsp
	
	call min_max

	add $8, %rsp
	xor %rax, %rax
	ret

min_max:
	mov	$7, %esi
	mov $0xFFFFFFFF, %eax
	xor %ebx, %ebx
min_max_loop:
	mov	table(,%esi,4), %edx

/*
	if(tab[i] < min) {
		min = tab[i];
	}
*/
	cmp	%eax, %edx
	cmovb	%edx, %eax # eax > edx

/*
	if(tab[i] > max) {
		max = tab[i];
	}
*/
	cmp	%ebx, %edx 
	cmova %edx, %ebx # ebx < edx

	dec %esi

	jns	min_max_loop

	mov $string, %rdi
	mov %eax, %esi
	mov %ebx, %edx
	xor %eax, %eax
	call printf
	ret

# 0 0 0 0 0 0 0 0  1
# 7 6 5 4 3 2 1 0 -1

#		%esi
#  7 0111
#  6 0110
#  5 0101
#  4 0100
#  3 0011
#  2 0010
#  1 0001
#  0 0000
# -1 1111

# -8 + 4 + 2 + 1 = -1

