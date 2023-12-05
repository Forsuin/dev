;ParityCheck.asm 

    extern printf
    section .data
        fmtodd db "Odd Parity",10,0
        fmteven db "Even Parity",10,0
        num dq 8


    section .bss


    section .text 

        global main 

    main:
    push rbp 
    mov rbp, rsp

    mov rbx, [num]

    cmp rdx, 0 
    jp even 

    mov rdi, fmteven
    mov rax, 0
    call printf
    jmp exit

    even:
    mov rdi, fmtodd 
    mov rax, 0 
    call printf

    exit: 
    mov rsp, rbp 
    pop rbp 
    ret