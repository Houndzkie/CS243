; Filename: EXER23.ASM
; Programmer Name: Helge Justine O. Dano
; Date: September 14, 2025
; Description: Create a program that asks the user to input a character. Determine if character is letter A and display mesage "Yes, ayou have entered letter A." If not, display "No, you have not entered letter A. You entered character _."

.MODEL small
.STACK 100h
.DATA
    Prompt DB 'Enter a character: $'
    inputChar db ?
    YesMsg DB 13,10,'Yes, you have entered letter A.',13,10,'$'
    NoMsg  DB 13,10,'No, you have not entered letter A. You entered character $'

.CODE
ProgramStart:
    mov ax,@data
    mov ds,ax             ; set DS to point to data segment

    mov dx,OFFSET Prompt  ; point to the prompt
    mov ah,9              ; DOS print string function
    int 21h               ; display prompt

    ; read a character from the keyboard
    mov ah,01h            ; function to read a character
    int 21h
    mov inputChar,al      ; store the character in inputChar

    cmp al,'A'
    jz isYes
    jmp isNo              ; if not A, go to No

isYes:
    mov dx,OFFSET YesMsg  ; load Yes string
    mov ah,09h
    int 21h
    jmp Done              ; skip No part

isNo:
    mov dx,OFFSET NoMsg   ; load No string
    mov ah,09h
    int 21h

    ; print the character the user entered
    mov dl,inputChar
    mov ah,02h
    int 21h

    ; print a period
    mov dl,'.'
    mov ah,02h
    int 21h

Done:
    mov ah,4Ch            ; DOS terminate program
    int 21h
END ProgramStart
