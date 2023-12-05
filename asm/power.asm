; Power.asm
extern printf

section .data
    base dq 2
    power dq 63
    fmt db "The product is: %ld", 10, 0

section .bss 
    product resq 1

section .text
    global main

main:
    push rbp
    mov rbp, rsp

    mov rax, [base]
    mov rcx, [power]
    dec rcx

multLoop:
    imul qword rax, [base]
    loop multLoop

    mov [product], rax
print:
    mov rdi, fmt
    mov rsi, [product]
    call printf

    mov rsp, rbp
    pop rbp

    ret
