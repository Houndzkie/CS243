; Filename: EXER25.ASM
; Programmer Name: Helge Justine O. Dano
; Date: September 14, 2025
; Description: Create a College Enrollment Form. Get user input. Display a summary of the inputs. Inclue the necesary documentation as comments in your code.

.MODEL small
.STACK 100h
.DATA
; -----------------------------
; HEADER MESSAGES
; -----------------------------
    SchoolName   DB 13,10,'Cebu Institute of Technology - University$'
    FormTitle    DB 13,10,'STUDENT ENROLLMENT FORM$'
    InfoMsg      DB 13,10,13,10,'Please enter the following information:$'

; -----------------------------
; PROMPTS
; -----------------------------
    MsgID        DB 13,10,'Student ID Number: $'
    MsgFName     DB 13,10,'First Name: $'
    MsgMName     DB 13,10,'Middle Name: $'
    MsgLName     DB 13,10,'Last Name: $'
    MsgAddress   DB 13,10,'Address: $'
    MsgCourse    DB 13,10,'Course: $'
    MsgYear      DB 13,10,'Year: $'
    MsgBMonth    DB 13,10,'Birthday Month: $'
    MsgBDay      DB 13,10,'Birthday Day: $'
    MsgBYear     DB 13,10,'Birthday Year: $'
    MsgEmail     DB 13,10,'Email Address: $'

; -----------------------------
; BUFFERS for user input
; Format for fn 0Ah: [max][len][data...]
; -----------------------------
    IDNum        DB 20,0,20 DUP('$')
    FirstName    DB 30,0,30 DUP('$')
    MiddleName   DB 30,0,30 DUP('$')
    LastName     DB 30,0,30 DUP('$')
    Address      DB 80,0,80 DUP('$')
    Course       DB 10,0,10 DUP('$')
    Year         DB 5,0,5 DUP('$')
    BMonth       DB 15,0,15 DUP('$')
    BDay         DB 5,0,5 DUP('$')
    BYear        DB 6,0,6 DUP('$')
    Email        DB 40,0,40 DUP('$')

; -----------------------------
; SUMMARY MESSAGES
; -----------------------------
    SummaryTitle DB 13,10,13,10,'SUMMARY',13,10,'Please check if all pieces of information are correct.',13,10,'$'
    MsgIDOut     DB 13,10,'ID Number: $'
    MsgNameOut   DB 13,10,'Full Name: $'
    MsgAddrOut   DB 13,10,'Address: $'
    MsgCYOut     DB 13,10,'Course & Year: $'
    MsgBdayOut   DB 13,10,'Birthday: $'
    MsgEmailOut  DB 13,10,'Email Address: $'
    ThankYou     DB 13,10,13,10,'Thank you for enrolling at CIT-U.$'
    CopyRight    DB 13,10,'Copyright 2025',13,10,'Programmer: Helge Justine O. Dano$'

; -----------------------------
; GENERAL STRINGS
; -----------------------------
    CommaSpace   DB ', $'
    Space        DB ' $'

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

    mov dx,OFFSET FormTitle
    mov ah,9
    int 21h

    mov dx,OFFSET InfoMsg
    mov ah,9
    int 21h

