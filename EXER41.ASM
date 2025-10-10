; Filename: EXER41.ASM
; Programmer Name: Helge Justine O. Dano
; Date: October 10, 2025
; Description: Repeatedly display an ATM main menu until the user presses "e" for Exit. Pressing a valid letter from the main menu will display the name of the ATM operation. Display INVALID INPUT! if wrong choice.

.model small
.stack 100h
.data
  header db 'CIT-U ATM$'

  ; prompts
  balance db 10,10,'a. Balance Inquiry$'
  deposit db 10,'b. Deposit$'
  withdraw db 10,'c. Withdraw$'
  bills db 10,'d. Bills Payment$'
  exit db 10,'e. Exit$'

  ; choice and invalid input
  choice db 10,10,'Enter your choice: $'
  invalid db 10,10,'INVALID INPUT!',10,10,10,'$'

  ; output
  balance_msg db 10,10,'Balance Inquiry',10,10,10,'$'
  deposit_msg db 10,10,'Deposit',10,10,10,'$'
  withdraw_msg db 10,10,'Withdraw',10,10,10,'$'
  bills_msg db 10,10,'Bills Payment',10,10,10,'$'
  exit_msg db 10,10,'Exit. Thank you!$'

.code
ProgramStart:
  EchoLoop:
    ; Set up the data segment
    mov ax, @data
    mov ds, ax

    ; Display the ATM title
    mov ah, 09h
    lea dx, header
    int 21h

    ; Display the main menu options
    mov ah, 09h
    lea dx, balance
    int 21h
    lea dx, deposit
    int 21h
    lea dx, withdraw
    int 21h
    lea dx, bills
    int 21h
    lea dx, exit
    int 21h

    ; Prompt for user choice
    mov ah, 09h
    lea dx, choice
    int 21h

    ; Get user input for choice
    mov ah, 01h ; DOS get character function
    int 21h ; get single character response

    cmp al, 'a' ; check if 'a'
    je ShowBalanceInquiry
    cmp al, 'b' ; check if 'b'
    je ShowDeposit
    cmp al, 'c' ; check if 'c'
    je ShowWithdraw
    cmp al, 'd' ; check if 'd'
    je ShowBillsPayment
    cmp al, 'e' ; check if 'e'
    je ExitATM

    ; If input is not valid, display invalid input message
    mov ah, 09h
    lea dx, invalid
    int 21h ; display invalid input message
    jmp EchoLoop ; loop back to display menu again

ShowBalanceInquiry:
    mov ah, 09h
    lea dx, balance_msg
    int 21h ; display balance inquiry message
    jmp EchoLoop ; loop back to display menu again

ShowDeposit:
    mov ah, 09h
    lea dx, deposit_msg
    int 21h ; display deposit message
    jmp EchoLoop ; loop back to display menu again

ShowWithdraw:
    mov ah, 09h
    lea dx, withdraw_msg
    int 21h ; display withdraw message
    jmp EchoLoop ; loop back to display menu again
    
ShowBillsPayment:
    mov ah, 09h
    lea dx, bills_msg
    int 21h ; display bills payment message
    jmp EchoLoop ; loop back to display menu again

ExitATM:
    mov ah, 09h
    lea dx, exit_msg
    int 21h ; display exit message
    mov ah, 4ch ; DOS terminate program function
    int 21h ; terminate the program

END ProgramStart