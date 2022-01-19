
.global _start

  .equ sys_write, 1
  .equ sys_exit, 60
  .equ stdout, 1
  .equ iterations, 5
  .equ strlen, new_line + 1 - str

.data

  str: .ascii "- x iteration"
  new_line: .byte 0x0A
  counter: .byte 0
  file_name: .ascii "./run.sh"
  return_value: .long 0
  read_value: .ascii "                    "
  value_size: .byte 20


.text

_start:
  movb $1, counter
  for:
  cmpb $iterations, counter
  ja forend

  #print string
  mov $1, %eax
  mov $1, %edi
  mov $str, %esi
  mov $strlen, %edx
  syscall
  
  incb counter
  jmp for
  forend:


  # print content
  mov $1, %eax
  mov $1, %edi
  mov $str, %esi
  mov $strlen, %edx
  int $0x80

  mov $60, %eax
  xor %edi, %edi
  syscall

