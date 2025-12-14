; Filename: FINALEXAM_DANO.ASM
; CS243 Hands-on Final Exam
; First Semester SY 2025-2026
; Student Name: HELGE JUSTINE O. DANO
; Date Finished: December 12, 2025
.MODEL SMALL
.STACK 100h

.DATA
    ; =============================================================
    ;               MENU INTERFACE TEXT
    ; =============================================================
    textSchool      DB 'Cebu Institute of Technology - University',13,10
                    DB 'College of Computer Studies',13,10
                    DB 'FAVORITE CLASSMATE VOTING SYSTEM',13,10
                    DB 'Programmer: HELGE JUSTINE O. DANO',13,10,13,10
                    DB 'MAIN MENU',13,10
                    DB '1. $'

    menuLine2       DB 13,10,'2. $'
    menuLine3       DB 13,10,'3. $'
    menuLine4       DB 13,10,'4. $'
    menuLine5       DB 13,10,'5. Exit',13,10,13,10,'Enter choice: $'

    ; Strings for color highlighting
    keyVote         DB 'Vote',0
    keyView         DB 'View',0
    keyUpd          DB 'Update',0
    keyDel          DB 'Delete',0

    ; =============================================================
    ;               PROMPTS & MESSAGES
    ; =============================================================
    headerSys       DB 'Cebu Institute of Technology - University',13,10
                    DB 'College of Computer Studies',13,10
                    DB 'FAVORITE CLASSMATE VOTING SYSTEM',13,10
                    DB 'Programmer: HELGE JUSTINE O. DANO',13,10,13,10,'$'

    strCRLF         DB 13,10,'$'
    prmptName       DB 'Enter candidate name: $'
    prmptRate       DB 'Enter vote rating (1-100): $'
    
    ; ERROR MESSAGES
    errInvalidMsg   DB 13,10,'Invalid input! Rating must be 1-100.',13,10,'$'
    
    msgReturn       DB 13,10,13,10,'Press any key to go back to Main Menu...$'
    
    prmptUpdID      DB 'Enter record number to update: $'
    prmptNewNm      DB 'Enter new candidate name: $'
    prmptNewRt      DB 'Enter new vote rating (1-100): $'
    msgNoRecs       DB 'No records to update.',13,10,13,10,'Press any key to go back to Main Menu...$',0
    
    prmptDelID      DB 'Enter record number to delete: $'
    msgDelDone      DB 'Record deleted.',13,10,13,10,'Press any key to go back to Main Menu...$',0
    
    msgExit         DB 13,10,'Exiting...',13,10
                    DB 'Thank you for using Favorite Classmate Voting System.',13,10,'$'

    ; =============================================================
    ;               BUFFERS & DATABASE
    ; =============================================================
    ; Capture Buffers
    bufName         DB 30,0,30 DUP(0)   ; Max 30 chars for Name
    
    ; FIX: Size 5 allows 3 digits (e.g. "100") + Enter key.
    bufRating       DB 5,0,5 DUP(0)     
    
    bufID           DB 2,0,2 DUP(0)     ; Record selection buffer

    ; Data Arrays
    countVotes      DB 0                ; Total records
    storeNames      DB 300 DUP(0)       ; Names storage
    lenNames        DB 10 DUP(0)        ; Name lengths
    storeRates      DB 40 DUP(0)        ; Ratings storage
    lenRates        DB 10 DUP(0)        ; Rating lengths

.CODE

; -----------------------------------------------------------------
; PROC: PrintStr
; DESC: Standard DOS string print (ends with $)
; -----------------------------------------------------------------
PrintStr PROC
    mov ah, 09h
    int 21h
    ret
PrintStr ENDP

; -----------------------------------------------------------------
; PROC: PrintColorWord
; DESC: Prints 0-terminated string with color (BL)
; -----------------------------------------------------------------
PrintColorWord PROC
_nextChar:
    lodsb
    or al, al
    jz _doneColor

    ; Print char with color
    mov ah, 09h
    mov bh, 00h
    mov cx, 1
    int 10h

    ; Move cursor
    mov ah, 03h
    mov bh, 00h
    int 10h
    inc dl
    mov ah, 02h
    int 10h
    
    jmp _nextChar

_doneColor:
    ret
