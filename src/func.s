.data
_hello:
  .asciz "Value: %d\n"

.text
.globl _start
_start:
  subq $8, %rsp

  movl $24, %edi 
  call inc_printer

  movq %rax, %rdi # Return value remains here since %rax is call-saved
  call inc_printer

  movq $0, %rdi
  call _exit

inc_printer:
  pushq %rbp
  movq %rsp, %rbp # Save stack pointer as base pointer

  subq $16, %rsp # Make space for stack variables (1), and keep %rsp 16-aligned
  movl %edi, -4(%rbp) # Copy the first argument into the first space

  leaq _hello(%rip), %rdi
  movq -4(%rbp), %rsi
  movb $0, %al
  call printf

  movq -4(%rbp), %r8
  addq $2, %r8
  movq %r8, %rax # Store the return value.

  leave
  ret
