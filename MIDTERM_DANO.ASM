; Filename: MIDTERM_DANO.ASM
; CIT-U Bank Automatic Teller Machine
; Name: Helge Justine O. Dano
; Date: October 24, 2025

.model small
.stack 100h
.data
    bank db 'CIT-U BANK                                                                      $'
    automatic db 'Automatic Teller Machine$'
    copyright db 'Copyright 2025$'
    programmer db 'Programmer: HELGE JUSTINE O. DANO$'
    welcome db 'Welcome!$'

    pleaseinsert db 'Please insert your card.$'
    pin db 'Enter your PIN: $'
    wrongpin db 'WRONG PIN!$'

    menu db 'MAIN MENU$'
    balance db '1 Balance Inquiry$'
    deposit db '2 Deposit$'
    withdraw db '3 Withdraw$'
    pay db '4 Pay Bills$'
    exit db '5 Exit$'
    choice db 'Please enter number of your choice: $'
    wrongchoice db 'WRONG CHOICE!$'

    capbalance db 'BALANCE INQUIRY$'
    capdeposity db 'DEPOSIT$'
    capwithdraw db 'WITHDRAW$'
    cappay db 'PAY BILLS$'
    capexit db 'EXIT$'
    continue db 'Continue? Y/N: $'
    pleaseget db 'Please get your card. Thank you.$'

    correctpin db '1234$'
    input db 6      ; max length user can type (4 digits + enter)
        db ?       ; actual number of chars typed (filled by DOS)
        db 6 dup(?) ; buffer
    number db ?
    yesno db ?

.code
ProgramStart:
    mov ax, @data
    mov ds, ax

StartATM:
    call ClearScreen
    
    ; Set background to red (4h) for entire screen
    mov ax, 0600h
    mov bh, 4Eh          ; Yellow on red
    mov cx, 0000h
    mov dx, 184Fh
    int 10h
    
    ; Reset cursor
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 10h

    ; Display bank
    mov bl, 4Eh
    lea dx, bank
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display automatic
    mov bl, 4Eh
    lea dx, automatic
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display copyright
    mov bl, 4Eh
    lea dx, copyright
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display programmer
    mov bl, 4Eh
    lea dx, programmer
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display welcome
    mov bl, 4Eh
    lea dx, welcome
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h
    mov dl, 10
    int 21h

    ; Display please insert card
    mov bl, 4Eh
    lea dx, pleaseinsert
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display PIN prompt
    mov bl, 4Eh
    lea dx, pin
    call print_colored

    ; Read PIN using buffered input
    mov ah, 0Ah
    lea dx, input
    int 21h
    
    ; Add string terminator
    lea di, input+2
    mov cl, [input+1]
    xor ch, ch
    add di, cx
    mov byte ptr [di], '

    ; Compare PIN
    lea si, correctpin
    lea di, input+2

ComparePINLoop:
    mov al, [si]
    mov bl, [di]

    cmp al, '$'
    je PINCorrect

    cmp al, bl
    jne PINIncorrect

    inc si
    inc di
    jmp ComparePINLoop

PINCorrect:
    ; PIN is correct, show main menu
    jmp MainMenujmp1

PINIncorrect:
    ; PIN is wrong, show blinking message
    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display WRONG PIN with blinking attribute
    mov bl, 8Eh          ; Blinking yellow on red (8h = blink bit)
    lea dx, wrongpin
    call print_colored

    ; Wait for key press
    mov ah, 08h
    int 21h

    ; Restart
    jmp StartATM

MainMenujmp1:
    jmp MainMenuLoop

MainMenuLoop:
    call ShowMainMenu
    
    ; Get user choice (wait for Enter)
    mov ah, 01h
    int 21h
    mov number, al
    
    ; Wait for Enter key
    cmp al, 0Dh
    je GotChoice
    
WaitEnterMenu:
    mov ah, 01h
    int 21h
    cmp al, 0Dh
    jne WaitEnterMenu
    
