.text
.globl _start
_start:
  subq $8, %rsp # Re-align stack pointer to a multiple of 16 bytes.

  movq $60, %rax # Choose sys_exit syscall
  movq $1, %rdi # Set error code to 1
  # integer arguments are passed in the following sequence of registers
  # %rdi, %rsi, %rdx, %rcx, %r8, %r9, then the rest are pushed on the stack
  # in reverse order
  syscall
