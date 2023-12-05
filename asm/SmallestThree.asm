; SmallestThree.asm

extern printf

section .data
    n1 dq 2
    n2 dq 3
    n3 dq 1
    fmt db "Smallest num is: %d", 10, 0

section .bss
    smallest resq 1

section .text
    global main

main:
    push rbp
    mov rbp, rsp


    mov rax, [n1]
    mov rbx, [n2]
    mov rcx, [n3]

    cmp rax, rbx
    jl AC

AB:
    cmp rbx, rcx
    jl BSmall
    jmp CSmall

AC:
    cmp rax, rcx
    jl ASmall
    jmp CSmall

ASmall:
    mov [smallest], rax
    jmp print
BSmall:
    mov [smallest], rbx
    jmp print
CSmall:
    mov [smallest], rcx
    jmp print

print:

    mov rdi, fmt
    mov rsi, [smallest]
    call printf

    mov rsp, rbp
    pop rbp
    ret