GotChoice:
    
    ; Check choice
    cmp number, '1'
    je Balancejmp1
    cmp number, '2'
    je Depositjmp1
    cmp number, '3'
    je Withdrawjmp1
    cmp number, '4'
    je PayBillsjmp1
    cmp number, '5'
    je Exitjmp1
    cmp number, 0Dh      ; If Enter was first key pressed
    jmp WrongChoiceDisplay
    
WrongChoiceDisplay:
    ; Wrong choice - display on same screen
    mov bl, 8Eh          ; Blinking yellow on red
    lea dx, wrongchoice
    call print_colored
    
    ; Wait for key press
    mov ah, 08h
    int 21h
    
    jmp MainMenuLoop

Balancejmp1:
    jmp BalanceInquiry
Depositjmp1:
    jmp Depositjmp2
Withdrawjmp1:
    jmp Withdrawjmp2
PayBillsjmp1:
    jmp PayBillsjmp2
Exitjmp1:
    jmp Exitjmp2

BalanceInquiry:
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, capbalance
    call print_colored
    
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, continue
    call print_colored
    
    ; Get Y/N input (wait for Enter)
    mov ah, 01h
    int 21h
    mov yesno, al
    
    ; Wait for Enter key
    cmp al, 0Dh
    je CheckYesNoBalance
    
WaitEnterBalance:
    mov ah, 01h
    int 21h
    cmp al, 0Dh
    jne WaitEnterBalance
    
CheckYesNoBalance:
    
    cmp yesno, 'Y'
    je MainMenujmp2
    cmp yesno, 'y'
    je MainMenujmp2
    cmp yesno, 'N'
    je ExitNoMenujmp1
    cmp yesno, 'n'
    je ExitNoMenujmp1
    
    jmp MainMenujmp2

MainMenujmp2:
    jmp MainMenuLoop

Depositjmp2:
    jmp DepositOption
Withdrawjmp2:
    jmp Withdrawjmp3
PayBillsjmp2:
    jmp PayBillsjmp3
Exitjmp2:
    jmp Exitjmp4

DepositOption:
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, capdeposity
    call print_colored
    
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, continue
    call print_colored
    
    ; Get Y/N input (wait for Enter)
    mov ah, 01h
    int 21h
    mov yesno, al
    
    ; Wait for Enter key
    cmp al, 0Dh
    je CheckYesNoDeposit
    
WaitEnterDeposit:
    mov ah, 01h
    int 21h
    cmp al, 0Dh
    jne WaitEnterDeposit
    
CheckYesNoDeposit:
    
    cmp yesno, 'Y'
    je MainMenujmp3
    cmp yesno, 'y'
    je MainMenujmp3
    cmp yesno, 'N'
    je ExitNoMenujmp2
    cmp yesno, 'n'
    je ExitNoMenujmp2
    
    jmp MainMenujmp3

MainMenujmp3:
    jmp MainMenuLoop

Withdrawjmp3:
    jmp WithdrawOption
PayBillsjmp3:
    jmp PayBillsjmp4
ExitNoMenujmp1:
    jmp ExitNoMenujmp5
Exitjmp3:
    jmp Exitjmp6
Exitjmp4:
    jmp Exitjmp7

WithdrawOption:
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, capwithdraw
    call print_colored
    
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, continue
    call print_colored
    
    ; Get Y/N input (wait for Enter)
    mov ah, 01h
    int 21h
    mov yesno, al
    
    ; Wait for Enter key
    cmp al, 0Dh
    je CheckYesNoWithdraw
    
WaitEnterWithdraw:
    mov ah, 01h
    int 21h
    cmp al, 0Dh
    jne WaitEnterWithdraw
    
CheckYesNoWithdraw:
    
    cmp yesno, 'Y'
    je MainMenujmp4
    cmp yesno, 'y'
    je MainMenujmp4
    cmp yesno, 'N'
    je ExitNoMenujmp3
    cmp yesno, 'n'
    je ExitNoMenujmp3
    
    jmp MainMenujmp4

MainMenujmp4:
    jmp MainMenuLoop

PayBillsjmp4:
    jmp PayBillsOption
ExitNoMenujmp2:
    jmp ExitNoMenujmp6
ExitNoMenujmp3:
    jmp ExitNoMenujmp7
Exitjmp5:
    jmp Exitjmp9
