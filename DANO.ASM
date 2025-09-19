; Filename: EXER28.ASM
; Programmer Name: Helge Justine O. Dano
; Date: September 19, 2025
; Description: Fishbook Account Registration
 
.model small
.stack 100h
.data
    ; title and prompts
    titles        db 'FISHBOOK ACCOUNT REGISTRATION',0ah,'$'
    enterName     db 13,10,'Enter Full Name: $'
    enterBirthday db 13,10,'Enter Birthday: $'
    enterGender   db 13,10,'Enter Gender: $'
    enterEmail    db 13,10,'Enter Email Address: $'
    enterPassword db 13,10,'Enter Password: $'

    ; inputs
    names    db 100,?,100 DUP('$')
    birthday db 100,?,100 DUP('$')
    gender   db 100,?,100 DUP('$')
    email    db 100,?,100 DUP('$')
    pass     db 100,?,100 DUP('$')
; ask for Password
    ; display
    review       db 13,10,10,'Please review account registration details below:',10,'$'
    top          db 13,   218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,194,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191,10,'$'
    mid          db 13,10,   198,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,197,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,179,10,'$'
    bot          db 13,10,   212,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,193,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,190,10,'$'
    showName     db          179,' Full Name:      ',179, ' $'
    showBirthday db          179,' Birthday:       ',179, ' $'
    showGender   db          179,' Gender:         ',179, ' $'
    showEmail    db          179,' Email Address:  ',179, ' $'
    showPassword db          179,' Password:       ',179, ' $'
;                            '|─────────────────|─────────────────────────────────|$'
    ; buttons
    submit db 'SUBMIT$'
    cancel db 'CANCEL$'
    edit   db 'EDIT$'

.code
main: 
    mov ax, @data
    mov ds, ax

    mov ax, 3
    int 10h

    ; display title
    mov ah, 9
    lea dx, titles
    int 21h

    ; ask for Full Name
    mov ah, 9
    lea dx, enterName
    int 21h
    mov ah, 0Ah
    lea dx, names
    int 21h

    ; ask for Birthday
    mov ah, 9
    lea dx, enterBirthday
    int 21h
    mov ah, 0Ah
    lea dx, birthday
    int 21h

    ; ask for Gender
    mov ah, 9
    lea dx, enterGender
    int 21h
    mov ah, 0Ah
    lea dx, gender
    int 21h

    ; ask for Email Address
    mov ah, 9
    lea dx, enterEmail
    int 21h
    mov ah, 0Ah
    lea dx, email
    int 21h

    ; ask for Password
    mov ah, 9
    lea dx, enterPassword
    int 21h
    mov ah, 0Ah
    lea dx, pass
    int 21h

    ; show display
    mov ah, 9
    lea dx, review
    int 21h
     mov ah, 09h
    mov bl, 1fh ; print color
    mov cx, 79
    int 10h
    mov ah, 9
    lea dx, top
    int 21h

    ; show name
    mov ah, 09h
    mov bl, 1fh ; print color
    mov cx, 79
    int 10h

    mov ah, 9
    lea dx, showName
    int 21h
    lea dx, names
    call PrintInput
     mov ah, 09h
    mov bl, 1fh ; print color
    mov cx, 79
    int 10h
    mov ah, 9
    lea dx, mid
    int 21h

    ; show birthday
     mov ah, 09h
    mov bl, 1fh ; print color
    mov cx, 79
    int 10h

    mov ah, 9
    lea dx, showBirthday
    int 21h
    lea dx, birthday
    call PrintInput
     mov ah, 09h
    mov bl, 1fh ; print color
    mov cx, 79
    int 10h
    mov ah, 9
    lea dx, mid
    int 21h

    ; show gender
     mov ah, 09h
    mov bl, 1fh ; print color
    mov cx, 79
    int 10h

    mov ah, 9
    lea dx, showGender
    int 21h
    lea dx, gender
    call PrintInput
     mov ah, 09h
    mov bl, 1fh ; print color
    mov cx, 79
    int 10h
    mov ah, 9
    lea dx, mid
    int 21h

    ; show email
     mov ah, 09h
    mov bl, 1fh ; print color
    mov cx, 79
    int 10h

    mov ah, 9
    lea dx, showEmail
    int 21h
    lea dx, email
    call PrintInput
     mov ah, 09h
    mov bl, 1fh ; print color
    mov cx, 79
    int 10h
    mov ah, 9
    lea dx, mid
    int 21h

    ; show password
     mov ah, 09h
    mov bl, 1fh ; print color
    mov cx, 79
    int 10h

    mov ah, 9
    lea dx, showPassword
    int 21h
    lea dx, pass
    call PrintInput
     mov ah, 09h
    mov bl, 1fh ; print color
    mov cx, 79
    int 10h
    mov ah, 9
    lea dx, bot
    int 21h
    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; -----------------------------
    ; show buttons (centered below)
    ; -----------------------------
    ; move cursor to row (adjust dh) and column (dl) before printing

    mov ah, 02H
    mov cl, 0Ah
    mov dl, cl
    int 21h
    ; SUBMIT
     mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 79
    int 10h
    mov ah, 2
    mov bh, 0
    mov dh, 20       ; row number (adjust as needed)
    mov dl, 5        ; column position
    int 10h
     mov ah, 09h
    mov bl, 4fh ; print color
    mov cx, 6
    int 10h
    mov ah, 9
    lea dx, submit
    int 21h

    ; CANCEL
    mov ah, 2
    mov bh, 0
    mov dh, 20
    mov dl, 20       ; move further right
    int 10h
    mov ah, 09h
    mov bl, 4fh ; print color
    mov cx, 6
    int 10h
    mov ah, 9
    lea dx, cancel
    int 21h

    ; EDIT
    mov ah, 2
    mov bh, 0
    mov dh, 20
    mov dl, 35       ; move even further right
    int 10h
    mov ah, 09h
    mov bl, 4fh ; print color
    mov cx, 4
    int 10h
    mov ah, 9
    lea dx, edit
    int 21h

    ; exit program
    mov ah, 4Ch
    int 21h

;------------------------------------------------
; PrintInput: display contents of DOS input buffer
; DS:DX points to buffer
;------------------------------------------------
PrintInput PROC
    push ax
    push bx
    push cx
    push dx

    mov si, dx          ; SI -> buffer
    mov cl, [si+1]      ; CL = number of chars typed
    jcxz DonePrint      ; if empty, skip

    mov bx, si
    add bx, 2           ; BX -> first input char

PrintLoop:
    mov dl, [bx]
    mov ah, 2
    int 21h
    inc bx
    loop PrintLoop

DonePrint:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
PrintInput ENDP

end main
