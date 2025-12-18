org 100h

start:
    mov ah, 09h
    lea dx, msg1        
    int 21h

    mov ah, 0Ah
    lea dx, num1
    int 21h

    mov ah, 09h
    lea dx, msg2
    int 21h

    mov ah, 0Ah
    lea dx, num2
    int 21h

    mov ah, 09h
    lea dx, msg3
    int 21h

    lea si, num1 + 6    
    lea di, num2 + 6    
    
    lea bx, sum + 5  
 
    
    mov cx, 5           
    mov dh, 0          

calc_loop:
    mov al, [si]       
    mov ah, [di]        

    sub al, 30h        
    sub ah, 30h        

    add al, ah         
    add al, dh  
    
    mov dh, 0           

    cmp al, 10          
    jl  store_digit     
    
    sub al, 10          
    mov dh, 1          

store_digit:
    add al, 30h         
    mov [bx], al    
    
    dec si              
    dec di
    dec bx
    loop calc_loop      

    cmp dh, 1
    jne print_it
    mov byte [bx], '1' 

print_it:
    mov ah, 09h
    lea dx, sum         
    int 21h

    int 20h            

msg1 db 0Dh, 0Ah, 'Enter 1st num (5 digits): $'
msg2 db 0Dh, 0Ah, 'Enter 2nd num (5 digits): $'
msg3 db 0Dh, 0Ah, 'Sum: $'


num1 db 6, 0, 6 dup(0)
num2 db 6, 0, 6 dup(0)
sum  db ' ', ' ', ' ', ' ', ' ', ' ', 0Dh, 0Ah, '$'