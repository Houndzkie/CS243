.model small
.code
.stack 100
start:

    mov ah, 02h

    mov dl, '1'
    int 21h
    
    mov dl, ' '
    int 21h
    
    mov dl, '2'
    int 21h
    
    mov dl, ' '
    int 21h
    
    mov dl, '3'
    int 21h
    
    mov dl, ' '
    int 21h
    
    mov dl, '4'
    int 21h
    
    mov dl, ' '
    int 21h
    
    mov dl, '5'
    int 21h
    
    mov dl, ' '
    int 21h
    
    mov dl, '6'
    int 21h
    
    mov dl, ' '
    int 21h
    
    mov dl, '7'
    int 21h
    
    mov dl, ' '
    int 21h

    
    mov dl, '8'
    int 21h
    
    mov dl,  ' '
    int 21h
    
    mov dl, '9'
    int 21h
    
    mov dl, ' '
    int 21h
    
    mov dl, '1'
    int 21h
    
    mov dl, '0'
    int 21h

int 27h
end start 