; Filename: EXER24.ASM
; Programmer Name: Helge Justine O. Dano
; Date: September 14, 2025
; Description: Create a program that asks for your first name, middle name, and family name. Then display "Hello, FIRST NAME MIDDLE NAME FAMILY NAME!".

.MODEL small
.STACK 100h
.DATA
    ; Prompt messages
    TitleMsg    DB 13,10,'REGISTRATION FORM$'
    FirstMsg    DB 13,10,'Enter First Name: $'
    MiddleMsg   DB 13,10,'Enter Middle Name: $'
    LastMsg     DB 13,10,'Enter Last Name: $'

    ; Buffers for inputs (DOS fn 0Ah requires special format)
    FirstName   DB 30,0,30 DUP('$')
    MiddleName  DB 30,0,30 DUP('$')
    LastName    DB 30,0,30 DUP('$')

    ; Greeting message
    HelloMsg    DB 13,10,'Hello, $'
    ExclamMsg   DB '!$'

.CODE
ProgramStart:
    mov ax, @data
    mov ds, ax

    ; Print Title
    mov dx, OFFSET TitleMsg
    mov ah, 9
    int 21h

    ; ==== FIRST NAME ====
    mov dx, OFFSET FirstMsg
    mov ah, 9
    int 21h

    mov dx, OFFSET FirstName
    mov ah, 0Ah
    int 21h

    ; ==== MIDDLE NAME ====
    mov dx, OFFSET MiddleMsg
    mov ah, 9
    int 21h

    mov dx, OFFSET MiddleName
    mov ah, 0Ah
    int 21h

    ; ==== LAST NAME ====
    mov dx, OFFSET LastMsg
    mov ah, 9
    int 21h

    mov dx, OFFSET LastName
    mov ah, 0Ah
    int 21h

    ; ==== PRINT GREETING ====
    mov dx, OFFSET HelloMsg
    mov ah, 9
    int 21h

    ; Print First Name
    mov si, OFFSET FirstName+2
    call PrintString

    mov dl, ' '
    mov ah, 2
    int 21h

    ; Print Middle Name
    mov si, OFFSET MiddleName+2
    call PrintString

    mov dl, ' '
    mov ah, 2
    int 21h

    ; Print Last Name
    mov si, OFFSET LastName+2
    call PrintString

    ; Print !
    mov dx, OFFSET ExclamMsg
    mov ah, 9
    int 21h

    ; Exit
    mov ah,4Ch
    int 21h

; ========= SUBROUTINE =========
; PrintString: prints string stored by 0Ah input
; DS:SI points to first character
PrintString PROC
    push ax
    push cx
    push dx

    mov cl, [si-1] ; length byte from buffer
    jcxz ps_done   ; if length = 0, skip

ps_loop:
    lodsb          ; load char into AL
    mov dl, al
    mov ah, 2
    int 21h
    loop ps_loop

ps_done:
    pop dx
    pop cx
    pop ax
    ret
PrintString ENDP

END ProgramStart
