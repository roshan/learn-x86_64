.data
_hello:
  .asciz "Hello, world\n" # .asciz - string with trailing zero byte

.text
.globl _start
_start:
  subq $8, %rsp

  movb $0, %al
  leaq _hello(%rip), %rdi
  call printf

  movq $0, %rdi
  call _exit
