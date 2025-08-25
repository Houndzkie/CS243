; Filename: EXER10.ASM
; Display a duck with blinking eyes
; Name: Helge Justine O. Dano
; Date: August 24, 2025

.model small
.code
.stack 100
start:
    ; line 1

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 14
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

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 22h ; print color
    mov cx, 4
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


     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 22h ; print color
    mov cx, 6
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

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 66h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 22h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 84h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, 03h
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 22h ; print color
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

 ; line 5

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 66h ; print color
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
    mov bl, 22h ; print color
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

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    
     mov ah, 09h
    mov bl, 66h ; print color
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
    mov bl, 22h ; print color
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

    ; line 7

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
    mov bl, 22h ; print color
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
    mov bl, 77h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    
     mov ah, 09h
    mov bl, 22h ; print color
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
    mov bl, 77h ; print color
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    
     mov ah, 09h
    mov bl, 22h ; print color
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

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 22h ; print color
    mov cx, 8
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
    mov cx, 1
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 22h ; print color
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

    ; line 9

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 22h ; print color
    mov cx, 4
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
    mov cx, 4
    int 10h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 22h ; print color
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
    mov bl, 22h ; print color
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
    mov bl, 22h ; print color
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
    mov bl, 22h ; print color
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

     mov ah, 09h
    mov bl, 22h ; print color
    mov cx,11
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

    ; line 12

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
    mov bl, 22h ; print color
    mov cx, 9
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

    ; line 13

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
    mov bl, 22h ; print color
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