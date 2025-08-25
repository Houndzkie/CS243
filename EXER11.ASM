; Filename: EXER11.ASM
; Multi-colored charcter in the internet
; Name: Helge Justine O. Dano
; Date: August 25, 2025

.model small
.code
.stack 100
start:
    ; line 1

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 11
    int 10h

     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 2

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 5
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 100
    int 10h
    
     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 3

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 55h ; print color
    mov cx, 5
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 100
    int 10h
    
     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 4

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 55h ; print color
    mov cx, 7
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 100
    int 10h
    
     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 5

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 55h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 55h ; print color
    mov cx, 3
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 55h ; print color
    mov cx, 1
    int 10h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 100
    int 10h
    
     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 6

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 55h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 55h ; print color
    mov cx, 3
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 55h ; print color
    mov cx, 1
    int 10h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 100
    int 10h
    
     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 7

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 55h ; print color
    mov cx, 7
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 100
    int 10h
    
     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 8

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 55h ; print color
    mov cx, 5
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 100
    int 10h
    
     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 9

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 55h ; print color
    mov cx, 2
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 55h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 55h ; print color
    mov cx, 2
    int 10h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 100
    int 10h
    
     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 10

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 2
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h
    
     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 2
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 100
    int 10h
    
     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 11

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 100
    int 10h

int 27h
end start