PrintColorWord ENDP

; -----------------------------------------------------------------
; PROC: ClearScreen
; DESC: Resets screen to white on black
; -----------------------------------------------------------------
ClearScreen PROC
    mov ax, 0600h
    mov bh, 07h
    xor cx, cx
    mov dx, 184Fh
    int 10h
    
    mov ah, 02h
    xor bx, bx
    xor dx, dx
    int 10h
    ret
ClearScreen ENDP

; -----------------------------------------------------------------
; PROC: ValidateRate
; DESC: Checks if bufRating contains a valid number 1-100.
; RETURNS: ZF=1 if Valid, ZF=0 if Invalid
; -----------------------------------------------------------------
ValidateRate PROC
    mov cl, [bufRating+1]   ; Get input length
    cmp cl, 0
    je _badRate
    cmp cl, 3
    ja _badRate             ; More than 3 chars is definitely wrong

    mov si, OFFSET bufRating+2

    ; CASE: 3 Digits (Must be "100")
    cmp cl, 3
    jne _check2
    mov al, [si]
    cmp al, '1'
    jne _badRate
    mov al, [si+1]
    cmp al, '0'
    jne _badRate
    mov al, [si+2]
    cmp al, '0'
    jne _badRate
    jmp _rateOk

_check2:
    ; CASE: 2 Digits (10-99)
    cmp cl, 2
    jne _check1
    ; First digit 1-9
    mov al, [si]
    cmp al, '1'
    jb _badRate
    cmp al, '9'
    ja _badRate
    ; Second digit 0-9
    mov al, [si+1]
    cmp al, '0'
    jb _badRate
    cmp al, '9'
    ja _badRate
    jmp _rateOk

_check1:
    ; CASE: 1 Digit (1-9). '0' is excluded as request says 1-100.
    mov al, [si]
    cmp al, '1'
    jb _badRate
    cmp al, '9'
    ja _badRate
    ; Fall through to OK

_rateOk:
    cmp ax, ax              ; Set ZF=1
    ret

_badRate:
    or al, 1                ; Clear ZF (ZF=0)
    ret
ValidateRate ENDP

; -----------------------------------------------------------------
; PROC: DoVote
; DESC: Logic for Adding a Vote
; -----------------------------------------------------------------
DoVote PROC
    call ClearScreen

    mov dx, OFFSET headerSys
    call PrintStr

    mov si, OFFSET keyVote
    mov bl, 6Fh 
    call PrintColorWord

    mov dx, OFFSET strCRLF
    call PrintStr

    ; 1. Input Name
    mov dx, OFFSET prmptName
    call PrintStr
    mov dx, OFFSET bufName
    mov ah, 0Ah
    int 21h

    mov dx, OFFSET strCRLF
    call PrintStr

    ; 2. Input Rating (Loop until valid)
_askRatingVote:
    mov dx, OFFSET prmptRate
    call PrintStr
    mov dx, OFFSET bufRating
    mov ah, 0Ah
    int 21h

    call ValidateRate       ; Check 1-100
    je _saveVote            ; If ZF=1, proceed

    ; Error handling
    mov dx, OFFSET errInvalidMsg
    call PrintStr
    jmp _askRatingVote      ; Ask again

_saveVote:
    push ds
    pop es

    ; Check Array Limit
    mov bl, countVotes
    xor bh, bh
    cmp bl, 10
    jae _memFull

    ; Save Lengths
    mov al, [bufName+1]
    mov [lenNames+bx], al
    mov al, [bufRating+1]
    mov [lenRates+bx], al

    ; Copy Name
    mov al, bl
    mov cl, 30
    mul cl
    mov di, OFFSET storeNames
    add di, ax
    mov si, OFFSET bufName+2
    mov cl, [bufName+1]
    xor ch, ch
    rep movsb

    ; Copy Rating
    mov al, countVotes
    mov cl, 4
    mul cl
    mov di, OFFSET storeRates
    add di, ax
    mov si, OFFSET bufRating+2
    mov cl, [bufRating+1]
    xor ch, ch
    rep movsb

    inc countVotes

_memFull:
    mov dx, OFFSET msgReturn
    call PrintStr
    mov ah, 08h
    int 21h
    ret
