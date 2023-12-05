; ParityCheck.asm
extern printf

section .data
    num dq 103
    oddFmt db "Odd Parity", 10, 0
    evenFmt db "Even Parity", 10, 0

section .text
    global main

main:
    push rbp
    mov rbp, rsp

    mov rbx, [num]

    cmp bl, 0
    jnp oddParity

    ; even
    mov rdi, evenFmt
    jmp print

oddParity:
    ; odd
    mov rdi, oddFmt

print:
    call printf

    mov rsp, rbp
    pop rbp
    ret