Exitjmp6:
    jmp Exitjmp10
Exitjmp7:
    jmp Exitjmp11

PayBillsOption:
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, cappay
    call print_colored
    
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, continue
    call print_colored
    
    ; Get Y/N input (wait for Enter)
    mov ah, 01h
    int 21h
    mov yesno, al
    
    ; Wait for Enter key
    cmp al, 0Dh
    je CheckYesNoPayBills
    
WaitEnterPayBills:
    mov ah, 01h
    int 21h
    cmp al, 0Dh
    jne WaitEnterPayBills
    
CheckYesNoPayBills:
    
    cmp yesno, 'Y'
    je MainMenujmp5
    cmp yesno, 'y'
    je MainMenujmp5
    cmp yesno, 'N'
    je ExitNoMenujmp4
    cmp yesno, 'n'
    je ExitNoMenujmp4
    
    jmp MainMenujmp5

MainMenujmp5:
    jmp MainMenuLoop

ExitNoMenujmp4:
    jmp ExitNoMenujmp8
ExitNoMenujmp5:
    jmp ExitNoMenu
ExitNoMenujmp6:
    jmp ExitNoMenu
ExitNoMenujmp7:
    jmp ExitNoMenu
ExitNoMenujmp8:
    jmp ExitNoMenu
Exitjmp8:
    jmp ExitOption
Exitjmp9:
    jmp ExitOption
Exitjmp10:
    jmp ExitOption
Exitjmp11:
    jmp ExitOption
Exitjmp12:
    jmp ExitOption

ExitNoMenu:
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, pleaseget
    call print_colored
    
    ; Exit program
    mov ah, 4Ch
    int 21h

ExitOption:
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, capexit
    call print_colored
    
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, pleaseget
    call print_colored
    
    ; Exit program
    mov ah, 4Ch
    int 21h

; ===== PROCEDURES =====

ShowMainMenu proc
    push ax
    push bx
    push dx
    
    call ClearScreen
    
    ; Set background to red for entire screen
    mov ax, 0600h
    mov bh, 4Eh
    mov cx, 0000h
    mov dx, 184Fh
    int 10h
    
    ; Reset cursor
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 10h

    ; Display bank
    mov bl, 4Eh
    lea dx, bank
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display automatic
    mov bl, 4Eh
    lea dx, automatic
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display copyright
    mov bl, 4Eh
    lea dx, copyright
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display programmer
    mov bl, 4Eh
    lea dx, programmer
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display welcome
    mov bl, 4Eh
    lea dx, welcome
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h
    mov dl, 10
    int 21h

    ; Display MAIN MENU
    mov bl, 4Eh
    lea dx, menu
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display 1 Balance Inquiry
    mov bl, 4Eh
    lea dx, balance
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display 2 Deposit
    mov bl, 4Eh
    lea dx, deposit
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display 3 Withdraw
    mov bl, 4Eh
    lea dx, withdraw
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display 4 Pay Bills
    mov bl, 4Eh
    lea dx, pay
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display 5 Exit
    mov bl, 4Eh
    lea dx, exit
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display choice prompt
    mov bl, 4Eh
    lea dx, choice
    call print_colored

    pop dx
    pop bx
    pop ax
    ret
ShowMainMenu endp

ClearScreen proc
    push ax
    push bx
    push cx
    push dx
    
    mov ax, 0600h
    mov bh, 07h
    mov cx, 0000h
    mov dx, 184Fh
    int 10h
    
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 10h
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret
ClearScreen endp

reset_color proc
    push ax
    push bx
    push cx
    
    mov ah, 09h
    mov al, ' '
    mov bl, 4Eh
    mov bh, 0
    mov cx, 1
    int 10h
    
    pop cx
    pop bx
    pop ax
    ret
reset_color endp

print_normal proc
    push ax
    mov ah, 09h
    int 21h
    pop ax
    ret
print_normal endp

print_colored proc
    push ax
    push bx
    push cx
    push dx
    push si
    
    mov si, dx
    
    mov ah, 03h
    mov bh, 0
    int 10h
    
