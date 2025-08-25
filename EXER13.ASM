; Filename: EXER13.ASM
; Display August 2025 Calendar using ASCII characters
; Name: Helge Justine O. Dano
; Date: August 25, 2025

.model small
.data
    month db '                AUGUST 2025                ', 0Ah, '$'
    line  db '-------------------------------------------', 0Ah, '$'
    days  db '| SUN | MON | TUE | WED | THU | FRI | SAT |', 0Ah, '$'
    yes db '| $'
    week1 db '|     |     |     |     |     |  1  |  ', '$'
    week2 db     '  |  4  |  5  |  6  |  7  |  8  |  ', '$'
    week3 db     '  | 11  | 12  | 13  | 14  | 15  | ', '$'
    week4 db     '  | 18  | 19  | 20  | 21  | 22  | ', '$'
    week5 db     '  | 25  | 26  | 27  | 28  | 29  | ', '$'
    week6 db     '  |     |     |     |     |     |     |', 0Ah, '$'

.code
.startup

main1:
    mov ax,@data ; import data
    mov ds, ax

    mov ah,09h ; scanner

    mov dx, offset month ; print text
    int 21h

    mov dx, offset line ; print text
    int 21h

    mov dx, offset days ; print text
    int 21h

    mov dx, offset line ; print text
    int 21h

    mov dx, offset week1 ; print text
    int 21h

    mov ah, 09h
    mov bl, 01h ; print color
    mov cx, 1
    int 10h
    
     mov ah, 02h
    mov cl, '2'
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
    mov cl, '|'
    mov dl, cl
    int 21h
    
     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    mov ah,09h ; scanner

    mov dx, offset line ; print text
    int 21h
    
    mov dx, offset yes ; print text
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 04h ; print color
    mov cx, 1
    int 10h
    
    mov ah, 02h
    mov cl, '3'
    mov dl, cl
    int 21h

    mov ah,09h ; scanner

    mov dx, offset week2 ; print text
    int 21h

      mov ah, 09h
    mov bl, 01h ; print color
    mov cx, 1
    int 10h
    
     mov ah, 02h
    mov cl, '9'
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
    mov cl, '|'
    mov dl, cl
    int 21h
    
     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    mov ah,09h ; scanner

    mov dx, offset line ; print text
    int 21h

    mov dx, offset yes ; print text
    int 21h

    mov ah, 09h
    mov bl, 04h ; print color
    mov cx, 2
    int 10h
    
    mov ah, 02h
    mov cl, '1'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, '0'
    mov dl, cl
    int 21h

    mov ah,09h ; scanner

    mov dx, offset week3 ; print text
    int 21h

      mov ah, 09h
    mov bl, 01h ; print color
    mov cx, 2
    int 10h
    
     mov ah, 02h
    mov cl, '1'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, '6'
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
    mov cl, '|'
    mov dl, cl
    int 21h
    
     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    mov ah,09h ; scanner

    mov dx, offset line ; print text
    int 21h

    mov dx, offset yes ; print text
    int 21h

      mov ah, 09h
    mov bl, 04h ; print color
    mov cx, 2
    int 10h
    
    mov ah, 02h
    mov cl, '1'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, '7'
    mov dl, cl
    int 21h

    mov ah,09h ; scanner

    mov dx, offset week4 ; print text
    int 21h

      mov ah, 09h
    mov bl, 01h ; print color
    mov cx, 2
    int 10h
    
     mov ah, 02h
    mov cl, '2'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, '3'
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
    mov cl, '|'
    mov dl, cl
    int 21h
    
     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    mov ah,09h ; scanner

    mov dx, offset line ; print text
    int 21h

    mov dx, offset yes ; print text
    int 21h

      mov ah, 09h
    mov bl, 04h ; print color
    mov cx, 2
    int 10h
    
    mov ah, 02h
    mov cl, '2'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, '4'
    mov dl, cl
    int 21h

    mov ah,09h ; scanner

    mov dx, offset week5 ; print text
    int 21h

      mov ah, 09h
    mov bl, 01h ; print color
    mov cx, 2
    int 10h
    
     mov ah, 02h
    mov cl, '3'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, '0'
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
    mov cl, '|'
    mov dl, cl
    int 21h
    
     mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    mov ah,09h ; scanner

    mov dx, offset line ; print text
    int 21h

    mov dx, offset yes ; print text
    int 21h

      mov ah, 09h
    mov bl, 04h ; print color
    mov cx, 2
    int 10h
    
    mov ah, 02h
    mov cl, '3'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, '1'
    mov dl, cl
    int 21h

    mov ah,09h ; scanner

    mov dx, offset week6 ; print text
    int 21h

    mov dx, offset line ; print text
    int 21h

int 27h
end main1