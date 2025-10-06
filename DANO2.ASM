; Filename: DANO2.ASM
; Programmer Name: Helge Justine O. Dano
; Date: September 26, 2025
; Description: Fishbook Account Registration with Background Color
 
.model small
.stack 100h
.data
    ; title and prompts
    titles        db 'FISHBOOK ACCOUNT REGISTRATION','$'
    enterName     db 13,10,'Enter Full Name: $'
    enterBirthday db 13,10,'Enter Birthday: $'
    enterGender   db 13,10,'Enter Gender: $'
    enterEmail    db 13,10,'Enter Email Address: $'
    enterPassword db 13,10,'Enter Password: $'

    ; inputs
    names    db 100,?,100 DUP(' ')
    birthday db 100,?,100 DUP(' ')
    gender   db 100,?,100 DUP(' ')
    email    db 100,?,100 DUP(' ')
    pass     db 100,?,100 DUP(' ')
    color    db 100,?,100 DUP(' ')

    ; ask for background color
    prompt db "How do you like to display the summary table?",10,"1 - blue background",10,"2 - red background",10,"Enter your choice: $"
    invalid db 13,10,10,"INVALID INPUT!$"

    ; ask for Password
    ; display
    review       db 13,10,'Please review account registration details below:',10,'$'
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
    btnRow db ?

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

    ; ask for background color
    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h
    mov ah, 9
    lea dx, prompt
    int 21h
    mov ah, 0Ah
    lea dx, color
    int 21h

    ; ----------------------------
    ; Decide based on color choice
    ; ----------------------------
    mov al, [color+2]    ; first char of input

    cmp al, '1'
    je BlueTable
    cmp al, '2'
    je RedTable
    jmp InvalidChoice

BlueTable:
    mov bl, 1Fh          ; blue background, white text
    jmp ShowTable

RedTable:
    mov bl, 4Fh          ; red background, white text
    jmp ShowTable

InvalidChoice:
    mov ah, 9
    lea dx, invalid
    int 21h

    mov byte ptr [btnRow], 13   ; put buttons just below the invalid text
    jmp ShowButtons

ShowTable:
  ; show display
    mov ah, 9
    lea dx, review
    int 21h
     mov ah, 09h
  mov ah, 09h
mov cx, 79
int 10h
    mov ah, 9
    lea dx, top
    int 21h

    ; show name
    mov ah, 09h
    mov ah, 09h
mov cx, 79
int 10h

    mov ah, 9
    lea dx, showName
    int 21h
    lea dx, names
    call PrintInput
     mov ah, 09h
  mov ah, 09h
mov cx, 79
int 10h
    mov ah, 9
    lea dx, mid
    int 21h

    ; show birthday
     mov ah, 09h
  mov ah, 09h
mov cx, 79
int 10h

    mov ah, 9
    lea dx, showBirthday
    int 21h
    lea dx, birthday
    call PrintInput
     mov ah, 09h
  mov ah, 09h
mov cx, 79
int 10h
    mov ah, 9
    lea dx, mid
    int 21h

    ; show gender
     mov ah, 09h
    mov ah, 09h
mov cx, 79
int 10h

    mov ah, 9
    lea dx, showGender
    int 21h
    lea dx, gender
    call PrintInput
     mov ah, 09h
  mov ah, 09h
mov cx, 79
int 10h
    mov ah, 9
    lea dx, mid
    int 21h

    ; show email
     mov ah, 09h
  mov ah, 09h
mov cx, 79
int 10h

    mov ah, 9
    lea dx, showEmail
    int 21h
    lea dx, email
    call PrintInput
     mov ah, 09h
    mov ah, 09h
mov cx, 79
int 10h
    mov ah, 9
    lea dx, mid
    int 21h

    ; show password
     mov ah, 09h
    mov ah, 09h
mov cx, 79
int 10h

    mov ah, 9
    lea dx, showPassword
    int 21h
    lea dx, pass
    call PrintInput
     mov ah, 09h
    mov ah, 09h
mov cx, 79
int 10h
    mov ah, 9
    lea dx, bot
    int 21h

    mov byte ptr [btnRow], 23   ; put buttons just below the invalid text
    jmp ShowButtons

ShowButtons:
    ; -----------------------------
    ; show buttons (centered below)
    ; -----------------------------
    ; move cursor to row (adjust dh) and column (dl) before printing
    mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 79
    int 10h
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
    mov dh, [btnRow]       ; row number (adjust as needed)
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
    mov dh, [btnRow]
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
    mov dh, [btnRow]
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
