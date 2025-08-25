; Filename: EXER8.ASM
; Display colored patterns (big cross) using just spaces
; Name: Helge Justine O. Dano
; Date: August 22, 2025

.model small
.code
.stack 100
start:
    ; line

    mov ah, 09h
    mov bl, 11h ; print color
    mov cx, 8
    int 10h

     mov ah, 02h;
    mov cl, 0Ah
    mov dl, cl
    int 21h

     ; line

    mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 44h ; print color
    mov cx, 2
    int 10h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 100
    int 10h
    
     mov ah, 02h;
    mov cl, 0Ah
    mov dl, cl
    int 21h
 ; line

    mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 44h ; print color
    mov cx, 6
    int 10h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h


     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 100
    int 10h
    
     mov ah, 02h;
    mov cl, 0Ah
    mov dl, cl
    int 21h

 ; line

    mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 44h ; print color
    mov cx, 2
    int 10h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 100
    int 10h
    
     mov ah, 02h;
    mov cl, 0Ah
    mov dl, cl
    int 21h

 ; line

    mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h;
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 100
    int 10h


int 27h
end start
