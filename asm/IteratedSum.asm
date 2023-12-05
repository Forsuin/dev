; IteratedSum.asm

extern printf

section .data
    n dq 10
    i dq 1
    fmt db "Sum is: %d", 10, 0

section .bss
    sum resq 1

section .text
    global main

main:
    push rbp
    mov rbp, rsp

    mov rax, [n]
    mov rcx, [i]

    cmp rcx, 0
    jg iterLoop
    mov qword [sum], 0
    jmp print

iterLoop:
    add rax, rcx
    loop iterLoop

    mov [sum], rax
print:

    mov rdi, fmt
    mov rsi, [sum]
    call printf

    mov rsp, rbp
    pop rbp
    ret