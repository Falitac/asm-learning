.globl main

.data

x:  .long 2

out: .string "%d %d\n"

.text

main:
	push %rbp
	mov %rsp, %rbp
  sub $0x10, %rsp
  
# edi ilość argumentów -> int    argc
# rsi argumenty        -> char** argv[]

  mov %rsi, %r12

  mov 8(%r12), %rdi
  call atoi
	push %rax

  mov 16(%r12), %rdi
  call atoi
	push %rax

  xor %edx, %edx
  pop %rbx
  pop %rax
  idiv %ebx

  push %rdx
  push %rax

  mov $out, %edi
  pop %rsi
  pop %rdx
  xor %eax, %eax
  call printf


  #add $0x8, %rsp
	leave
  xor %rax, %rax
  ret

