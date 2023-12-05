section .data
    n1 dq 21
    n2 dq 5
    fmt db "The greater number is %d", 10, 0

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp
    mov rax, [n1] ; 21
    mov rbx, [n2] ; 5

    cmp rax, rbx
    jge greater

    ;rbx is greater
    mov rsi, rbx 
greater:
    ; rax is greater
    mov rsi, rax
    jmp print
print:
    mov rdi, fmt
    mov rax, 0
    call printf

    mov rsp, rbp
    pop rbp
    ret