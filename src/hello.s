.data
_hello:
  .asciz "Hello, world: %d\n" # .asciz - string with trailing zero byte

.text
.globl _start
_start:
  subq $8, %rsp

  leaq _hello(%rip), %rdi # load the string
  movq $24, %rsi # load the number 24 as the second param
  movb $0, %al # specify the number of vector arguments to printf
  call printf

  movq $0, %rdi
  call _exit
