
.global main


.data

print_str: .string "%d\n"
arg_error_str: .asciz "Wrong parameter count!"

.text
# int fun(arg1, arg2, arg3, arg4, arg5, arg6)
# eax     rdi   rsi   rdx   rcx   r8    r9

main:
  cmp $2, %edi
  jb arg_error
  mov 8(%rsi), %rdi # int a = atoi(argv[1])
  call atoi 
  mov %rax, %rsi

  call factorial
  mov %rax, %rsi

  xor %rax, %rax
  mov $print_str, %rdi
  call printf
  
  xor %rax, %rax # return 0;
  ret

arg_error:
  mov $arg_error_str, %rdi
  call puts
  mov $1, %rax # return 1;
  ret
  
factorial:
  cmp $1, %rsi # if(n <= 1)
  ja factorial2
  mov $1, %rax # return 1;
  ret

factorial2:
  dec %rsi # f(n-1)
  call factorial
  inc %rsi
  imul %rsi, %rax # return f(n) * n
  ret
  