DoVote ENDP

; -----------------------------------------------------------------
; PROC: DoUpdate
; DESC: Logic for Updating a Vote
; -----------------------------------------------------------------
DoUpdate PROC
    call ClearScreen

    mov dx, OFFSET headerSys
    call PrintStr

    mov si, OFFSET keyUpd
    mov bl, 2Fh 
    call PrintColorWord

    mov dx, OFFSET strCRLF
    call PrintStr

    ; Check if empty
    xor bx, bx
    mov dl, countVotes
    xor dh, dh
    mov di, dx
    or di, di
    jne _listUpd
    jmp _noRecsUpd

_listUpd:
    ; Print ID
    mov al, bl
    inc al
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
    mov dl, '.'
    int 21h
    mov dl, ' '
    int 21h

    ; Print Name
    mov al, bl
    mov cl, 30
    mul cl
    mov si, OFFSET storeNames
    add si, ax
    mov cl, [lenNames+bx]
    xor ch, ch
_pN_U:
    jcxz _pN_U_Done
    lodsb
    mov dl, al
    mov ah, 02h
    int 21h
    loop _pN_U
_pN_U_Done:

    ; Separator
    mov dl, ' '
    mov ah, 02h
    int 21h
    mov dl, '-'
    int 21h
    mov dl, ' '
    int 21h

    ; Print Rate
    mov al, bl
    mov cl, 4
    mul cl
    mov si, OFFSET storeRates
    add si, ax
    mov cl, [lenRates+bx]
    xor ch, ch
_pR_U:
    jcxz _pR_U_Done
    lodsb
    mov dl, al
    mov ah, 02h
    int 21h
    loop _pR_U
_pR_U_Done:

    mov dx, OFFSET strCRLF
    call PrintStr

    inc bl
    cmp bx, di
    jb _listUpd

    ; Ask ID
    mov dx, OFFSET prmptUpdID
    call PrintStr
    mov dx, OFFSET bufID
    mov ah, 0Ah
    int 21h

    ; Parse ID
    mov cl, [bufID+1]
    test cl, cl
    jz _bailUpd
    
    mov si, OFFSET bufID+2
    mov al, [si]
    sub al, '0'
    jc _bailUpd
    
    cmp cl, 1
    je _digitOK_U
    
    ; Handle "10"
    mov bl, al
    mov al, [si+1]
    sub al, '0'
    jc _bailUpd
    mov ah, bl
    mov bl, 10
    mul bl
    add al, ah

_digitOK_U:
    or al, al
    jz _bailUpd
    mov bl, countVotes
    cmp al, bl
    ja _bailUpd
    
    dec al
    mov bl, al      ; BL = Target Index
    jmp _performUpd

_bailUpd:
    jmp _endUpd

_performUpd:
    mov dx, OFFSET strCRLF
    call PrintStr
    
    ; New Name
    mov dx, OFFSET prmptNewNm
    call PrintStr
    mov dx, OFFSET bufName
    mov ah, 0Ah
    int 21h

    mov dx, OFFSET strCRLF
    call PrintStr

    ; New Rating (with Validation Loop)
_askRatingUpd:
    mov dx, OFFSET prmptNewRt
    call PrintStr
    mov dx, OFFSET bufRating
    mov ah, 0Ah
    int 21h

    call ValidateRate
    je _saveUpdate

    mov dx, OFFSET errInvalidMsg
    call PrintStr
    jmp _askRatingUpd

_saveUpdate:
    push ds
    pop es

    ; Save Name
    mov al, bl
    mov cl, 30
    mul cl
    mov di, OFFSET storeNames
    add di, ax
    mov al, [bufName+1]
    mov [lenNames+bx], al
    mov cl, al
    xor ch, ch
    mov si, OFFSET bufName+2
    rep movsb

    ; Save Rate
    mov al, bl
    mov cl, 4
    mul cl
    mov di, OFFSET storeRates
    add di, ax
    mov al, [bufRating+1]
    mov [lenRates+bx], al
    mov cl, al
    xor ch, ch
    mov si, OFFSET bufRating+2
    rep movsb

_endUpd:
    mov dx, OFFSET msgReturn
    call PrintStr
    mov ah, 08h
    int 21h
    ret

