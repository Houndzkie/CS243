; Filename: EXER26.ASM
; Programmer Name: Helge Justine O. Dano
; Date: September 14, 2025
; Description: Create an Automated Teller Machine (ATM) main menu screen. Ask the user to input a number corresponding to an item in the main menu. Print back the number input by user and the correspoding transaction.

.MODEL small
.STACK 100h
.DATA
; -----------------------------
; HEADER MESSAGES
; -----------------------------
    SchoolName DB 13,10,'Cebu Institute of Technology - University$'
    ATMTitle   DB 13,10,'Automated Teller Machine$'

; -----------------------------
; MAIN MENU
; -----------------------------
    MenuTitle  DB 13,10,13,10,'Main Menu$'
    Menu1      DB 13,10,'1 Balance Inquiry$'
    Menu2      DB 13,10,'2 Withdrawal$'
    Menu3      DB 13,10,'3 Deposit$'
    Menu4      DB 13,10,'4 Transfer$'
    Menu5      DB 13,10,'5 Bills Payment$'
    Menu6      DB 13,10,'6 Change Pin$'
    Menu7      DB 13,10,'7 Exit$'
    Prompt     DB 13,10,'Enter number of your choice: $'

; -----------------------------
; TRANSACTION RESPONSES
; -----------------------------
    ChosenMsg  DB 13,10,13,10,'You have chosen $'
    Trans1     DB ' Balance Inquiry.$'
    Trans2     DB ' Withdrawal.$'
    Trans3     DB ' Deposit.$'
    Trans4     DB ' Transfer.$'
    Trans5     DB ' Bills Payment.$'
    Trans6     DB ' Change Pin.$'
    Trans7     DB ' Exit.$'

; -----------------------------
; FOOTER
; -----------------------------
    ThanksMsg  DB 13,10,13,10,'Thank you for banking with us!$'
    CopyRight  DB 13,10,'Copyright 2025',13,10,'Programmer: Helge Justine O. Dano$'

; -----------------------------
; INPUT STORAGE
; -----------------------------
    UserChoice DB ?

.CODE
ProgramStart:
    mov ax,@data
    mov ds,ax

; -----------------------------
; PRINT HEADER
; -----------------------------
    mov dx,OFFSET SchoolName
    mov ah,9
    int 21h

    mov dx,OFFSET ATMTitle
    mov ah,9
    int 21h

; -----------------------------
; PRINT MENU
; -----------------------------
    mov dx,OFFSET MenuTitle
    mov ah,9
    int 21h

    mov dx,OFFSET Menu1
    mov ah,9
    int 21h

    mov dx,OFFSET Menu2
    mov ah,9
    int 21h

    mov dx,OFFSET Menu3
    mov ah,9
    int 21h

    mov dx,OFFSET Menu4
    mov ah,9
    int 21h

    mov dx,OFFSET Menu5
    mov ah,9
    int 21h

    mov dx,OFFSET Menu6
    mov ah,9
    int 21h

    mov dx,OFFSET Menu7
    mov ah,9
    int 21h

; -----------------------------
; GET USER INPUT
; -----------------------------
    mov dx,OFFSET Prompt
    mov ah,9
    int 21h

    mov ah,1         ; read character
    int 21h
    mov UserChoice,al

; -----------------------------
; PRINT CHOSEN TRANSACTION
; -----------------------------
    mov dx,OFFSET ChosenMsg
    mov ah,9
    int 21h

    mov dl,UserChoice  ; print the number typed
    mov ah,2
    int 21h

    cmp UserChoice,'1'
    je TransOption1
    cmp UserChoice,'2'
    je TransOption2
    cmp UserChoice,'3'
    je TransOption3
    cmp UserChoice,'4'
    je TransOption4
    cmp UserChoice,'5'
    je TransOption5
    cmp UserChoice,'6'
    je TransOption6
    cmp UserChoice,'7'
    je TransOption7
    jmp Done

TransOption1:
    mov dx,OFFSET Trans1
    mov ah,9
    int 21h
    jmp Footer

TransOption2:
    mov dx,OFFSET Trans2
    mov ah,9
    int 21h
    jmp Footer

TransOption3:
    mov dx,OFFSET Trans3
    mov ah,9
    int 21h
    jmp Footer

TransOption4:
    mov dx,OFFSET Trans4
    mov ah,9
    int 21h
    jmp Footer

TransOption5:
    mov dx,OFFSET Trans5
    mov ah,9
    int 21h
    jmp Footer

TransOption6:
    mov dx,OFFSET Trans6
    mov ah,9
    int 21h
    jmp Footer

TransOption7:
    mov dx,OFFSET Trans7
    mov ah,9
    int 21h
    jmp Footer

; -----------------------------
; FOOTER
; -----------------------------
Footer:
    mov dx,OFFSET ThanksMsg
    mov ah,9
    int 21h

    mov dx,OFFSET CopyRight
    mov ah,9
    int 21h

; -----------------------------
; EXIT PROGRAM
; -----------------------------
Done:
    mov ah,4Ch
    int 21h

END ProgramStart