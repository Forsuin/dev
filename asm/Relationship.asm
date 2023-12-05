; Relationship.asm

extern printf

section .data
    n dq 5
    m dq 100
    gFmt db "n is greater than m", 10, 0
    lFmt db "n is smaller than m", 10, 0
    eFmt db "n is equal to m", 10, 0

section .text
    global main

main:
    push rbp
    mov rbp, rsp

    mov rax, [n]
    mov rbx, [m]

    cmp rax, rbx
    jg nGreater
    jl mGreater
    je equal

nGreater:
    mov rdi, gFmt
    jmp print
mGreater:
    mov rdi, lFmt
    jmp print
equal:
    mov rdi, eFmt

print:
    call printf

    mov rsp, rbp
    pop rbp
    ret