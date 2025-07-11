; boot.asm
[org 0x7c00]
bits 16

start:
    cli                 ; Clear interrupts
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00

    mov si, welcome
    call print

    jmp $

print:
    mov ah, 0x0E
.next_char:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .next_char
.done:
    ret

welcome db "Booting MyOS...", 0

times 510 - ($ - $$) db 0
dw 0xAA55