_noRecsUpd:
    mov dx, OFFSET msgNoRecs
    call PrintStr
    mov ah, 08h
    int 21h
    ret
DoUpdate ENDP

; -----------------------------------------------------------------
; PROC: DoView
; DESC: Logic for Viewing Votes
; -----------------------------------------------------------------
DoView PROC
    call ClearScreen

    mov dx, OFFSET headerSys
    call PrintStr

    mov si, OFFSET keyView
    mov bl, 4Fh
    call PrintColorWord

    mov dx, OFFSET strCRLF
    call PrintStr

    xor bx, bx
    xor di, di
    mov dl, countVotes
    xor dh, dh
    mov di, dx
    test di, di
    jz _viewEmpty

_loopV:
    ; Number
    mov al, bl
    inc al
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
    mov dl, '.'
    int 21h
    mov dl, ' '
    int 21h

    ; Name
    mov al, bl
    mov cl, 30
    mul cl
    mov si, OFFSET storeNames
    add si, ax
    mov cl, [lenNames+bx]
    xor ch, ch
_pN_V:
    jcxz _pN_V_D
    lodsb
    mov dl, al
    mov ah, 02h
    int 21h
    loop _pN_V
_pN_V_D:

    ; Dash
    mov dl, ' '
    mov ah, 02h
    int 21h
    mov dl, '-'
    int 21h
    mov dl, ' '
    int 21h

    ; Rate
    mov al, bl
    mov cl, 4
    mul cl
    mov si, OFFSET storeRates
    add si, ax
    mov cl, [lenRates+bx]
    xor ch, ch
_pR_V:
    jcxz _pR_V_D
    lodsb
    mov dl, al
    mov ah, 02h
    int 21h
    loop _pR_V
_pR_V_D:

    mov dx, OFFSET strCRLF
    call PrintStr

    inc bl
    cmp bx, di
    jb _loopV

_viewEmpty:
    mov dx, OFFSET msgReturn
    call PrintStr
    mov ah, 08h
    int 21h
    ret
DoView ENDP

; -----------------------------------------------------------------
; PROC: DoDelete
; DESC: Logic for Deleting a Vote
; -----------------------------------------------------------------
DoDelete PROC
    call ClearScreen

    mov dx, OFFSET headerSys
    call PrintStr

    mov si, OFFSET keyDel
    mov bl, 1Fh 
    call PrintColorWord

    mov dx, OFFSET strCRLF
    call PrintStr

    xor bx, bx
    mov dl, countVotes
    xor dh, dh
    mov di, dx
    or di, di
    jne _listDel
    jmp _noRecsDel

_listDel:
    ; Number
    mov al, bl
    inc al
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
    mov dl, '.'
    int 21h
    mov dl, ' '
    int 21h

    ; Name
    mov al, bl
    mov cl, 30
    mul cl
    mov si, OFFSET storeNames
    add si, ax
    mov cl, [lenNames+bx]
    xor ch, ch
_dN_L:
    jcxz _dN_L_D
    lodsb
    mov dl, al
    mov ah, 02h
    int 21h
    loop _dN_L
_dN_L_D:

    ; Separator
    mov dl, ' '
    mov ah, 02h
    int 21h
    mov dl, '-'
    int 21h
    mov dl, ' '
    int 21h

    ; Rate
    mov al, bl
    mov cl, 4
    mul cl
    mov si, OFFSET storeRates
    add si, ax
    mov cl, [lenRates+bx]
    xor ch, ch
_dR_L:
    jcxz _dR_L_D
    lodsb
    mov dl, al
    mov ah, 02h
    int 21h
    loop _dR_L
_dR_L_D:

    mov dx, OFFSET strCRLF
    call PrintStr

    inc bl
    cmp bx, di
    jb _listDel

    ; Prompt
    mov dx, OFFSET prmptDelID
    call PrintStr
    mov dx, OFFSET bufID
    mov ah, 0Ah
    int 21h
    mov dx, OFFSET strCRLF
    call PrintStr

    ; Validate
    mov cl, [bufID+1]
    test cl, cl
    jnz _chkInp
    jmp _delExitJump
_chkInp:
    mov si, OFFSET bufID+2
    mov al, [si]
    sub al, '0'
    jnc _d1OK
    jmp _delExitJump
