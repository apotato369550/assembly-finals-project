mov ax, 0B800h

; start and end of video memory
mov es, ax
mov si, 0

; how it works: kinda like a finite automata scanner??
; scan for c -> o -> m
; if either fail, continue. if all three pass, good!

scan:
    cmp si, 4000
    jge finished

    mov al, [es:si]

    ; check for C
    cmp al, 'C'
    je check_om
    
    jmp next_char

check_om:
    ; check if o is next
    ; +2 since 2 bytes per character
    mov al, [es:si+2]

    ; jump to next char if not equal, then continue scanning
    cmp al, 'O'
    jne next_char

    mov al, [es:si+4]

    cmp al, 'M'
    jne next_char

    ; COM has been found!!!
    ; replace, then skip
    mov byte [es:si], 'H'
    mov byte [es:si+2], 'I'
    mov byte [es:si+4], 'S'

    add si, 6
    jmp scan


next_char:
    add si, 2
    jmp scan

finished:
    ; interrupt when done
    int 20h