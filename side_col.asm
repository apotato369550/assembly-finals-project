mov ax, 0B800h
mov es, ax ; load the video into memory

; bx will be whitespace
mov bx, ' '
; move 'a' into a register
mov al, 'A'

line_loop:
    ; start at the very first position and insert a
    mov si, 0 

    top_line:
        mov byte [es:si], ' '
        mov byte [es:si+160], ' '
        add si, 2
        mov [es:si], al
        mov byte [es:si+160], 'B'
        call delay

        ; if at middle column, then go bottom line
        cmp si, 80 
        jl top_line

    mov byte [es:si], ' '
    mov byte [es:si+160], ' '
    mov si, 3760
    ; 3920 - 160
    ; 37

    bottom_line:
        mov byte [es:si], ' '
        mov byte [es:si+160], ' '
        add si, 2
        mov [es:si], al
        mov byte [es:si+160], 'B'
        call delay

        ; if at the end, then move!
        cmp si, 3840
        ;; 4000 - 160
        jl bottom_line

    
    jmp line_loop

int 20h

delay: 
    push cx
    mov cx, 0x4000

wait_loop:
    dec cx
    jnz wait_loop
    pop cx
    ret