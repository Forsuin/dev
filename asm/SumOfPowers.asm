; SumOfPowers.asm

extern printf

section .data
    n dq 4
    output dq 0
    fmt db "Output: %d", 10, 0

section .text
    global main

main:
    push rbp
    mov rbp, rsp

    mov rax, [n]
    mov rbx, 2

    cmp rax, 2
    jl print
    mov rdx, 0

divLoop:
    add [output], rax
    idiv rbx ; n / 2
    cmp rax, 2 ; n >= 2
    jge divLoop


print:
    mov rdi, fmt
    mov rsi, [output]

    call printf

    mov rsp, rbp
    pop rbp
    ret