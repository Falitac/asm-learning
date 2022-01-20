.globl main

.data

x:  .long 2

out: .string "%d %d\n"

.text

main:
# it does not work yet ^^
  sub $0x8, %rsp
  
  mov %rsp, %r12

  mov 8(%r12), %rdi
  call atoi

  mov $out, %edi
  mov %rax, %rsi
  xor %eax, %eax
  call printf

  xor %edx, %edx
  pop %rax
  pop %rbx
  idiv %ebx

  push %rdx
  push %rax

  mov $out, %edi
  pop %rsi
  pop %rdx
  xor %eax, %eax
  call printf


  add $0x8, %rsp
  xor %rax, %rax
  ret

