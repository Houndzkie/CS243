; Filename: EXER9.ASM
; Display emojis and blinking characters (blinking red heart)
; Name: Helge Justine O. Dano
; Date: August 22, 2025

.model small
.code
.stack 100
start:

     mov ah, 09h
    mov bl, 0Eh ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, 'I'
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 84h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl,  03h
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 0Eh ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, 'U'
    mov dl, cl
    int 21h

int 27h
end start