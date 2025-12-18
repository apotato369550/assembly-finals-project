org 100h

mov ax, 0B800h
mov ds, ax
mov es, ax


mov al, 'X'
mov bx, ' '

mov si, 0

line1:
    mov [es:si], al
    call delay

    cmp si, 158
    je wrap

    mov [es:si], bx
    add si, 2
    jmp line1

wrap:
    mov [es:si], bx
    mov si, 0
    jmp line1

delay:
    mov cx, 0FFFFh

wait_loop:
    dec cx

    cmp cx, 0
    jne wait_loop
    ret