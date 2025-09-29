section .data
    num1        dq 5
    num2        dq 3

    sum_msg     db "Sum: ", 0
    prod_msg    db "Product: ", 0
    newline     db 10

    sum_str     times 20 db 0      ; buffer for sum
    prod_str    times 20 db 0      ; buffer for product

section .text
    global _start

_start:
    ; === Addition ===
    mov rax, [num1]
    add rax, [num2]
    mov rdi, sum_str
    call int_to_str       ; RAX = length of sum
    mov r8, rax           ; save sum length

    ; Print "Sum: "
    mov rax, 1
    mov rdi, 1
    mov rsi, sum_msg
    mov rdx, 5
    syscall

    ; Print sum string
    mov rax, 1
    mov rdi, 1
    mov rsi, sum_str
    mov rdx, r8           ; correct sum length
    syscall

    ; Print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; === Multiplication ===
    mov rax, [num1]
    imul rax, [num2]
    mov rdi, prod_str
    call int_to_str       ; RAX = length of product
    mov r8, rax           ; save product length

    ; Print "Product: "
    mov rax, 1
    mov rdi, 1
    mov rsi, prod_msg
    mov rdx, 9
    syscall

    ; Print product string
    mov rax, 1
    mov rdi, 1
    mov rsi, prod_str
    mov rdx, r8           ; correct product length
    syscall

    ; Print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; === Exit ===
    mov rax, 60
    xor rdi, rdi
    syscall

; ============================================
; int_to_str: Converts RAX (integer) to string
; input : RAX = integer, RDI = pointer to buffer
; output: ASCII string at [RDI], RAX = length
; ============================================
int_to_str:
    push rbx
    push rcx
    push rdx
    push rsi

    mov rcx, 0              ; digit counter
    mov rbx, 10
    mov rsi, rdi            ; buffer pointer

    cmp rax, 0
    jne .convert
    mov byte [rsi], '0'
    mov rax, 1              ; length = 1
    jmp .done_restore

.convert:
.loop:
    xor rdx, rdx
    div rbx
    add dl, '0'
    mov [rsi], dl
    inc rsi
    inc rcx
    test rax, rax
    jnz .loop

    ; Reverse digits
    mov rax, rcx            ; save length
    mov rdx, rdi            ; start
    mov rsi, rsi
    dec rsi                 ; end pointer
.rev_loop:
    cmp rdx, rsi
    jge .reverse_done
    mov bl, [rdx]
    mov cl, [rsi]
    mov [rdx], cl
    mov [rsi], bl
    inc rdx
    dec rsi
    jmp .rev_loop

.reverse_done:
    mov byte [rdi + rax], 0 ; null-terminate

.done_restore:
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    ret

