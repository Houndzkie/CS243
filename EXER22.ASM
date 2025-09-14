; Filename: EXER22.ASM
; Programmer Name: Helge Justine O. Dano
; Date: September 14, 2025
; Description: Create a program that asks the user to input 3 characters. Then display each character on its own line.

.MODEL small
.STACK 200h
.DATA
    inputChar1 db ?
    inputChar2 db ?
    inputChar3 db ?
    inputMsg1 db 'Enter first character: $'
    inputMsg2 db 'Enter second character: $'
    inputMsg3 db 'Enter third character: $'
    outputMsg1 db 'The first character is $'
    outputMsg2 db 'The second character is $'
    outputMsg3 db 'The third character is $'
.CODE
Main:
    ; initialize the data segment
    mov ax, @data
    mov ds, ax

    ; display the input prompt message
    mov dx,offset inputMsg1
    mov ah,09h
    int 21h

    ; read a character from the keyboard
    mov ah,01h ; function to read a character
    int 21h ; call DOS interrupt
    mov inputChar1,al ; store the character in inputChar

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; display the input prompt message
    mov dx,offset inputMsg2
    mov ah,09h
    int 21h

    ; read a character from the keyboard
    mov ah,01h ; function to read a character
    int 21h ; call DOS interrupt
    mov inputChar2,al ; store the character in inputChar

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; display the input prompt message
    mov dx,offset inputMsg3
    mov ah,09h
    int 21h

    ; read a character from the keyboard
    mov ah,01h ; function to read a character
    int 21h ; call DOS interrupt
    mov inputChar3,al ; store the character in inputChar

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; display the output message
    mov dx,offset outputMsg1
    mov ah,09h
    int 21h

    ; display the character back
    mov dl, inputChar1 ; load the character to DL
    mov ah,02h ; function to display a character
    int 21h ; call DOS interrupt

      mov ah, 02h
    mov cl, '.'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; display the output message
    mov dx,offset outputMsg2
    mov ah,09h
    int 21h

    ; display the character back
    mov dl, inputChar2 ; load the character to DL
    mov ah,02h ; function to display a character
    int 21h ; call DOS interrupt

      mov ah, 02h
    mov cl, '.'
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; display the output message
    mov dx,offset outputMsg3
    mov ah,09h
    int 21h

    ; display the character back
    mov dl, inputChar3 ; load the character to DL
    mov ah,02h ; function to display a character
    int 21h ; call DOS interrupt

      mov ah, 02h
    mov cl, '.'
    mov dl, cl
    int 21h

    ; exit program
    mov ax,4C00h ; function to exit program
    int 21h
END Main