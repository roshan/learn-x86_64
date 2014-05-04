.text
.globl _start
_start:
  subq $8, %rsp

  movq $60, %rax
  movq $1, %rdi
  syscall
