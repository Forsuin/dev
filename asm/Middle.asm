; SmallestThree.asm

extern printf

section .data
    n1 dq 5
    n2 dq 3
    n3 dq 2
    fmt db "Middle num is: %d", 10, 0

section .bss
    middle resq 1
    smallest resq 1

section .text
    global main

main:
    push rbp
    mov rbp, rsp


; find smallest
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
    cmp rbx, rcx
    jl BMid
    jmp CMid
BSmall:
    mov [smallest], rbx
    cmp rax, rcx
    jl AMid
    jmp CMid
CSmall:
    mov [smallest], rcx
    cmp rax, rbx
    jl AMid
    jmp BMid

AMid:
    mov [middle], rax
    jmp print
BMid:
    mov [middle], rbx
    jmp print
CMid:
    mov [middle], rcx
    jmp print

print:

    mov rdi, fmt
    mov rsi, [middle]
    call printf

    mov rsp, rbp
    pop rbp
    ret