_d1OK:
    cmp cl, 1
    je _dHasVal
    mov bl, al
    mov al, [si+1]
    sub al, '0'
    jnc _d2OK
    jmp _delExitJump
_d2OK:
    mov ah, bl
    mov bl, 10
    mul bl
    add al, ah

_dHasVal:
    ; FIX: Using logic to avoid "Relative jump out of range"
    ; Instead of "jz _finDel", we use "jnz _continue" and "jmp _finDel"
    or al, al
    jnz _dNotZero
    jmp _delExitJump

_dNotZero:
    mov bl, countVotes
    cmp al, bl
    jbe _validDel
    jmp _delExitJump

_validDel:
    dec al          ; 0-based
    mov bl, al

    push ds
    pop es

    ; Last item check
    mov al, countVotes
    dec al
    cmp bl, al
    je _fastDel

    ; Shift Loop
    mov dh, countVotes
    dec dh
    mov bh, bl      ; Dest

_shiftIter:
    mov bl, bh
    mov dl, bl      ; DL=Dest
    inc bl          ; BL=Source

    ; Shift Lens
    mov al, [lenNames+bx]
    mov bl, dl
    mov [lenNames+bx], al

    mov bl, bh
    inc bl
    mov dl, bl
    dec dl
    mov al, [lenRates+bx]
    mov bl, dl
    mov [lenRates+bx], al

    ; Shift Name Data
    mov al, bh
    mov cl, 30
    mul cl
    mov di, OFFSET storeNames
    add di, ax

    mov al, bh
    inc al
    mov cl, 30
    mul cl
    mov si, OFFSET storeNames
    add si, ax

    mov cx, 30
    rep movsb

    ; Shift Rate Data
    mov al, bh
    mov cl, 4
    mul cl
    mov di, OFFSET storeRates
    add di, ax

    mov al, bh
    inc al
    mov cl, 4
    mul cl
    mov si, OFFSET storeRates
    add si, ax

    mov cx, 4
    rep movsb

    inc bh
    cmp bh, dh
    jb _shiftIter

_fastDel:
    dec countVotes

_delExitJump:
    mov dx, OFFSET msgDelDone
    call PrintStr
    mov ah, 08h
    int 21h
    ret

_noRecsDel:
    mov dx, OFFSET msgNoRecs
    call PrintStr
    mov ah, 08h
    int 21h
    ret
DoDelete ENDP

; -----------------------------------------------------------------
; PROC: MainMenu
; DESC: Main Loop
; -----------------------------------------------------------------
MainMenu PROC
    call ClearScreen

    mov dx, OFFSET textSchool
    call PrintStr

    mov si, OFFSET keyVote
    mov bl, 6Fh
    call PrintColorWord

    mov dx, OFFSET menuLine2
    call PrintStr
    mov si, OFFSET keyView
    mov bl, 4Fh
    call PrintColorWord

    mov dx, OFFSET menuLine3
    call PrintStr
    mov si, OFFSET keyUpd
    mov bl, 2Fh 
    call PrintColorWord

    mov dx, OFFSET menuLine4
    call PrintStr
    mov si, OFFSET keyDel
    mov bl, 1Fh 
    call PrintColorWord

    mov dx, OFFSET menuLine5
    call PrintStr

    mov ah, 01h
    int 21h

    cmp al, '1'
    je _sVote
    cmp al, '2'
    je _sView
    cmp al, '3'
    je _sUpd
    cmp al, '4'
    je _sDel
    cmp al, '5'
    je _sExit

    jmp MainMenu

_sVote:
    call DoVote
    jmp MainMenu
_sView:
    call DoView
    jmp MainMenu
_sUpd:
    call DoUpdate
    jmp MainMenu
_sDel:
    call DoDelete
    jmp MainMenu

_sExit:
    mov dx, OFFSET msgExit
    call PrintStr
    ret
MainMenu ENDP

; -----------------------------------------------------------------
; MAIN
; -----------------------------------------------------------------
MAIN PROC
    mov ax, @data
    mov ds, ax
    mov es, ax

    mov ax, 0003h
    int 10h

    call MainMenu

    mov ax, 4C00h
    int 21h
MAIN ENDP

END MAIN
