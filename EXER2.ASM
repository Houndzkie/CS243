.model small
.code
.stack 100
start:

    mov ah, 02h

    mov dl, 'A'
    int 21h
    
    mov dl, 'B'
    int 21h
    
    mov dl, 'C'
    int 21h
    
    mov dl, 'D'
    int 21h
    
    mov dl, 'E'
    int 21h
    
    mov dl, 'F'
    int 21h
    
    mov dl, 'G'
    int 21h
    
    mov dl, 'H'
    int 21h
    
    mov dl, 'I'
    int 21h
    
    mov dl, 'J'
    int 21h
    
    mov dl, 'K'
    int 21h
    
    mov dl, 'L'
    int 21h
    
    mov dl, 'M'
    int 21h

    mov dl, 'N'
    int 21h
    
    mov dl, 'O'
    int 21h
    
    mov dl, 'P'
    int 21h
    
    mov dl, 'Q'
    int 21h
    
    mov dl, 'R'
    int 21h
    
    mov dl, 'S'
    int 21h
    
    mov dl, 'T'
    int 21h
    
    mov dl, 'U'
    int 21h
    
    mov dl, 'V'
    int 21h
    
    mov dl, 'W'
    int 21h
    
    mov dl, 'X'
    int 21h
    
    mov dl, 'Y'
    int 21h

    mov dl, 'Z'
    int 21h

int 27h
end start
