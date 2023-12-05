section .data
    num dq 6

section .bss
    sum resq 1

section .text
    extern printf
    global main

main:
    push rbp
    mov rbp, rsp

    mov sum, 0
    mov rax, [num]

sum_loop:
