.globl main

.data

x:  .long 2
y:  .long 3

out: .string "Wieksze\n"

.text


main:
	push %rbp
	mov %rsp, %rbp
  sub $0x10, %rsp

	mov y, %eax
	cmpl x, %eax
	jb end

	mov $out, %edi
	call puts
end:	
	

	leave
  xor %rax, %rax
  ret