next_char:
    mov al, [si]
    cmp al, '$'
    je done_color
    
    mov ah, 09h
    mov bh, 0
    mov cx, 1
    int 10h
    
    inc si
    inc dl
    mov ah, 02h
    int 10h
    jmp next_char
    
done_color:
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_colored endp

end ProgramStart

    ; Compare PIN
    lea si, correctpin
    lea di, input

ComparePINLoop:
    mov al, [si]
    mov bl, [di]

    cmp al, '$'
    je PINCorrect

    cmp al, bl
    jne PINIncorrect

    inc si
    inc di
    jmp ComparePINLoop

PINCorrect:
    ; PIN is correct, show main menu
    jmp MainMenujmp1

PINIncorrect:
    ; PIN is wrong, show blinking message
    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display WRONG PIN with blinking attribute
    mov bl, 8Eh          ; Blinking yellow on red (8h = blink bit)
    lea dx, wrongpin
    call print_colored

    ; Wait for key press
    mov ah, 08h
    int 21h

    ; Restart
    jmp StartATM

MainMenujmp1:
    jmp MainMenuLoop

MainMenuLoop:
    call ShowMainMenu
    
    ; Get user choice
    mov ah, 01h
    int 21h
    mov number, al
    
    ; Check choice
    cmp number, '1'
    je Balancejmp1
    cmp number, '2'
    je Depositjmp1
    cmp number, '3'
    je Withdrawjmp1
    cmp number, '4'
    je PayBillsjmp1
    cmp number, '5'
    je Exitjmp1
    
    ; Wrong choice
    mov bl, 8Eh          ; Blinking yellow on red
    lea dx, wrongchoice
    call print_colored
    
    ; Wait for key press
    mov ah, 08h
    int 21h
    
    jmp MainMenuLoop

Balancejmp1:
    jmp BalanceInquiry
Depositjmp1:
    jmp Depositjmp2
Withdrawjmp1:
    jmp Withdrawjmp2
PayBillsjmp1:
    jmp PayBillsjmp2
Exitjmp1:
    jmp Exitjmp2

BalanceInquiry:
    mov ah, 02h
    mov dl, 10
    int 21h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, capbalance
    call print_colored
    
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, continue
    call print_colored
    
    ; Get Y/N input
    mov ah, 01h
    int 21h
    mov yesno, al
    
    cmp yesno, 'Y'
    je MainMenujmp2
    cmp yesno, 'y'
    je MainMenujmp2
    cmp yesno, 'N'
    je Exitjmp3
    cmp yesno, 'n'
    je Exitjmp3
    
    jmp MainMenujmp2

MainMenujmp2:
    jmp MainMenuLoop

Depositjmp2:
    jmp DepositOption
Withdrawjmp2:
    jmp Withdrawjmp3
PayBillsjmp2:
    jmp PayBillsjmp3
Exitjmp2:
    jmp Exitjmp4

DepositOption:
    mov ah, 02h
    mov dl, 10
    int 21h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, capdeposity
    call print_colored
    
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, continue
    call print_colored
    
    ; Get Y/N input
    mov ah, 01h
    int 21h
    mov yesno, al
    
    cmp yesno, 'Y'
    je MainMenujmp3
    cmp yesno, 'y'
    je MainMenujmp3
    cmp yesno, 'N'
    je Exitjmp5
    cmp yesno, 'n'
    je Exitjmp5
    
    jmp MainMenujmp3

MainMenujmp3:
    jmp MainMenuLoop

Withdrawjmp3:
    jmp WithdrawOption
PayBillsjmp3:
    jmp PayBillsjmp4
Exitjmp3:
    jmp Exitjmp6
Exitjmp4:
    jmp Exitjmp7

WithdrawOption:
    mov ah, 02h
    mov dl, 10
    int 21h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, capwithdraw
    call print_colored
    
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, continue
    call print_colored
    
    ; Get Y/N input
    mov ah, 01h
    int 21h
    mov yesno, al
    
    cmp yesno, 'Y'
    je MainMenujmp4
    cmp yesno, 'y'
    je MainMenujmp4
    cmp yesno, 'N'
    je Exitjmp8
    cmp yesno, 'n'
    je Exitjmp8
    
    jmp MainMenujmp4

