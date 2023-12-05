; IteratedSum.asm

extern printf

section .data
    string db "Hello, %s!", 10, 0
    var db "Dave", 0


section .text
    global main

main:
    push rbp
    mov rbp, rsp


print:

    mov rdi, string
    mov rsi, var
    call printf

    mov rsp, rbp
    pop rbp
    ret