; ThreeAverage.asm

extern printf

section .data
    n1 dd 1
    n2 dd 100
    n3 dd 1

    fmt db "The average is: %d", 10, 0

section .bss
    avg resd 1

section .text
    global main

main:
    push rbp
    mov rbp, rsp

    mov eax, 0

    add eax, [n1]
    add eax, [n2]
    add eax, [n3]

    xor edx, edx

    mov ebx, 3

    div ebx

    mov [avg], eax

    mov rdi, fmt
    mov rsi, [avg]
    call printf

    mov rsp, rbp
    pop rbp
    ret
