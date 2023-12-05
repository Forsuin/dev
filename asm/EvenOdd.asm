; EvenOdd.asm
extern printf

section .data
    num dq 18
    fmt db "%d is %s", 10, 0
    evenFmt db "even", 0
    oddFmt db "odd", 0

section .text
    global main

main:
    push rbp
    mov rbp, rsp

    mov rbx, [num]

    test bl, 1
    jnz noteven

    ; even
    mov rcx, evenFmt
    jmp print

noteven:
    ; odd
    mov rcx, oddFmt

print:
    mov rdi, fmt
    mov rsi, [num]
    mov rdx, rcx
    call printf

    mov rsp, rbp
    pop rbp
    ret