; -----------------------------
; GET USER INPUTS
; -----------------------------
    ; ID
    mov dx,OFFSET MsgID
    mov ah,9
    int 21h
    mov dx,OFFSET IDNum
    mov ah,0Ah
    int 21h

    ; First Name
    mov dx,OFFSET MsgFName
    mov ah,9
    int 21h
    mov dx,OFFSET FirstName
    mov ah,0Ah
    int 21h

    ; Middle Name
    mov dx,OFFSET MsgMName
    mov ah,9
    int 21h
    mov dx,OFFSET MiddleName
    mov ah,0Ah
    int 21h

    ; Last Name
    mov dx,OFFSET MsgLName
    mov ah,9
    int 21h
    mov dx,OFFSET LastName
    mov ah,0Ah
    int 21h

    ; Address
    mov dx,OFFSET MsgAddress
    mov ah,9
    int 21h
    mov dx,OFFSET Address
    mov ah,0Ah
    int 21h

    ; Course
    mov dx,OFFSET MsgCourse
    mov ah,9
    int 21h
    mov dx,OFFSET Course
    mov ah,0Ah
    int 21h

    ; Year
    mov dx,OFFSET MsgYear
    mov ah,9
    int 21h
    mov dx,OFFSET Year
    mov ah,0Ah
    int 21h

    ; Birthday Month
    mov dx,OFFSET MsgBMonth
    mov ah,9
    int 21h
    mov dx,OFFSET BMonth
    mov ah,0Ah
    int 21h

    ; Birthday Day
    mov dx,OFFSET MsgBDay
    mov ah,9
    int 21h
    mov dx,OFFSET BDay
    mov ah,0Ah
    int 21h

    ; Birthday Year
    mov dx,OFFSET MsgBYear
    mov ah,9
    int 21h
    mov dx,OFFSET BYear
    mov ah,0Ah
    int 21h

    ; Email
    mov dx,OFFSET MsgEmail
    mov ah,9
    int 21h
    mov dx,OFFSET Email
    mov ah,0Ah
    int 21h

; -----------------------------
; PRINT SUMMARY
; -----------------------------
    mov dx,OFFSET SummaryTitle
    mov ah,9
    int 21h

    ; Print ID
    mov dx,OFFSET MsgIDOut
    mov ah,9
    int 21h
    mov si,OFFSET IDNum+2
    call PrintString

    ; Print Full Name: Last, First Middle
    mov dx,OFFSET MsgNameOut
    mov ah,9
    int 21h

    mov si,OFFSET LastName+2
    call PrintString
    mov dx,OFFSET CommaSpace
    mov ah,9
    int 21h

    mov si,OFFSET FirstName+2
    call PrintString
    mov dx,OFFSET Space
    mov ah,9
    int 21h

    mov si,OFFSET MiddleName+2
    call PrintString

    ; Address
    mov dx,OFFSET MsgAddrOut
    mov ah,9
    int 21h
    mov si,OFFSET Address+2
    call PrintString

    ; Course & Year
    mov dx,OFFSET MsgCYOut
    mov ah,9
    int 21h
    mov si,OFFSET Course+2
    call PrintString
    mov dx,OFFSET Space
    mov ah,9
    int 21h
    mov si,OFFSET Year+2
    call PrintString

    ; Birthday
    mov dx,OFFSET MsgBdayOut
    mov ah,9
    int 21h
    mov si,OFFSET BMonth+2
    call PrintString
    mov dx,OFFSET Space
    mov ah,9
    int 21h
    mov si,OFFSET BDay+2
    call PrintString
    mov dx,OFFSET CommaSpace
    mov ah,9
    int 21h
    mov si,OFFSET BYear+2
    call PrintString

    ; Email
    mov dx,OFFSET MsgEmailOut
    mov ah,9
    int 21h
    mov si,OFFSET Email+2
    call PrintString

    ; Thank You + Copyright
    mov dx,OFFSET ThankYou
    mov ah,9
    int 21h
    mov dx,OFFSET CopyRight
    mov ah,9
    int 21h

; -----------------------------
; EXIT PROGRAM
; -----------------------------
    mov ah,4Ch
    int 21h

; -----------------------------
; SUBROUTINE: PrintString
;   Prints string stored with DOS fn 0Ah
;   DS:SI -> first char, [SI-1] = length
; -----------------------------
PrintString PROC
    push ax
    push cx
    push dx

    mov cl,[si-1]     ; length
    jcxz ps_done
ps_loop:
    lodsb             ; AL = [SI], SI++
    mov dl,al
    mov ah,2
    int 21h
    loop ps_loop

ps_done:
    pop dx
    pop cx
    pop ax
    ret
PrintString ENDP

END ProgramStart
