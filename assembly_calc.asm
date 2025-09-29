section .data
    num1 db 5       ; First number
    num2 db 7       ; Second number
    result db 0     ; Storage for the sum
    msg db "The sum is: ", 0   ; Message to display before the sum
    msg_len equ $ - msg - 1 ; Length of the message (excluding null terminator)

section .text
    global _start

_start:
    ; Load the first number into AL
    mov al, [num1]

    ; Add the second number to AL
    add al, [num2]

    ; Store the result in 'result'
    mov [result], al

    ; --- Outputting the result ---

    ; Display the introductory message
    mov edx, msg_len    ; Length of the message
    mov ecx, msg        ; Address of the message
    mov ebx, 1          ; File descriptor (stdout)
    mov eax, 4          ; System call for sys_write
    int 0x80            ; Call the kernel

    ; Convert the numerical result to its ASCII character representation
    ; (assuming the sum is a single digit, add '0' to convert to ASCII)
    add byte [result], '0'

    ; Display the sum
    mov edx, 1          ; Length of the sum (single digit)
    mov ecx, result     ; Address of the sum
    mov ebx, 1          ; File descriptor (stdout)
    mov eax, 4          ; System call for sys_write
    int 0x80            ; Call the kernel

    ; Exit the program
    mov eax, 1          ; System call for sys_exit
    xor ebx, ebx        ; Exit status 0
    int 0x80            ; Call the kernel