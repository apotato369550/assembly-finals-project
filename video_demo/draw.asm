org 100h

;set video mode
mov ah, 00h
mov al, 13h
int 10h

mov ax, 0000h
int 33h

mouse_loop:
	mov ax, 0003h
	int 33h 

	test bx, 02h
	jnz exit_program
	
	mov ah, 0ch
	mov bh, 0
	mov al, 0Eh
	int 10h           
	
	jmp mouse_loop


exit_program:
	mov ah, 00h
	mov al, 03h       
	int 10h
	int 20h