MainMenujmp4:
    jmp MainMenuLoop

PayBillsjmp4:
    jmp PayBillsOption
Exitjmp5:
    jmp Exitjmp9
Exitjmp6:
    jmp Exitjmp10
Exitjmp7:
    jmp Exitjmp11

PayBillsOption:
    mov ah, 02h
    mov dl, 10
    int 21h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, cappay
    call print_colored
    
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, continue
    call print_colored
    
    ; Get Y/N input
    mov ah, 01h
    int 21h
    mov yesno, al
    
    cmp yesno, 'Y'
    je MainMenujmp5
    cmp yesno, 'y'
    je MainMenujmp5
    cmp yesno, 'N'
    je Exitjmp12
    cmp yesno, 'n'
    je Exitjmp12
    
    jmp MainMenujmp5

MainMenujmp5:
    jmp MainMenuLoop

Exitjmp8:
    jmp ExitOption
Exitjmp9:
    jmp ExitOption
Exitjmp10:
    jmp ExitOption
Exitjmp11:
    jmp ExitOption
Exitjmp12:
    jmp ExitOption

ExitOption:
    mov ah, 02h
    mov dl, 10
    int 21h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, capexit
    call print_colored
    
    mov ah, 02h
    mov dl, 10
    int 21h
    
    mov bl, 4Eh
    lea dx, pleaseget
    call print_colored
    
    ; Exit program
    mov ah, 4Ch
    int 21h

; ===== PROCEDURES =====

ShowMainMenu proc
    push ax
    push bx
    push dx
    
    call ClearScreen
    
    ; Set background to red for entire screen
    mov ax, 0600h
    mov bh, 4Eh
    mov cx, 0000h
    mov dx, 184Fh
    int 10h
    
    ; Reset cursor
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 10h

    ; Display bank
    mov bl, 4Eh
    lea dx, bank
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display automatic
    mov bl, 4Eh
    lea dx, automatic
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display copyright
    mov bl, 4Eh
    lea dx, copyright
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display programmer
    mov bl, 4Eh
    lea dx, programmer
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display welcome
    mov bl, 4Eh
    lea dx, welcome
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h
    mov dl, 10
    int 21h

    ; Display MAIN MENU
    mov bl, 4Eh
    lea dx, menu
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display 1 Balance Inquiry
    mov bl, 4Eh
    lea dx, balance
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display 2 Deposit
    mov bl, 4Eh
    lea dx, deposit
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display 3 Withdraw
    mov bl, 4Eh
    lea dx, withdraw
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display 4 Pay Bills
    mov bl, 4Eh
    lea dx, pay
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display 5 Exit
    mov bl, 4Eh
    lea dx, exit
    call print_colored

    mov ah, 02h
    mov dl, 10
    int 21h

    ; Display choice prompt
    mov bl, 4Eh
    lea dx, choice
    call print_colored

    pop dx
    pop bx
    pop ax
    ret
ShowMainMenu endp

ClearScreen proc
    push ax
    push bx
    push cx
    push dx
    
    mov ax, 0600h
    mov bh, 07h
    mov cx, 0000h
    mov dx, 184Fh
    int 10h
    
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 10h
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret
ClearScreen endp

reset_color proc
    push ax
    push bx
    push cx
    
    mov ah, 09h
    mov al, ' '
    mov bl, 4Eh
    mov bh, 0
    mov cx, 1
    int 10h
    
    pop cx
    pop bx
    pop ax
    ret
reset_color endp

print_normal proc
    push ax
    mov ah, 09h
    int 21h
    pop ax
    ret
print_normal endp

print_colored proc
    push ax
    push bx
    push cx
    push dx
    push si
    
    mov si, dx
    
    mov ah, 03h
    mov bh, 0
    int 10h
    
next_char:
    mov al, [si]
    cmp al, '$'
    je done_color
    
    mov ah, 09h
    mov bh, 0
    mov cx, 1
    int 10h
    
    inc si
    inc dl
    mov ah, 02h
    int 10h
    jmp next_char
    
done_color:
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_colored endp

end ProgramStart