section .data
    hello db 'Hello, World!',10, 0

section .text
    global main

main:
    ; write Hello, World! to stdout
    mov eax, 4           ; syscall: write
    mov ebx, 1           ; file descriptor: stdout
    mov ecx, hello       ; pointer to the message
    mov edx, 14          ; message length
    int 0x80             ; invoke syscall

    ; exit the program
    mov eax, 1           ; syscall: exit
    xor ebx, ebx         ; status: 0
    int 0x80             ; invoke syscall
